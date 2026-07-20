// ======================================
// Swift Language Semantic Preview
// Swift 5+
// ======================================


// ---------- Variables ----------

// constante
let nome: String = "Esron"

// variável mutável
var idade: Int = 30

// inferência de tipo
let linguagem = "Swift"



// ---------- Basic Types ----------

let inteiro: Int = 100
let decimal: Double = 3.14
let ativo: Bool = true

let lista: [String] = [
    "Swift",
    "iOS",
    "macOS"
]



// ---------- Functions ----------

func saudacao(nome: String) -> String {

    return "Olá, \(nome)"
}


func soma(
    _ a: Int,
    _ b: Int
) -> Int {

    return a + b
}



// ---------- Struct ----------

struct Pessoa {

    var nome: String
    var idade: Int


    func apresentar() -> String {

        return "\(nome) tem \(idade) anos"
    }
}



// ---------- Class ----------

class Usuario {

    var nome: String
    var ativo: Bool


    init(
        nome: String,
        ativo: Bool
    ) {

        self.nome = nome
        self.ativo = ativo
    }


    func status() -> String {

        return ativo ? 
        "Ativo" :
        "Inativo"
    }
}



// ---------- Protocol ----------

protocol Animal {

    func emitirSom() -> String
}



// ---------- Class Implementing Protocol ----------

class Cachorro: Animal {


    func emitirSom() -> String {

        return "Au Au"
    }
}



// ---------- Enum ----------

enum Status {

    case ativo
    case inativo
    case bloqueado
}



// ---------- Switch Pattern Matching ----------

func verificar(
    status: Status
) -> String {


    switch status {


    case .ativo:

        return "Usuário ativo"


    case .inativo:

        return "Usuário inativo"


    case .bloqueado:

        return "Usuário bloqueado"

    }

}



// ---------- Optionals ----------

var email: String? = "teste@email.com"


if let emailSeguro = email {

    print(emailSeguro)

}



// ---------- Closure ----------

let multiplicar = {

    (a: Int, b: Int) -> Int in

    return a * b
}



// ---------- Generics ----------

func mostrar<T>(
    valor: T
) {

    print(valor)
}



// ---------- Extension ----------

extension String {


    func inverter() -> String {

        return String(
            reversed()
        )
    }
}



// ---------- Async Await ----------

func buscarDados() async -> String {

    return "Dados carregados"
}



// ---------- Main ----------

let pessoa = Pessoa(
    nome: nome,
    idade: idade
)


print(
    pessoa.apresentar()
)


print(
    saudacao(nome: nome)
)