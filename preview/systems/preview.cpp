// ============================================================
//   ARQUIVO DE TESTE - PREVIEW DO TEMA "Esron Dark"
//   Cada bloco comentado indica a categoria semântica testada
// ============================================================

#include <cstdio>
#include <cstdlib>
#include <string>
#include <regex>

// ---------- Macros ----------
#define MAX_TENTATIVAS 5
#define QUADRADO(x) ((x) * (x))

// ---------- Namespace ----------
namespace app
{
    // ---------- Tipos primitivos (esperado: roxo, sem negrito) ----------
    int contador = 0;
    char letra = 'A';
    double preco = 19.90;
    float media = 7.5f;
    bool ativo = true;
    unsigned int codigo = 42;
    long total = 1000000L;
    void* ponteiro = nullptr;

    // ---------- Struct (esperado: tipo em vermelho suave D16D6D) ----------
    struct Ponto
    {
        int x;   // "int" roxo | "x" propriedade
        int y;
    };

    // ---------- Enum simples ----------
    enum Cor
    {
        VERMELHO,
        VERDE,
        AZUL
    };

    // ---------- Enum class ----------
    enum class Status
    {
        Ativo,
        Inativo,
        Pendente
    };

    // ---------- Classe + herança ----------
    class Pessoa
    {
        private:
            std::string nome;
            int idade;

        public:
            Pessoa(std::string n, int i) : nome(n), idade(i) {}

            std::string getNome() const
            {
                return nome;
            }

            int getIdade() const
            {
                return idade;
            }
    };

    class Funcionario : public Pessoa
    {
        public:
            double salario;

            Funcionario(std::string n, int i, double s)
                : Pessoa(n, i), salario(s) {}
    };
}

// ---------- Variável global (esperado: vermelho vivo EF5350) ----------
int variavelGlobal = 100;

// ---------- Constante / readonly (esperado: vermelho mais fechado BF616A) ----------
const int LIMITE_MAXIMO = 999;
constexpr int VALOR_CONSTANTE = 42;

// ---------- Variável estática (testa modifier *.static) ----------
static int contadorEstatico = 0;

// ---------- Função do usuário (esperado: azul #5A7FBF) ----------
int somar(int a, int b)          // parâmetros a, b
{
    int resultado = a + b;       // variável local, vermelho vivo
    return resultado;
}

double calcularMedia(double valores[], int tamanho)
{
    double soma = 0;
    for (int i = 0; i < tamanho; i++)
    {
        soma += valores[i];
    }
    return soma / tamanho;
}

int main()
{
    // ---------- Funções da biblioteca padrão (esperado: ciano #88C0D0) ----------
    printf("Hello world!\n");
    system("pause");

    // ---------- Strings ----------
    std::string mensagem = "Testando o tema Esron Dark";

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
    app::Cor corEscolhida = app::VERMELHO;
    app::Status statusAtual = app::Status::Ativo;

    // ---------- Struct em uso ----------
    app::Ponto p1;
    p1.x = 10;
    p1.y = 20;

    // ---------- Classe em uso ----------
    app::Pessoa pessoa("Esron", 30);
    printf("Nome: %s\n", pessoa.getNome().c_str());

    // ---------- Macro em uso ----------
    int quadrado = QUADRADO(5);

    // ---------- Regex ----------
    std::regex padrao("[0-9]+");
    bool contemNumero = std::regex_search(mensagem, padrao);

    // ---------- Condicional ----------
    if (soma > 0)
    {
        printf("soma positiva\n");
    }
    else
    {
        printf("soma negativa\n");
    }

    // ---------- Laço ----------
    for (int i = 0; i < MAX_TENTATIVAS; i++)
    {
        printf("tentativa %d\n", i);
    }

    /* Comentário
       de múltiplas
       linhas */

    return 0;
}


