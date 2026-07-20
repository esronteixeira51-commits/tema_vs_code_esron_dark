#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
comprehensive_python_example.py
Um arquivo Python que exercita o máximo possível de tokens semânticos da linguagem.
"""

import sys
import math
import random
import functools
import itertools
import asyncio
from typing import List, Dict, Tuple, Optional, Any, Callable, Union
from dataclasses import dataclass
from enum import Enum, auto
import warnings
import contextlib

# Constantes e variáveis globais
MAX_SIZE: int = 100
PI: float = 3.14159
DEBUG: bool = True

# Decoradores
def log_execution(func):
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        print(f"[LOG] Executando {func.__name__}")
        return func(*args, **kwargs)
    return wrapper

# Enum
class Color(Enum):
    RED = auto()
    GREEN = 5
    BLUE = auto()

# Dataclass
@dataclass
class Point:
    x: int
    y: int
    flags: int = 0

# Classe com vários recursos
class AdvancedCalculator:
    class_var: int = 42
    
    def __init__(self, value: int = 0):
        self.value = value
        self._private = "secreto"
        self.__very_private = "mais_secreto"  # name mangling
    
    @property
    def square(self) -> int:
        return self.value ** 2
    
    @staticmethod
    def static_method(x: int) -> int:
        return x * 2
    
    @classmethod
    def class_method(cls) -> str:
        return f"Classe: {cls.__name__}"
    
    def __str__(self) -> str:
        return f"Calculator(value={self.value})"
    
    def __repr__(self) -> str:
        return f"AdvancedCalculator({self.value})"

# Função com type hints, parâmetros variados e recursão
def factorial(n: int) -> int:
    if n <= 1:
        return 1
    return n * factorial(n - 1)

# Função com *args, **kwargs e valores padrão
def flexible_function(a: int, b: float = 2.5, *args: Any, **kwargs: Any) -> tuple:
    total = a + b + sum(args)
    return total, len(kwargs)

# Gerador
def number_generator(limit: int):
    for i in range(limit):
        yield i * i

# Async function
async def async_task(delay: float) -> str:
    await asyncio.sleep(delay)
    return f"Tarefa concluída após {delay}s"

# Context manager personalizado
class Timer:
    def __enter__(self):
        print("Timer iniciado")
        return self
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        print("Timer finalizado")

# Função principal
@log_execution
def main() -> None:
    # Variáveis de vários tipos
    integer: int = 42
    floating: float = 3.14159
    text: str = "Olá, Python!"
    boolean: bool = True
    none_value: Optional[str] = None
    
    # Listas, tuplas, dicionários, sets
    numbers: List[int] = [1, 2, 3, 4, 5]
    coords: Tuple[int, int] = (10, 20)
    person: Dict[str, Any] = {"nome": "João", "idade": 30}
    unique: set = {1, 2, 3, 3, 4}
    
    # Compreensões
    squares = [x**2 for x in numbers if x % 2 == 0]
    even_dict = {x: x*2 for x in numbers}
    
    # Operadores e expressões complexas
    result = (integer + floating) * 2 ** 3 // 4 + (100 if boolean else 0)
    result = integer if floating > 3 else floating
    
    # Controle de fluxo
    if integer > 0:
        print("Positivo")
    elif integer < 0:
        print("Negativo")
    else:
        print("Zero")
    
    for i in range(5):
        if i == 3:
            continue
        print(f"Loop: {i}")
    
    i = 0
    while i < 3:
        print(f"While: {i}")
        i += 1
    
    # Match (Python 3.10+)
    status = 404
    match status:
        case 200:
            print("OK")
        case 404:
            print("Não encontrado")
        case _:
            print("Outro")
    
    # Uso de classes e objetos
    calc = AdvancedCalculator(10)
    p = Point(5, 10)
    
    print(calc)
    print(calc.square)
    print(AdvancedCalculator.class_method())
    
    # Gerador
    for sq in number_generator(5):
        print(f"Gerador: {sq}")
    
    # Exceções
    try:
        result = 10 / 0
    except ZeroDivisionError as e:
        print(f"Erro capturado: {e}")
    finally:
        print("Finally executado")
    
    # Context manager
    with Timer():
        print("Dentro do context manager")
    
    with contextlib.suppress(FileNotFoundError):
        open("arquivo_inexistente.txt")
    
    # Lambda e higher-order functions
    doubled = list(map(lambda x: x * 2, numbers))
    filtered = list(filter(lambda x: x > 2, numbers))
    
    # Itertools e functools
    for a, b in itertools.pairwise(numbers):
        print(a, b)
    
    # Warnings
    warnings.warn("Este é um aviso de teste", UserWarning)
    
    print(f"\nFatorial de 5: {factorial(5)}")
    print(f"Resultado final: {result}")
    print("Programa Python concluído com sucesso!")

# Execução
if __name__ == "__main__":
    asyncio.run(async_task(0.1))  # Apenas para demonstrar async
    main()


