// Definindo que isso é um algoritmo em Pascal
program tutorial;

type
    md_array = array[1..10, 1..10] of integer; // Variável do tipo array bidimensional de inteiro(matriz)

// Definidindo uma constante
const
    pi = 3.141592654;

// Definindo variáveis
var 
    name: string;   // Variável do tipo string
    age: integer;   // Variável do tipo inteiro
    res: boolean;   // Variável do tipo boolean

// Declaração da função
function ageTest(age: integer): boolean; 
var
    result: boolean; // Resultado da função
begin
    if (age >= 18) then // Condicional
        result := true
    else
        result := false;

    ageTest := result; // Retorno
end;

// Bloco principal
Begin
    writeln('Enter your name: ');
    readln(name);   // Recebe um nome

    writeln('Enter your age: ');
    readln(age);    // Recebe uma idade

    res := ageTest(age);
    write('Are you of legal age? ');
    if res then
        writeln('YES')
    else
        writeln('NO');

End. // Fim do bloco principal
