(* ======================================
   OCaml Language Semantic Preview
   OCaml 5+
   ====================================== *)


(* ---------- Variables ---------- *)

let nome : string = "Esron"

let idade : int = 30


(* Inferência de tipos *)

let linguagem = "OCaml"



(* ---------- Basic Types ---------- *)

let numero : int = 100

let decimal : float = 3.14

let ativo : bool = true



(* ---------- Tuples ---------- *)

let pessoa =
  ("Esron", 30)



(* ---------- Lists ---------- *)

let linguagens =
  [
    "OCaml";
    "F#";
    "Haskell"
  ]



(* ---------- Functions ---------- *)

let saudacao nome =
  "Olá " ^ nome



let soma a b =
  a + b



(* ---------- Recursive Function ---------- *)

let rec fatorial n =

  if n <= 1 then

    1

  else

    n * fatorial (n - 1)



(* ---------- Pattern Matching ---------- *)

let verificar valor =

  match valor with

  | 0 ->
      "zero"

  | 1 ->
      "um"

  | _ ->
      "outro"



(* ---------- Variant Types ---------- *)

type status =

  | Ativo
  | Inativo
  | Bloqueado



let mensagem estado =

  match estado with

  | Ativo ->
      "Usuário ativo"

  | Inativo ->
      "Usuário desligado"

  | Bloqueado ->
      "Usuário bloqueado"



(* ---------- Records ---------- *)

type usuario = {

  nome : string;

  idade : int;

}



let criar_usuario nome idade =

  {

    nome = nome;

    idade = idade;

  }



(* ---------- Modules ---------- *)

module Calculadora = struct


  let multiplicar a b =

    a * b


end



(* ---------- Functors Style ---------- *)

module type Numero = sig

  val valor : int

end



(* ---------- Higher Order Function ---------- *)

let aplicar func valor =

  func valor



let dobro x =

  x * 2



(* ---------- Pipeline Style ---------- *)

let resultado =

  10

  |> dobro



(* ---------- Exceptions ---------- *)

exception ErroPersonalizado of string



let validar idade =

  if idade < 0 then

    raise
      (ErroPersonalizado "Idade inválida")

  else

    idade



(* ---------- Main ---------- *)

let () =

  print_endline
    (saudacao nome);

  print_int
    (soma 10 20)