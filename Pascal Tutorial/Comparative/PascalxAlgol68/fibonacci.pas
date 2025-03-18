program Fibonacci;
uses crt;

function Fibonacci(n: integer): integer;  // Função recursiva para calcular Fibonacci
begin
    if (n = 0) then                       // Caso base 1: Fibonacci(0) = 0
        Fibonacci := 0
    else if (n = 1) then                  // Caso base 2: Fibonacci(1) = 1
        Fibonacci := 1
    else
        Fibonacci := Fibonacci(n - 1) + Fibonacci(n - 2); // Caso recursivo
end;

var
    i, num: integer;
begin
    clrscr;                              // Limpa a tela
    write('Digite um número: ');         // Solicita um número ao usuário
    readln(num);                         // Lê o número do usuário
    writeln('Sequência de Fibonacci até ', num, ' termos:');
    for i := 0 to num - 1 do             // Loop para calcular os termos
        write(Fibonacci(i), ' ');        // Imprime cada número da sequência
    writeln;                             // Nova linha após o loop
    readln;                              // Aguarda a interação do usuário antes de finalizar
end.

