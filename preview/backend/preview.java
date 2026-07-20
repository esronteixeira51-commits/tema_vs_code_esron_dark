// ============================================================
//   ARQUIVO DE TESTE - PREVIEW DO TEMA "Esron Dark"
//   Cada bloco comentado indica a categoria semântica testada
// ============================================================

package com.esron.preview;

import java.util.List;
import java.util.ArrayList;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class PreviewSemantico {

    // ---------- Tipos primitivos (esperado: roxo, sem negrito) ----------
    int contador = 0;
    char letra = 'A';
    double preco = 19.90;
    float media = 7.5f;
    boolean ativo = true;
    long total = 1000000L;
    byte pequeno = 10;
    short curto = 100;

    // ---------- Constante static final (esperado: vermelho mais fechado, cor de readonly) ----------
    static final int LIMITE_MAXIMO = 999;

    // ---------- Variável estática (testa modifier *.static) ----------
    static int contadorEstatico = 0;

    // ---------- Anotação (esperado: cor de decorator #88C0D0) ----------
    @Deprecated
    void metodoAntigo() {
        System.out.println("não use mais este método");
    }

    // ---------- Enum ----------
    enum Cor {
        VERMELHO, VERDE, AZUL
    }

    // ---------- Interface (esperado: tipo em vermelho suave D16D6D) ----------
    interface Forma {
        double calcularArea();
    }

    // ---------- Classe implementando interface ----------
    static class Circulo implements Forma {
        double raio;

        Circulo(double raio) {
            this.raio = raio;
        }

        @Override
        public double calcularArea() {
            return Math.PI * raio * raio;
        }
    }

    // ---------- Classe com herança ----------
    static class Pessoa {
        protected String nome;
        protected int idade;

        Pessoa(String nome, int idade) {
            this.nome = nome;
            this.idade = idade;
        }

        String getNome() {
            return nome;
        }
    }

    static class Funcionario extends Pessoa {
        double salario;

        Funcionario(String nome, int idade, double salario) {
            super(nome, idade);
            this.salario = salario;
        }
    }

    // ---------- Generics / typeParameter ----------
    static <T> T primeiroElemento(List<T> lista) {
        return lista.get(0);
    }

    // ---------- Função do usuário (esperado: azul #5A7FBF) ----------
    static int somar(int a, int b) {          // parâmetros a, b (branco)
        int resultado = a + b;                // variável local (vermelho vivo)
        return resultado;
    }

    static double calcularMedia(double[] valores) {
        double soma = 0;
        for (int i = 0; i < valores.length; i++) {
            soma += valores[i];
        }
        return soma / valores.length;
    }

    public static void main(String[] args) {

        // ---------- Métodos de biblioteca (esperado: ciano #88C0D0) ----------
        System.out.println("Hello world!");
        double raizQuadrada = Math.sqrt(16);

        // ---------- Strings ----------
        String mensagem = "Testando o tema Esron Dark";

        // ---------- Números ----------
        int numero = 42;
        double pi = 3.14159;
        int hexadecimal = 0xFF;

        // ---------- Booleanos ----------
        boolean sucesso = true;
        boolean falha = false;

        // ---------- Operadores ----------
        int soma = numero + 10;
        boolean comparacao = (soma > 0) && (falha == false);

        // ---------- Enum member em uso ----------
        Cor corEscolhida = Cor.VERMELHO;

        // ---------- Classes em uso ----------
        Pessoa pessoa = new Funcionario("Esron", 30, 5000.0);
        System.out.println("Nome: " + pessoa.getNome());

        Circulo circulo = new Circulo(5.0);
        System.out.println("Área: " + circulo.calcularArea());

        // ---------- Generics em uso ----------
        List<String> nomes = new ArrayList<>();
        nomes.add("Esron");
        String primeiro = primeiroElemento(nomes);

        // ---------- Regex ----------
        Pattern padrao = Pattern.compile("[0-9]+");
        Matcher matcher = padrao.matcher(mensagem);
        boolean contemNumero = matcher.find();

        // ---------- Condicional ----------
        if (soma > 0) {
            System.out.println("soma positiva");
        } else {
            System.out.println("soma negativa");
        }

        // ---------- Laço ----------
        for (int i = 0; i < 5; i++) {
            System.out.println("tentativa " + i);
        }

        // ---------- Exceção ----------
        try {
            int divisao = soma / 0;
        } catch (ArithmeticException e) {
            System.out.println("erro: " + e.getMessage());
        }

        // ---------- Lambda ----------
        Runnable tarefa = () -> System.out.println("executando lambda");
        tarefa.run();

        /* Comentário
           de múltiplas
           linhas */
    }
}