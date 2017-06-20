//
//  ViewController.swift
//  FindMovie
//
//  Created by Ellen Bianca Mota de Carvalho on 18/06/17.
//  Copyright © 2017 Ellen Bianca Mota de Carvalho. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate
{
   

    @IBOutlet weak var tableView: UITableView!
    
    let urlString = "http://www.json-generator.com/api/json/get/cpMVloHGHm?indent=2"
    
    
    var movies:[Movie]? = nil

    
    //Retorna o numero de celulas
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return movies?.count ?? 0
    }
    
    
    //Identificação da celula
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
        cell.titleMovie.text = "ede"
        cell.genderMovie.text = "Action / Adventure / Fantasy"
        cell.runtimeMovie.text = "121 min"
        //tableView.reloadData()

        return cell
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        
        //Json Test
        findJson { (movieList) in
            if let movies = movieList {
                self.movies = movies
                OperationQueue.main.addOperation({ 
                       self.tableView.reloadData()
                })
            }
        }
    }
    
    public func findJson(_ completion:@escaping ([Movie]?) -> Void)
    {
        
        
        Alamofire.request(urlString).responseJSON { response in
            if let JSON = response.result.value as? [String:AnyObject]
            {
                
                if let movieList = JSON["filmes"] as? [[String:AnyObject]] {
                    
                    var movieArray = [Movie]()
                
                    for movie in movieList {
                        //Trata o filme
                        let title = movie["titulo"] as? String
                        let duration = movie["duracao"] as? Int
                        let genre = movie["genero"] as? String
                        //Montar o objeto
                        if let title = title, let duration = duration, let genre = genre {
                            let movieData = Movie(title: title, duration: duration, genre: genre)
                            movieArray.append(movieData)
                        }
                        
                    }
                    
                    
                    completion(movieArray)

                    
                } else {
                    //Nao consegui tratar os dados corretamente
                    completion(nil)
                }
                
               
            } else {
                //Nao consegui um response correto
                completion(nil)
            }
        
        }
    }
    

        
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

