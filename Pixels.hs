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
import Graphics.GCL

-- | DESCRIPCI&#211;N: Tipo de Datos que vamos a utilizar para imprimir 
-- los mensajes en el LED DISPLAY. 
type Pixels = [[Pixel]]

data Pixel = Empty | Pixel { on :: Boolean, color :: Color}

font :: Map Char Pixels -> Char -> Pixels

readFont :: Handle -> IO(Map Char Pixels)

-- Convierto cada caracter en pixel
convertPixels :: Char -> Pixel
convertPixels x = if x == '*' then Pixel ( true, blanco)
                              else Pixel ( false, blanco)
