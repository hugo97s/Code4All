# Code4AllPackage

## Instalação 
Passo a passo para adicionar o package Code4All de forma local ao seu projeto Swift usando o Xcode e o Swift Package Manager (SPM):

1. Abra o Projeto no Xcode:
   Abra o Xcode e carregue o projeto ao qual você deseja adicionar o pacote local.

2. Abra o Menu "File":
   No menu superior do Xcode, clique em "File".

3. Selecione "Add Packages" :
   No menu "File", selecione " Packages".

4. Escolha "Add Local...":
   No submenu "Add Local", localize o Pacote Local(Code4AllPackage).

5. Clique em "Add Package":
   Depois de selecionar o alvo de destino, clique no botão "Add Package".

6. Importe e Use o Pacote:
    Agora que o pacote local foi adicionado ao seu projeto, você pode importá-lo "import Code4AllPackage" e começar a usá-lo em seu código.

Como adicionar de maneira remota: 

Para intalar este pacote importe a url: "https://github.com/hugo97s/Code4All"  no SPM
## Exemplo de uso

```swift
struct ContentView: View { 
    var body: some View { 
        VStack(spacing: 5) {
        Text4All(text: "Sign up", size:40, accessibilityTextInfo: "Sign up")
            .padding(.trailing, 220)
        }
    }
}
```

