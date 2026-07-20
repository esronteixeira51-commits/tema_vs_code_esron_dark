// ============================================================
//   ARQUIVO DE TESTE - PREVIEW DO TEMA "Esron Dark"
//   Cada bloco comentado indica a categoria semântica testada
// ============================================================

package main

import (
	"fmt"
	"regexp"
	"sync"
)

// ---------- Tipos primitivos (esperado: roxo, sem negrito) ----------
var (
	contador int     = 0
	letra    rune    = 'A'
	preco    float64 = 19.90
	media    float32 = 7.5
	ativo    bool    = true
	total    int64   = 1000000
	pequeno  byte    = 10
	curto    int16   = 100
)

// ---------- Constante (esperado: vermelho mais fechado, cor de readonly) ----------
const LimiteMaximo = 999

// ---------- "Enum" via const + iota (Go não tem enum nativo) ----------
type Cor int

const (
	Vermelho Cor = iota
	Verde
	Azul
)

// ---------- Struct (esperado: tipo em vermelho suave D16D6D) ----------
type Ponto struct {
	X int
	Y int
}

// ---------- Interface (implementação implícita, sem "implements") ----------
type Forma interface {
	CalcularArea() float64
}

// ---------- Struct implementando a interface ----------
type Circulo struct {
	Raio float64
}

func (c Circulo) CalcularArea() float64 {
	return 3.14159 * c.Raio * c.Raio
}

// ---------- Composição/embedding (Go não tem herança) ----------
type Pessoa struct {
	Nome  string
	Idade int
}

func (p Pessoa) Apresentar() string {
	return fmt.Sprintf("%s, %d anos", p.Nome, p.Idade)
}

type Funcionario struct {
	Pessoa
	Salario float64
}

// ---------- Generics (Go 1.18+) ----------
func PrimeiroElemento[T any](lista []T) T {
	return lista[0]
}

// ---------- Função do usuário (esperado: azul #5A7FBF) ----------
func Somar(a int, b int) int { // parâmetros a, b (branco)
	resultado := a + b // variável local (vermelho vivo)
	return resultado
}

func CalcularMedia(valores []float64) float64 {
	soma := 0.0
	for i := 0; i < len(valores); i++ {
		soma += valores[i]
	}
	return soma / float64(len(valores))
}

// ---------- Múltiplos retornos + error (idiomático, sem exceção) ----------
func Dividir(a int, b int) (int, error) {
	if b == 0 {
		return 0, fmt.Errorf("divisão por zero")
	}
	return a / b, nil
}

// ---------- Goroutine + Channel ----------
func Processar(canal chan<- int, valor int) {
	canal <- valor * 2
}

func main() {

	// ---------- Funções de biblioteca (esperado: ciano #88C0D0) ----------
	fmt.Println("Hello world!")

	// ---------- Strings ----------
	mensagem := "Testando o tema Esron Dark"

	// ---------- Números ----------
	numero := 42
	pi := 3.14159
	hexadecimal := 0xFF

	// ---------- Booleanos ----------
	sucesso := true
	falha := false

	// ---------- Operadores ----------
	soma := numero + 10
	comparacao := (soma > 0) && (falha == false)

	// ---------- "Enum" (const) em uso ----------
	corEscolhida := Vermelho

	// ---------- Struct em uso ----------
	p1 := Ponto{X: 10, Y: 20}

	// ---------- Composição em uso ----------
	funcionario := Funcionario{
		Pessoa:  Pessoa{Nome: "Esron", Idade: 30},
		Salario: 5000.0,
	}
	fmt.Println(funcionario.Apresentar())

	circulo := Circulo{Raio: 5.0}
	fmt.Println("Área:", circulo.CalcularArea())

	// ---------- Generics em uso ----------
	nomes := []string{"Esron", "Gemini", "Claude"}
	primeiro := PrimeiroElemento(nomes)

	// ---------- Regex ----------
	padrao := regexp.MustCompile("[0-9]+")
	contemNumero := padrao.MatchString(mensagem)

	// ---------- Erro (idiomático, sem exceção) ----------
	resultadoDivisao, err := Dividir(soma, 0)
	if err != nil {
		fmt.Println("erro:", err)
	}

	// ---------- Goroutine + Channel ----------
	canal := make(chan int)
	go Processar(canal, 21)
	resultadoCanal := <-canal

	var wg sync.WaitGroup
	wg.Add(1)
	go func() {
		defer wg.Done()
		fmt.Println("executando em goroutine")
	}()
	wg.Wait()

	// ---------- Condicional ----------
	if soma > 0 {
		fmt.Println("soma positiva")
	} else {
		fmt.Println("soma negativa")
	}

	// ---------- Laço ----------
	for i := 0; i < 5; i++ {
		fmt.Println("tentativa", i)
	}

	// ---------- Ponteiro ----------
	ponteiro := &numero
	*ponteiro = 50

	/* Comentário
	   de múltiplas
	   linhas */

	_ = pi
	_ = hexadecimal
	_ = sucesso
	_ = comparacao
	_ = corEscolhida
	_ = p1
	_ = primeiro
	_ = contemNumero
	_ = resultadoDivisao
	_ = resultadoCanal
	_ = contador
	_ = letra
	_ = preco
	_ = media
	_ = ativo
	_ = total
	_ = pequeno
	_ = curto
	_ = LimiteMaximo
}