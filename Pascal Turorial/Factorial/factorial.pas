program Functional_Programming;

Var
    i, dummy : integer;

function factorial_recursion(const a: integer) : integer;
{ Recursively calculates the factorial of integer parameter a }
Begin
    If a >= 1 Then
        factorial_recursion := a * factorial_recursion(a-1)
    Else
        factorial_recursion := 1;
End; 

procedure get_integer(var i : integer; dummy : integer);
{ Get user input and store it in the integer parameter i. }
Begin
    write('Enter an integer: ');
    readln(i);
    dummy := 4; { dummy will not change value outside of the procedure }
End;

Begin 
    dummy := 3;
    get_integer(i, dummy);
    writeln(i, '! = ', factorial_recursion(i));
    writeln('dummy = ', dummy); { Always outputs '3' since dummy is unchanged. }
End.
