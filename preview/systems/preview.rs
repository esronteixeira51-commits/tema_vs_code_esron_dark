// ============================================================
//   ARQUIVO DE TESTE - PREVIEW DO TEMA "Esron Dark"
//   Cada bloco comentado indica a categoria semântica testada
// ============================================================

// ---------- Tipos primitivos (esperado: roxo, sem negrito) ----------
// Teste "de verdade" do builtinType emitido pelo rust-analyzer
fn tipos_primitivos() {
    let contador: i32 = 0;
    let letra: char = 'A';
    let preco: f64 = 19.90;
    let media: f32 = 7.5;
    let ativo: bool = true;
    let total: i64 = 1_000_000;
    let pequeno: u8 = 10;
    let curto: i16 = 100;
    let tamanho: usize = 5;
}

// ---------- Constante / static (esperado: vermelho mais fechado, cor de readonly) ----------
const LIMITE_MAXIMO: i32 = 999;
static VERSAO: &str = "1.0.0";

// ---------- Enum com dados (algebraic data type de verdade) ----------
#[derive(Debug, Clone)]
enum Cor {
    Vermelho,
    Verde,
    Azul,
    Customizada(u8, u8, u8), // variante com dados
}

// ---------- Struct (esperado: tipo em vermelho suave D16D6D) ----------
#[derive(Debug, Clone)]
struct Ponto {
    x: i32,
    y: i32,
}

// ---------- Trait (equivalente à interface) ----------
trait Forma {
    fn calcular_area(&self) -> f64;
}

// ---------- Struct implementando o trait ----------
struct Circulo {
    raio: f64,
}

impl Forma for Circulo {
    fn calcular_area(&self) -> f64 {
        3.14159 * self.raio * self.raio
    }
}

// ---------- Struct com composição (Rust não tem herança) ----------
struct Pessoa {
    nome: String,
    idade: i32,
}

impl Pessoa {
    fn novo(nome: &str, idade: i32) -> Self {
        Pessoa {
            nome: nome.to_string(),
            idade,
        }
    }

    fn apresentar(&self) -> String {
        format!("{}, {} anos", self.nome, self.idade)
    }
}

struct Funcionario {
    pessoa: Pessoa,
    salario: f64,
}

// ---------- Generics com trait bound ----------
fn primeiro_elemento<T: Clone>(lista: &[T]) -> T {
    lista[0].clone()
}

// ---------- Função do usuário (esperado: azul #5A7FBF) ----------
fn somar(a: i32, b: i32) -> i32 {
    // parâmetros a, b (branco)
    let resultado = a + b; // variável local (vermelho vivo)
    resultado
}

// ---------- Result<T, E> (idiomático, sem exceção) ----------
fn dividir(a: i32, b: i32) -> Result<i32, String> {
    if b == 0 {
        return Err(String::from("divisão por zero"));
    }
    Ok(a / b)
}

// ---------- Async ----------
async fn calcular_async(valor: i32) -> i32 {
    valor * 2
}

fn main() {
    // ---------- Macros (esperado: cor de macro) ----------
    println!("Hello world!");

    // ---------- Strings ----------
    let mensagem = String::from("Testando o tema Esron Dark");

    // ---------- Números ----------
    let numero = 42;
    let pi = 3.14159;
    let hexadecimal = 0xFF;

    // ---------- Booleanos ----------
    let sucesso = true;
    let falha = false;

    // ---------- Operadores + referências/borrowing ----------
    let soma = numero + 10;
    let comparacao = (soma > 0) && (falha == false);
    let referencia = &numero;
    let mut mutavel = 5;
    let referencia_mutavel = &mut mutavel;

    // ---------- Enum em uso + pattern matching ----------
    let cor_escolhida = Cor::Vermelho;
    match cor_escolhida {
        Cor::Vermelho => println!("é vermelho"),
        Cor::Verde => println!("é verde"),
        Cor::Azul => println!("é azul"),
        Cor::Customizada(r, g, b) => println!("cor customizada: {} {} {}", r, g, b),
    }

    // ---------- Struct em uso ----------
    let p1 = Ponto { x: 10, y: 20 };

    // ---------- Composição em uso ----------
    let funcionario = Funcionario {
        pessoa: Pessoa::novo("Esron", 30),
        salario: 5000.0,
    };
    println!("{}", funcionario.pessoa.apresentar());

    let circulo = Circulo { raio: 5.0 };
    println!("Área: {}", circulo.calcular_area());

    // ---------- Generics em uso ----------
    let nomes = vec!["Esron".to_string(), "Gemini".to_string()];
    let primeiro = primeiro_elemento(&nomes);

    // ---------- Option<T> ----------
    let talvez_numero: Option<i32> = Some(42);
    if let Some(valor) = talvez_numero {
        println!("valor: {}", valor);
    }

    // ---------- Result<T, E> em uso ----------
    match dividir(soma, 0) {
        Ok(resultado) => println!("resultado: {}", resultado),
        Err(erro) => println!("erro: {}", erro),
    }

    // ---------- Iterators + closures ----------
    let numeros = vec![1, 2, 3, 4, 5];
    let pares: Vec<i32> = numeros.iter().filter(|&&n| n % 2 == 0).cloned().collect();

    // ---------- Condicional ----------
    if soma > 0 {
        println!("soma positiva");
    } else {
        println!("soma negativa");
    }

    // ---------- Laço ----------
    for i in 0..5 {
        println!("tentativa {}", i);
    }

    // ---------- Unsafe ----------
    unsafe {
        let ptr = &numero as *const i32;
        println!("endereço: {:?}", ptr);
    }

    /* Comentário
       de múltiplas
       linhas */
}