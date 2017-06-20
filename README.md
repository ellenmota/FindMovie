# FindMovie
Busca a partir do nome do filme, mas informações do mesmo.

## Dependências Necessárias
No mini projeto foi utilizado requisições JSON, para facilitara serialização utilizei a dependecia ou pod [Alamofire] (https://github.com/Alamofire/Alamofire)

Nota: Se não tiver instalado o cocoapods (gerenciador de dependecias), segue o primeiro passo, senão, só ignorar.

### 1 - Intalação do cocoapods

No terminal
```
$ sudo gem install cocoa pods
```

Agora você pode instalar suas dependecias...

### 2 - Ir no diretório correto
Através do terminal navegue até a pasta do seu projeto swift.
E cria um arquivo **podfile**, este arquivo que o projeto vai "ler" suas dependencias.

```
$ pod init
```

Após isso, abre este arquivo com algum editor de texto e coloque:

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Alamofire', '~> 4.4'
end
```
(mais informações ver [aqui](https://github.com/Alamofire/Alamofire))

E salve!

### 3 - Instalação do pod
Volte ao terminal e instala seu pod:

```
$ pod install
```

Espere terminar, volte a pasta do seu projeto e reparará que vai ter um outro arquivo com a extensão **xcworkspace**, só abrir o mesmo!

E importar:

```
import Alamofire
```
Mais informações([Alamofire](https://github.com/Alamofire/Alamofire))

Boa sorte ;)
