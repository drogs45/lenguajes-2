{- |CI 3661 - TALLER DE LENGUAJES DE PROGRAMACION
 -
    PROYECTO 1

    ARCHIVO: PIXELS.hs

    CONTENIDO: Contiene la definici&#243;n del tipo de Datos de Pixeles, el alfabeto que vamos a utilizar y las funciones que trabajan con este tipo de Datos. 

    SECCION 1, GRUPO 9

    AUTORES: 
      
      *  Elias Matheus 04-37261
      
      *  Alfonso Ros 06-40254
-}
module Pixels (
  font,
  concatPixels,
  messageToPixels
)
where

import Data.Char as DC
import Data.List as DL
import Graphics.HGL

-- | DESCRIPCI&#211;N: Tipo de Datos que vamos a utilizar para imprimir 
-- los mensajes en el LED DISPLAY. 
type Pixels = [[Pixel]]

data Pixel = Empty | Pixel { on :: Boolean, color :: Color}

-- Convierto cada caracter en pixel
convertPixels :: Char -> Pixel
convertPixels x = if x == '*' then Pixel ( true, blanco)
                              else Pixel ( false, blanco)
columna :: String -> Int
columna y = read $ (words y) !! 1

crearF t col = if (ys == []) then [(x,tail(xs))]
                             else (x,tail(xs)):(crearF ys col)
               where 
                  (xs, ys) = splitAt (col+1) t
                  x = head $ tail $ head xs 

readFont :: String -> DM.Map Char [String]
readFont t = do 
            let x = lines t
            let col = columna (head x)
            fromList $ crearF (tail x) col
	
font :: Map Char Pixels -> Char -> Pixels


