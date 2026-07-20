// comprehensive_zig_example.zig
// Um arquivo Zig que exercita o máximo possível de tokens semânticos da linguagem.

const std = @import("std");
const Allocator = std.mem.Allocator;
const assert = std.debug.assert;

const MAX_SIZE: usize = 100;
const PI: f64 = 3.14159;
const DEBUG: bool = true;

const Color = enum(u8) {
    red,
    green = 5,
    blue,
};

const Point = struct {
    x: i32,
    y: i32,
    flags: u4 = 0,
};

const Data = union {
    i: i32,
    f: f32,
    str: [20]u8,
};

const AdvancedCalculator = struct {
    value: i32,

    pub fn init(value: i32) AdvancedCalculator {
        return AdvancedCalculator{ .value = value };
    }

    pub fn square(self: AdvancedCalculator) i32 {
        return self.value * self.value;
    }

    pub fn add(self: *AdvancedCalculator, other: i32) void {
        self.value += other;
    }

    pub fn format(
        self: AdvancedCalculator,
        comptime fmt: []const u8,
        options: std.fmt.FormatOptions,
        writer: anytype,
    ) !void {
        _ = fmt;
        _ = options;
        try writer.print("Calculator(value={})", .{self.value});
    }
};

// Função recursiva
fn factorial(n: u64) u64 {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
}

// Função com parâmetros variádicos (usando std)
fn sum(allocator: Allocator, numbers: []const i32) !i32 {
    var total: i32 = 0;
    for (numbers) |num| {
        total += num;
    }
    return total;
}

// Error union
const MyError = error{
    InvalidInput,
    OutOfMemory,
};

fn divide(a: f64, b: f64) MyError!f64 {
    if (b == 0) return MyError.InvalidInput;
    return a / b;
}

// Struct com métodos
const Vector = struct {
    x: f64,
    y: f64,

    fn length(self: Vector) f64 {
        return @sqrt(self.x * self.x + self.y * self.y);
    }

    fn add(self: Vector, other: Vector) Vector {
        return Vector{
            .x = self.x + other.x,
            .y = self.y + other.y,
        };
    }
};

// Generics
fn max(comptime T: type, a: T, b: T) T {
    return if (a > b) a else b;
}

// Main
pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    // Variáveis
    var a: i32 = 10;
    const b: u32 = 20;
    var c: f64 = 2.71828;
    const hello: []const u8 = "Olá, Zig!";
    var boolean: bool = true;

    // Arrays e slices
    var arr = [_]i32{ 1, 2, 3, 4, 5 };
    var slice = arr[0..];

    // Structs e Unions
    var p = Point{ .x = 10, .y = 20 };
    var data = Data{ .i = 42 };

    // Ponteiros
    var ptr = &a;
    ptr.* += 5;

    // Operadores
    var result: i32 = a + @as(i32, @intCast(b)) - 5;
    result = if (a > 10) a else b;
    result &= 0xFF;
    result |= 0xAA;
    result ^= 0x55;
    result <<= 2;

    // Controle de fluxo
    if (a > 0) {
        std.debug.print("Positivo\n", .{});
    } else if (a < 0) {
        std.debug.print("Negativo\n", .{});
    } else {
        std.debug.print("Zero\n", .{});
    }

    switch (b % 5) {
        0 => std.debug.print("Múltiplo de 5\n", .{}),
        1, 2 => std.debug.print("1 ou 2\n", .{}),
        else => std.debug.print("Outro\n", .{}),
    }

    for (arr, 0..) |value, i| {
        if (i == 3) continue;
        std.debug.print("{} ", .{value});
    }
    std.debug.print("\n", .{});

    var i: usize = 0;
    while (i < 3) : (i += 1) {
        std.debug.print("While: {}\n", .{i});
    }

    // Label e goto (Zig tem continue e break com labels)
    outer: for (0..5) |x| {
        for (0..3) |y| {
            if (x == 2 and y == 1) continue :outer;
            std.debug.print("({},{}) ", .{ x, y });
        }
    }
    std.debug.print("\n", .{});

    // Funções
    const calc = AdvancedCalculator.init(10);
    std.debug.print("{}\n", .{calc});
    std.debug.print("Square: {}\n", .{calc.square()});

    const fact = factorial(5);
    std.debug.print("Fatorial de 5: {}\n", .{fact});

    // Error handling
    const div_result = divide(10.0, 2.0) catch |err| {
        std.debug.print("Erro: {}\n", .{err});
        return;
    };
    std.debug.print("Divisão: {d:.2}\n", .{div_result});

    // Memory allocation
    const dynamic = try allocator.alloc(i32, 10);
    defer allocator.free(dynamic);
    dynamic[0] = 999;

    // Generics
    const m = max(i32, 10, 25);
    std.debug.print("Max: {}\n", .{m});

    // Math
    std.debug.print("Sqrt: {d:.2}\n", .{@sqrt(c)});
    std.debug.print("Pow: {d:.2}\n", .{@pow(@as(f64, 3.14), 2)});

    // Strings
    std.debug.print("Length: {}\n", .{hello.len});

    std.debug.print("\nPrograma Zig concluído com sucesso!\n", .{});
}
