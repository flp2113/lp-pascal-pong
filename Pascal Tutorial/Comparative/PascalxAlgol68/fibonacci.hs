fibonacci :: Int -> Int 
fibonacci 0 = 0 
fibonacci 1 = 1 
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2) 

main :: IO () 
main = do
putStrLn "Digite um número: " 
input <- getLine 
let num = read input :: Int 
putStrLn $ "Sequência de Fibonacci até " ++ show num ++ " termos:" 
print [fibonacci n | n <- [0..(num-1)]] 