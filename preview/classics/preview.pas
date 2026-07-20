program SemanticPreview;


// ======================================
// Pascal Language Semantic Preview
// Free Pascal / Object Pascal
// ======================================


{$mode objfpc}


// ---------- Variables ----------

var

  nome: String;

  idade: Integer;

  altura: Real;

  ativo: Boolean;



// ---------- Constants ----------

const

  PI_VALOR = 3.14159;



// ---------- Type Declaration ----------

type

  TIdade = Integer;


  TPessoa = record

    nome: String;

    idade: Integer;

  end;



// ---------- Function ----------

function Saudacao(
  nome: String
): String;

begin

  Result :=
    'Olá, ' + nome;

end;



// ---------- Procedure ----------

procedure MostrarMensagem(
  mensagem: String
);

begin

  WriteLn(mensagem);

end;



// ---------- Function with Parameters ----------

function Soma(
  a: Integer;
  b: Integer
): Integer;

begin

  Soma :=
    a + b;

end;



// ---------- Conditional ----------

function VerificarIdade(
  idade: Integer
): String;

begin

  if idade >= 18 then

    Result :=
      'Maior de idade'

  else

    Result :=
      'Menor de idade';

end;



// ---------- Class (Object Pascal) ----------

type

  TUsuario = class

  private

    FNome: String;

    FAtivo: Boolean;


  public

    constructor Create(
      nome: String
    );


    function Status: String;

  end;



constructor TUsuario.Create(
  nome: String
);

begin

  FNome :=
    nome;

  FAtivo :=
    True;

end;



function TUsuario.Status: String;

begin

  if FAtivo then

    Result :=
      'Ativo'

  else

    Result :=
      'Inativo';

end;



// ---------- Array ----------

var

  numeros:
    array[1..5] of Integer;



// ---------- Loop ----------

procedure Contar;

var

  i: Integer;


begin

  for i := 1 to 5 do

    WriteLn(i);

end;



// ---------- Main Program ----------

var

  pessoa: TPessoa;

  usuario: TUsuario;


begin


  nome :=
    'Esron';


  idade :=
    30;


  ativo :=
    True;



  pessoa.nome :=
    nome;


  pessoa.idade :=
    idade;



  usuario :=
    TUsuario.Create(
      nome
    );



  MostrarMensagem(
    Saudacao(nome)
  );


  WriteLn(
    Soma(10,20)
  );


  WriteLn(
    VerificarIdade(idade)
  );


  WriteLn(
    usuario.Status
  );


end.