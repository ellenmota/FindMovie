//
//  TableViewCell.swift
//  FindMovie
//
//  Created by Ellen Bianca Mota de Carvalho on 19/06/17.
//  Copyright © 2017 Ellen Bianca Mota de Carvalho. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageMovie: UIImageView!
    
    @IBOutlet weak var titleMovie: UILabel!
    
    @IBOutlet weak var genderMovie: UILabel!
    
    @IBOutlet weak var runtimeMovie: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
