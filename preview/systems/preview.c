/* 
 * comprehensive_c_example.c
 * Um arquivo C que exerce o máximo possível de tokens semânticos do C
 * Inclui keywords, tipos, operadores, estruturas de controle, etc.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdarg.h>
#include <limits.h>

#define MAX_SIZE 100
#define PI 3.14159
#define DEBUG 1
#define SQUARE(x) ((x) * (x))
#define CONCAT(a, b) a##b
#define STRINGIFY(x) #x

#ifdef DEBUG
#define LOG(msg) printf("DEBUG: %s\n", msg)
#else
#define LOG(msg) 
#endif

typedef int Integer;
typedef char* String;
typedef struct Point Point;
typedef enum Color Color;

enum Color {
    RED,
    GREEN = 5,
    BLUE
};

struct Point {
    int x;
    int y;
    unsigned int flags : 4;  // Bitfield
};

union Data {
    int i;
    float f;
    char str[20];
};

static const int GLOBAL_CONST = 42;
volatile int shared_var = 0;
extern int external_var;  // Declaracao externa

int external_var = 100;  // Definicao

// Funcao inline
inline int add(int a, int b) {
    return a + b;
}

// Ponteiro para funcao
typedef int (*Operation)(int, int);

// Variadic function
int sum(int count, ...) {
    va_list args;
    va_start(args, count);
    int total = 0;
    for (int i = 0; i < count; i++) {
        total += va_arg(args, int);
    }
    va_end(args);
    return total;
}

// Funcao recursiva
long factorial(long n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
}

int main(void) {
    // Variaveis de diferentes tipos
    int a = 10;
    unsigned int b = 20U;
    long c = 123456789L;
    unsigned long d = 987654321UL;
    short e = -5;
    float f = 3.14f;
    double g = 2.71828;
    char h = 'A';
    bool i = true;
    Integer j = 50;
    String k = "Hello, C!";
    
    // Arrays
    int arr[5] = {1, 2, 3, 4, 5};
    char str[] = "World";
    
    // Struct e Union
    Point p = {10, 20};
    union Data data;
    data.i = 42;
    
    // Ponteiros
    int *ptr = &a;
    int **pptr = &ptr;
    char *str_ptr = k;
    
    // Operadores
    int result = a + b - c * d / e % 3;
    result = (a > b) ? a : b;
    result &= 0xFF;
    result |= 0xAA;
    result ^= 0x55;
    result <<= 2;
    result >>= 1;
    result = !i && (a || b);
    result = add(a, b) + SQUARE(5);
    
    // Controle de fluxo
    if (a > 0) {
        printf("Positive\n");
    } else if (a < 0) {
        printf("Negative\n");
    } else {
        printf("Zero\n");
    }
    
    switch (b % 5) {
        case 0:
            printf("Multiple of 5\n");
            break;
        case 1:
        case 2:
            printf("1 or 2\n");
            break;
        default:
            printf("Other\n");
    }
    
    for (int x = 0; x < 5; x++) {
        if (x == 3) continue;
        printf("%d ", x);
    }
    printf("\n");
    
    int y = 0;
    while (y < 3) {
        printf("While: %d\n", y++);
    }
    
    do {
        printf("Do-while\n");
    } while (false);
    
    // Goto (evitado normalmente, mas para demonstracao)
    int counter = 0;
label:
    if (counter < 2) {
        counter++;
        goto label;
    }
    
    // Ponteiro de funcao
    Operation op = add;
    printf("Operation: %d\n", op(6, 7));
    
    // Variadic
    printf("Sum: %d\n", sum(4, 10, 20, 30, 40));
    
    // Math
    printf("Sqrt: %.2f\n", sqrt(g));
    printf("Pow: %.2f\n", pow(f, 2));
    
    // String functions
    printf("Length: %zu\n", strlen(k));
    strcat(str, "!");
    
    // Memory
    int *dynamic = (int*)malloc(MAX_SIZE * sizeof(int));
    if (dynamic) {
        dynamic[0] = 999;
        free(dynamic);
    }
    
    // Complex expressions
    int complex_expr = (a++, ++b, a + b * (c > 0 ? 1 : 0));
    
    LOG("Program completed");
    
    printf("Final result: %d\n", result);
    printf("Factorial 5: %ld\n", factorial(5));
    
    return EXIT_SUCCESS;
}

// Funcao com parametros default-like via macros ou sobrecarga simulada nao nativa
void print_multiple(int n, const char* msg) {
    for (int i = 0; i < n; i++) {
        puts(msg);
    }
}