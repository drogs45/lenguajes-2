import System.IO
import P1

main = do
          let file = "effects-sample.txt"
          h <- openFile file ReadMode
          (x,y) <- readDisplayInfo h 
          putStrLn "Se acabo"
