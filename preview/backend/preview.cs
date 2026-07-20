// ============================================================
//   ARQUIVO DE TESTE - PREVIEW DO TEMA "Esron Dark"
//   Cada bloco comentado indica a categoria semântica testada
// ============================================================

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Text.RegularExpressions;

namespace Esron.Preview
{
    // ---------- Tipos primitivos (esperado: roxo, sem negrito) ----------
    class TiposPrimitivos
    {
        int contador = 0;
        char letra = 'A';
        double preco = 19.90;
        float media = 7.5f;
        bool ativo = true;
        long total = 1000000L;
        byte pequeno = 10;
        short curto = 100;
        decimal valorExato = 19.99m;
    }

    // ---------- Enum ----------
    enum Cor
    {
        Vermelho,
        Verde,
        Azul
    }

    // ---------- Interface (esperado: tipo em vermelho suave D16D6D) ----------
    interface IForma
    {
        double CalcularArea();
    }

    // ---------- Struct ----------
    struct Ponto
    {
        public int X;
        public int Y;
    }

    // ---------- Atributo (esperado: cor de decorator #88C0D0) ----------
    [Obsolete("não use mais esta classe")]
    class ClasseAntiga
    {
        public void MetodoAntigo() => Console.WriteLine("legado");
    }

    // ---------- Classe com propriedades (esperado: property = branco D8DEE9, diferente de variável) ----------
    class Pessoa
    {
        public string Nome { get; set; }
        public int Idade { get; set; }

        public Pessoa(string nome, int idade)
        {
            Nome = nome;
            Idade = idade;
        }

        public virtual string Apresentar() => $"{Nome}, {Idade} anos";
    }

    // ---------- Herança ----------
    class Funcionario : Pessoa
    {
        public double Salario { get; set; }

        public Funcionario(string nome, int idade, double salario)
            : base(nome, idade)
        {
            Salario = salario;
        }

        public override string Apresentar() => $"{base.Apresentar()} - R$ {Salario}";
    }

    // ---------- Record (C# 9+) ----------
    record Coordenada(double Latitude, double Longitude);

    // ---------- Constante e static readonly (esperado: vermelho fechado BF616A) ----------
    static class Constantes
    {
        public const int LimiteMaximo = 999;
        public static readonly string Versao = "1.0.0";
    }

    // ---------- Delegate e Event (esperado: cor de event #EBCB8B) ----------
    class Botao
    {
        public delegate void CliqueHandler(string mensagem);
        public event CliqueHandler AoClicar;

        public void Clicar()
        {
            AoClicar?.Invoke("botão clicado");
        }
    }

    // ---------- Generics ----------
    class Caixa<T>
    {
        public T Conteudo { get; set; }

        public Caixa(T conteudo)
        {
            Conteudo = conteudo;
        }
    }

    class Program
    {
        // ---------- Função do usuário (esperado: azul #5A7FBF) ----------
        static int Somar(int a, int b)          // parâmetros a, b (branco)
        {
            int resultado = a + b;               // variável local (vermelho vivo)
            return resultado;
        }

        // ---------- Async/Await (testa modifier *.async) ----------
        static async Task<int> CalcularAsync(int valor)
        {
            await Task.Delay(100);
            return valor * 2;
        }

        static async Task Main(string[] args)
        {
            // ---------- Métodos de biblioteca (esperado: ciano #88C0D0) ----------
            Console.WriteLine("Hello world!");
            double raizQuadrada = Math.Sqrt(16);

            // ---------- Strings / interpolação ----------
            string mensagem = "Testando o tema Esron Dark";
            string interpolada = $"Mensagem: {mensagem}";

            // ---------- Números ----------
            int numero = 42;
            double pi = 3.14159;
            int hexadecimal = 0xFF;

            // ---------- Booleanos ----------
            bool sucesso = true;
            bool falha = false;

            // ---------- Operadores ----------
            int soma = numero + 10;
            bool comparacao = (soma > 0) && (falha == false);

            // ---------- Enum member em uso ----------
            Cor corEscolhida = Cor.Vermelho;

            // ---------- Classes em uso ----------
            Pessoa pessoa = new Funcionario("Esron", 30, 5000.0);
            Console.WriteLine(pessoa.Apresentar());

            // ---------- Record em uso ----------
            var coordenada = new Coordenada(-10.2, -48.3);

            // ---------- Generics em uso ----------
            var caixa = new Caixa<string>("conteúdo genérico");

            // ---------- Event em uso ----------
            var botao = new Botao();
            botao.AoClicar += (msg) => Console.WriteLine(msg);
            botao.Clicar();

            // ---------- LINQ ----------
            var numeros = new List<int> { 1, 2, 3, 4, 5 };
            var pares = numeros.Where(n => n % 2 == 0).ToList();

            // ---------- Regex ----------
            var padrao = new Regex("[0-9]+");
            bool contemNumero = padrao.IsMatch(mensagem);

            // ---------- Async em uso ----------
            int resultadoAsync = await CalcularAsync(21);

            // ---------- Condicional ----------
            if (soma > 0)
            {
                Console.WriteLine("soma positiva");
            }
            else
            {
                Console.WriteLine("soma negativa");
            }

            // ---------- Laço ----------
            for (int i = 0; i < 5; i++)
            {
                Console.WriteLine($"tentativa {i}");
            }

            // ---------- Exceção ----------
            try
            {
                int divisao = soma / 0;
            }
            catch (DivideByZeroException e)
            {
                Console.WriteLine($"erro: {e.Message}");
            }

            /* Comentário
               de múltiplas
               linhas */
        }
    }
}