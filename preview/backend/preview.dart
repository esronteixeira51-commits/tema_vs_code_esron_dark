///=============================================================================
/// Esron Dark - Dart Preview
/// Este arquivo existe apenas para testar a coloração do tema.
///=============================================================================

import 'dart:math';
import 'dart:async';

///=============================================================================
/// Enum
///=============================================================================

enum Status {
  pending,
  running,
  finished,
}

///=============================================================================
/// Extension
///=============================================================================

extension StringExtension on String {
  String capitalize() =>
      isEmpty ? this : "${this[0].toUpperCase()}${substring(1)}";
}

///=============================================================================
/// Mixin
///=============================================================================

mixin Logger {
  void log(String message) {
    print("[LOG] $message");
  }
}

///=============================================================================
/// Class
///=============================================================================

class User with Logger {

  final int id;

  String name;

  bool active;

  User({
    required this.id,
    required this.name,
    this.active = true,
  });

  void greet() {
    log("Hello $name");
  }

  @override
  String toString() {
    return "User(id: $id, name: $name)";
  }
}

///=============================================================================
/// Generic Class
///=============================================================================

class Box<T> {

  final T value;

  const Box(this.value);

}

///=============================================================================
/// Function
///=============================================================================

int add(int a, int b) {
  return a + b;
}

double area(double radius) {
  return pi * radius * radius;
}

///=============================================================================
/// Async
///=============================================================================

Future<String> fetchData() async {

  await Future.delayed(
    const Duration(milliseconds: 100),
  );

  return "Done";
}

///=============================================================================
/// Generator
///=============================================================================

Iterable<int> numbers() sync* {

  for (int i = 1; i <= 5; i++) {
    yield i;
  }

}

///=============================================================================
/// Records (Dart 3)
///=============================================================================

(String, int) person() {

  return ("Esron", 25);

}

///=============================================================================
/// Pattern Matching
///=============================================================================

void describe(Object value) {

  switch (value) {

    case int n:
      print("Integer $n");

    case String s:
      print("String $s");

    default:
      print("Unknown");
  }

}

///=============================================================================
/// Main
///=============================================================================

Future<void> main() async {

  const version = "1.0.0";

  final user = User(
    id: 1,
    name: "Esron",
  );

  user.greet();

  final box = Box<String>("Esron Dark");

  print(box.value);

  print(add(10, 20));

  print(area(5));

  print(version);

  var list = <String>[
    "Dart",
    "Flutter",
    "Rust",
    "Python",
  ];

  for (final language in list) {
    print(language);
  }

  var map = <String, dynamic>{
    "theme": "Esron Dark",
    "version": version,
    "enabled": true,
    "colors": {
      "keyword": "#7A9FE6",
      "type": "#D16D6D",
      "function": "#5A7FBF",
    }
  };

  print(map);

  if (user.active) {
    print("Active");
  } else {
    print("Inactive");
  }

  for (int i = 0; i < 5; i++) {
    print(i);
  }

  while (false) {
    break;
  }

  try {

    throw Exception("Example");

  } on Exception catch (e) {

    print(e);

  } finally {

    print("Finished");

  }

  var (name, age) = person();

  print(name);

  print(age);

  describe(42);

  describe("Hello");

  describe(3.14);

  print(await fetchData());

  for (final n in numbers()) {
    print(n);
  }

  print("hello".capitalize());

  var nullable = null;

  print(nullable ?? "Default");

  print(user is User);

  print(user is! String);
}