// comprehensive_typescript_example.ts
// Exemplo abrangente em TypeScript

// ======================== TIPOS BÁSICOS ========================
let num: number = 42;
const str: string = "Olá, TypeScript!";
let bool: boolean = true;
let nullable: string | null = null;
let undef: undefined = undefined;
let anyValue: any = "pode ser qualquer coisa";
let unknownValue: unknown = 123;

// Arrays, Tuplas e Enums
const numbers: number[] = [1, 2, 3, 4, 5];
const names: Array<string> = ["Ana", "João", "Maria"];

type Coordinate = [number, number]; // Tuple
const point: Coordinate = [10, 20];

enum Color {
    Red = "#FF0000",
    Green = "#00FF00",
    Blue = "#0000FF"
}

// ======================== INTERFACES E TIPOS ========================
interface User {
    readonly id: number;
    name: string;
    age?: number;           // opcional
    email: string;
    readonly createdAt: Date;
}

interface Admin extends User {
    role: "admin";
    permissions: string[];
}

type ID = string | number;
type ResponseData<T> = { success: boolean; data: T; error?: string };

// ======================== CLASSES ========================
class Person implements User {
    readonly id: number;
    name: string;
    age?: number;
    email: string;
    readonly createdAt: Date;

    constructor(name: string, email: string, age?: number) {
        this.id = Math.floor(Math.random() * 10000);
        this.name = name;
        this.email = email;
        this.age = age;
        this.createdAt = new Date();
    }

    greet(): string {
        return `Olá, meu nome é ${this.name}`;
    }
}

class Employee extends Person {
    private salary: number;

    constructor(name: string, email: string, salary: number) {
        super(name, email);
        this.salary = salary;
    }

    getSalary(): number {
        return this.salary;
    }
}

// ======================== GENERICS ========================
function identity<T>(arg: T): T {
    return arg;
}

function merge<T extends object, U extends object>(obj1: T, obj2: U) {
    return { ...obj1, ...obj2 };
}

class GenericRepository<T> {
    private items: T[] = [];

    add(item: T): void {
        this.items.push(item);
    }

    getAll(): T[] {
        return [...this.items];
    }

    find(predicate: (item: T) => boolean): T | undefined {
        return this.items.find(predicate);
    }
}

// ======================== FUNÇÕES AVANÇADAS ========================
function sum(...numbers: number[]): number {
    return numbers.reduce((acc, n) => acc + n, 0);
}

const multiply = (a: number, b: number): number => a * b;

type Callback = (value: string) => void;

function withCallback(fn: Callback): void {
    fn("Callback executado!");
}

// ======================== ASYNC / AWAIT ========================
async function fetchData(id: ID): Promise<ResponseData<User>> {
    return new Promise((resolve) => {
        setTimeout(() => {
            resolve({
                success: true,
                data: {
                    id: typeof id === "number" ? id : parseInt(id),
                    name: "Test User",
                    email: "test@example.com",
                    createdAt: new Date()
                }
            });
        }, 500);
    });
}

// ======================== DECORATORS ========================
function Log(target: any, propertyKey: string, descriptor: PropertyDescriptor) {
    const original = descriptor.value;
    descriptor.value = function (...args: any[]) {
        console.log(`[LOG] ${propertyKey} chamado com:`, args);
        return original.apply(this, args);
    };
    return descriptor;
}

// ======================== MAIN ========================
async function main() {
    const user = new Person("Carlos", "carlos@email.com", 28);
    const employee = new Employee("Maria", "maria@empresa.com", 8500);

    console.log(user.greet());
    console.log("Salário:", employee.getSalary());

    // Generics
    const repo = new GenericRepository<User>();
    repo.add(user);

    const merged = merge({ a: 1 }, { b: "texto", c: true });
    console.log(merged);

    // Utility Types
    type PartialUser = Partial<User>;
    type ReadonlyUser = Readonly<User>;
    type PickUser = Pick<User, "name" | "email">;

    // Type Guards
    function isAdmin(user: User | Admin): user is Admin {
        return (user as Admin).role === "admin";
    }

    // Async
    const response = await fetchData(123);
    console.log("Resposta:", response);

    // Template Literal Types
    type EventName = `on${Capitalize<string>}`;
    const event: EventName = "onClick";

    console.log(`Fim do exemplo TypeScript!`);
    console.log(`Soma: ${sum(1, 2, 3, 4, 5)}`);
}

main().catch(console.error);

export { Person, Employee, GenericRepository };