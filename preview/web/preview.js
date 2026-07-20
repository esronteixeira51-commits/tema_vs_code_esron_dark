// ============================================================
//   ARQUIVO DE TESTE - PREVIEW DO TEMA "Esron Dark"
//   Cada bloco comentado indica a categoria testada
// ============================================================

// ---------- Import (esperado: keyword) ----------
import { readFile } from "fs";

// ---------- var / let / const ----------
var legado = "não use var";
let contador = 0;
const LIMITE_MAXIMO = 999; // esperado: vermelho fechado (readonly)

// ---------- "Enum" simulado (JS não tem enum nativo) ----------
const Cor = Object.freeze({
    VERMELHO: "vermelho",
    VERDE: "verde",
    AZUL: "azul",
});

// ---------- Classe (esperado: tipo em vermelho suave D16D6D) ----------
class Pessoa {
    #idadePrivada; // campo privado

    static contadorDeInstancias = 0; // campo static

    constructor(nome, idade) {
        this.nome = nome;
        this.#idadePrivada = idade;
        Pessoa.contadorDeInstancias++;
    }

    get idade() {
        return this.#idadePrivada;
    }

    set idade(valor) {
        this.#idadePrivada = valor;
    }

    apresentar() {
        return `${this.nome}, ${this.idade} anos`;
    }

    static criarAnonimo() {
        return new Pessoa("Anônimo", 0);
    }
}

// ---------- Herança ----------
class Funcionario extends Pessoa {
    constructor(nome, idade, salario) {
        super(nome, idade);
        this.salario = salario;
    }

    apresentar() {
        return `${super.apresentar()} - R$ ${this.salario}`;
    }
}

// ---------- Função declarada (esperado: azul #5A7FBF) ----------
function somar(a, b) {
    // parâmetros a, b (branco)
    const resultado = a + b; // variável local (vermelho vivo)
    return resultado;
}

// ---------- Função expressão + arrow function ----------
const multiplicar = function (a, b) {
    return a * b;
};

const dividir = (a, b) => a / b;

// ---------- Função geradora ----------
function* contarAte(max) {
    for (let i = 0; i < max; i++) {
        yield i;
    }
}

// ---------- Função assíncrona (testa modifier async) ----------
async function calcularAsync(valor) {
    await new Promise((resolve) => setTimeout(resolve, 100));
    return valor * 2;
}

// ---------- Closures ----------
function criarContador() {
    let interno = 0;
    return function () {
        return ++interno;
    };
}

async function main() {
    // ---------- Funções de biblioteca (esperado: ciano #88C0D0) ----------
    console.log("Hello world!");
    const raiz = Math.sqrt(16);

    // ---------- Strings ----------
    const mensagem = "Testando o tema Esron Dark";
    const interpolada = `Mensagem: ${mensagem}`;

    // ---------- Números ----------
    const numero = 42;
    const pi = 3.14159;
    const hexadecimal = 0xff;
    const grande = 9007199254740991n; // BigInt

    // ---------- Booleanos / null / undefined ----------
    const sucesso = true;
    const falha = false;
    const vazio = null;
    let indefinido;

    // ---------- Operadores ----------
    const soma = numero + 10;
    const comparacao = soma > 0 && falha === false;

    // ---------- Optional chaining / nullish coalescing ----------
    const objeto = { config: { tema: "dark" } };
    const tema = objeto?.config?.tema ?? "claro";

    // ---------- Destructuring ----------
    const { nome, idade } = { nome: "Esron", idade: 30 };
    const [primeiro, segundo, ...resto] = [1, 2, 3, 4, 5];

    // ---------- Spread ----------
    const listaOriginal = [1, 2, 3];
    const listaCopia = [...listaOriginal, 4, 5];

    // ---------- Enum simulado em uso ----------
    const corEscolhida = Cor.VERMELHO;

    // ---------- Classes em uso ----------
    const pessoa = new Funcionario("Esron", 30, 5000.0);
    console.log(pessoa.apresentar());

    // ---------- Array methods (builtin) ----------
    const numeros = [1, 2, 3, 4, 5];
    const pares = numeros.filter((n) => n % 2 === 0).map((n) => n * 2);

    // ---------- Map / Set ----------
    const mapa = new Map();
    mapa.set("chave", "valor");

    const conjunto = new Set([1, 2, 2, 3]);

    // ---------- Regex ----------
    const padrao = /[0-9]+/;
    const contemNumero = padrao.test(mensagem);

    // ---------- JSON ----------
    const json = JSON.stringify({ nome, idade });

    // ---------- Generator em uso ----------
    for (const valor of contarAte(3)) {
        console.log(valor);
    }

    // ---------- Async em uso ----------
    const resultadoAsync = await calcularAsync(21);

    // ---------- Condicional ----------
    if (soma > 0) {
        console.log("soma positiva");
    } else {
        console.log("soma negativa");
    }

    // ---------- Laço ----------
    for (let i = 0; i < 5; i++) {
        console.log(`tentativa ${i}`);
    }

    // ---------- Exceção ----------
    try {
        JSON.parse("{ inválido");
    } catch (erro) {
        console.log("erro:", erro.message);
    }

    /* Comentário
       de múltiplas
       linhas */
}

main();

// ---------- Export ----------
export { somar, Pessoa };