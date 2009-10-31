{- |CI 3661 - TALLER DE LENGUAJES DE PROGRAMACION
 -
    PROYECTO 2

    ARCHIVO: led_display.hs

    CONTENIDO:
    SECCION 1, GRUPO 9

    AUTORES: 
      
      *  Elias Matheus 04-37261
      
      *  Alfonso Ros 06-40254
-}

import Data.Char as DC
import Data.List as DL
import Data.Map as DM
import System.IO

type Word = [Char]

{- Contar Palabras
wordCount = length . concat . map words . lines

-- Formato simple (quitar blancos de mas)
formatAll  = unlines . map formatLine . lines
formatLine = rebuild . words
             where
               rebuild ws = if null ws then []
                                       else unwords ws

-- Convertir parrafos
type Para = [Word]

breakOn x xs = if null zs then [xs] 
                          else ys : breakOn x (tail zs)
               where (ys,zs) = span (/= x) xs

paras = map concat . filter (not . null) . breakOn [] . map words . lines

-- Justificar parrafos
fillPara n ws = if null xs then []
                           else xs : fillPara n ys
                where (xs,ys) = splitAt (greedy n ws) ws

greedy n = length . takeWhile (<=n) . scanl1 mn1 . map length
           where m `mn1` n = m + n + 1

format'' n = unparas . map (fillPara n) . paras

joinWith x = foldr1 stick
             where xs `stick` ys = xs ++ [x] ++ ys

unparas = unlines . joinWith [] . map (map unwords)

-}

crearF t col = if DL.null ys then [(x,tail(xs))]
                             else (x,tail(xs)):(crearF ys col)
               where 
                  x = head xs 
                  (xs, ys) = splitAt (col+1) t

columna :: String -> Int
columna y = read $ (words y) !! 1

font :: String -> DM.Map String [String]
font t = do 
          let x = lines t
          let t = columna (head x)
          fromList $ crearF (tail x) t
					
main = do 
          let file = "font"
          text <- readFile file
          let n = font text
          putStrLn $ unlines $ concat $ DM.lookup "\"$\"" n 
          putStrLn "Se acabo" 
