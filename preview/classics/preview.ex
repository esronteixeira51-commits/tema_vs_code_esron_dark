# ======================================
# Elixir Language Semantic Preview
# Elixir 1.17+
# ======================================


# ---------- Variables ----------
# Elixir usa imutabilidade

nome = "Esron"

idade = 30


# ---------- Basic Types ----------

numero = 100

decimal = 3.14

ativo = true

lista = [
  "Elixir",
  "Phoenix",
  "Erlang"
]

mapa = %{
  nome: "Esron",
  idade: 30
}



# ---------- Functions ----------

defmodule Saudacao do

  def ola(nome) do

    "Olá, #{nome}"

  end


  def soma(a, b) do

    a + b

  end

end



# ---------- Module ----------

defmodule Pessoa do


  defstruct [
    :nome,
    :idade
  ]


  def apresentar(
        %Pessoa{
          nome: nome,
          idade: idade
        }
      ) do

    "#{nome} tem #{idade} anos"

  end


end



# ---------- Pattern Matching ----------

defmodule Usuario do


  def status(
        %{ativo: true}
      ) do

    "Usuário ativo"

  end


  def status(
        %{ativo: false}
      ) do

    "Usuário inativo"

  end


end



# ---------- Case ----------

resultado =
  case idade do

    30 ->
      "Trinta anos"


    _ ->
      "Outra idade"

  end



# ---------- Anonymous Function ----------

multiplicar =
  fn a, b ->

    a * b

  end



# ---------- Pipe Operator ----------

texto =
  "elixir"


texto
|> String.upcase()
|> IO.puts()



# ---------- Enum Functional Programming ----------

numeros =
  [1, 2, 3, 4, 5]


dobrados =
  Enum.map(
    numeros,
    fn numero ->

      numero * 2

    end
  )



# ---------- Recursion ----------

defmodule Contador do


  def contar(0) do

    :fim

  end


  def contar(numero) do

    IO.puts(numero)

    contar(numero - 1)

  end


end



# ---------- Protocol ----------

defprotocol Mostrar do

  def exibir(valor)

end



# ---------- Struct Usage ----------

pessoa =
  %Pessoa{
    nome: "Esron",
    idade: 30
  }



IO.puts(
  Pessoa.apresentar(pessoa)
)



# ---------- Concurrency ----------

spawn(fn ->

  IO.puts(
    "Processo Elixir"
  )

end)



# ---------- Main Execution ----------

IO.puts(
  Saudacao.ola(nome)
)

IO.puts(
  Saudacao.soma(10,20)
)