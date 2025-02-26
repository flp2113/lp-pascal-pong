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

// Função 
function ageTest(age: integer): boolean;
var
    result: boolean;
begin
    if (age >= 18) then
        result := true
    else
        result := false;

    ageTest := result;
end;

Begin
    writeln('Enter your name: ');
    //flush(output);   // Force output to display before input
    readln(name);    // Read user input

    writeln('Enter your age: ');
    //flush(output);
    readln(age);

    res := ageTest(age);
    if res then
        writeln('YES')
    else
        writeln('NO');

    writeln('This is my program.');
End.
