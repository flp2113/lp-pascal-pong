program Fibonacci;
uses crt;

function Fibonacci(n: integer): integer;  
    if (n = 0) then                       
        Fibonacci := 0
    else if (n = 1) then                  
        Fibonacci := 1
    else
        Fibonacci := Fibonacci(n - 1) + Fibonacci(n - 2); 
end;

var
    i, num: integer;
begin
    clrscr;                              
    write('Digite um número: ');         
    readln(num);                         
    writeln('Sequência de Fibonacci até ', num, ' termos:');
    for i := 0 to num - 1 do             
        write(Fibonacci(i), ' ');        
    writeln;                             
    readln;                              
end.

