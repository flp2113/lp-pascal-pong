fibonacci :: Int -> Int -- Define o tipo da função (Int -> Int)
fibonacci 0 = 0 -- Caso base 1: Fibonacci(0) = 0
fibonacci 1 = 1 -- Caso base 2: Fibonacci(1) = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2) -- Caso recursivo: Fibonacci(n) = Fibonacci(n-1) + Fibonacci(n-2)

main :: IO () -- Função principal que realiza a interação com o usuário
main = do
putStrLn "Digite um número: " -- Solicita um número ao usuário
input <- getLine -- Lê a entrada do usuário
let num = read input :: Int -- Converte a entrada para inteiro
putStrLn $ "Sequência de Fibonacci até " ++ show num ++ " termos:" -- Imprime a mensagem
print [fibonacci n | n <- [0..(num-1)]] -- Calcula e imprime a sequência até o número inserido