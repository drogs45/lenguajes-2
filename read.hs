import System.IO
import Effects

main = do
          let file = "effects-sample.txt"
          h <- openFile file ReadMode
          (x,y) <- readDisplayInfo h
          print y
          putStrLn "Se acabo"
