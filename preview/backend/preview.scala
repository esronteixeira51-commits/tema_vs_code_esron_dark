// ======================================
// Scala Language Semantic Preview
// Scala 3
// ======================================

package preview


// ---------- Imports ----------

import scala.collection.mutable


// ---------- Variables ----------

// valor imutável
val nome: String = "Esron"

// inferência de tipo
val idade = 30

// variável mutável
var contador: Int = 0



// ---------- Functions ----------

def saudacao(nome: String): String =
  s"Olá, $nome"


def soma(a: Int, b: Int): Int =
  a + b



// ---------- Classes ----------

class Pessoa(
    val nome: String,
    val idade: Int
):

  def apresentar(): String =
    s"$nome tem $idade anos"



// ---------- Case Class ----------

case class Usuario(
    id: Int,
    nome: String,
    ativo: Boolean
)



// ---------- Trait ----------

trait Animal:

  def emitirSom(): String



// ---------- Class usando Trait ----------

class Cachorro extends Animal:

  override def emitirSom(): String =
    "Au Au"



// ---------- Enum Scala 3 ----------

enum Status:

  case Ativo
  case Inativo
  case Bloqueado



// ---------- Pattern Matching ----------

def verificar(status: Status): String =

  status match

    case Status.Ativo =>
      "Usuário ativo"

    case Status.Inativo =>
      "Usuário desligado"

    case Status.Bloqueado =>
      "Usuário bloqueado"



// ---------- Collections ----------

val numeros = List(1,2,3,4,5)

val dobrados =
  numeros.map(
    numero => numero * 2
  )



// ---------- Lambda ----------

val multiplicar =
  (x: Int, y: Int) => x * y



// ---------- Extension Method Scala 3 ----------

extension (texto: String)

  def inverter: String =
    texto.reverse



// ---------- Given / Using Scala 3 ----------

given contexto: String =
  "Configuração global"


def mostrar(using valor: String): String =
  valor



// ---------- Main ----------

@main
def executar():

  println(
    saudacao(nome)
  )

  println(
    soma(10,20)
  )

  println(
    "Scala".inverter
  )