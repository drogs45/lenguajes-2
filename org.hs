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
  pixelsToString,
  pixelListToPixels,
  pixelListToString,
  concatPixels,
  messageToPixels,
  up,
  down,
  left,
  right,
  upsideDown,
  backwards
)
where

import Data.Char as DC
import Data.List as DL

-- | DESCRIPCI&#211;N: Tipo de Datos que vamos a utilizar para imprimir 
-- los mensajes en el LED DISPLAY. 
type Pixels = [String]

-- | DESCRIPCI&#211;N: Arreglo de listas de caracteres. Cada uno representa 
-- una letra del alfabeto.
alf :: [Pixels]
alf =  [
        [ 
          "   *    ",
          "   **   ",
          "  ***   ",
          "  *  *  ",
          " *****  ",
          " *   ** ",
          "**    * ",
          "**   ***"
        ],
        [ 
          "***** ",
          " *   *",
          " *   *",
          " **** ",
          " *  * ",
          " *   *",
          " *   *",
          "***** "
        ],
        [
          "  ****",
          " *   *",
          "*     ",
          "*     ",
          "*     ",
          "*     ",
          " *   *",
          "  ****"
        ],
        [
          "******  ",   
          " *    * ",  
          " *     *", 
          " *     *", 
          " *     *", 
          " *     *", 
          " *    * ",  
          "******  "   
        ],
        [
          "******", 
          " *    ",   
          " *    ",    
          " **** ",  
          " *    ",    
          " *    ",     
          " *    ",    
          "******" 
        ],
        [
          "******", 
          " *    ", 
          " *    ",  
          " **** ",  
          " *  * ",  
          " *    ",     
          " *    ",     
          "***   "    
        ],
        [
          "  **** ", 
          " *   * ",  
          "*      ", 
          "*      ", 
          "*   ***", 
          "*    * ",  
          " *   * ",  
          "  **** " 
        ],
        [
          "***  ***", 
          " *    * ",  
          " *    * ",  
          " ****** ",  
          " *    * ",  
          " *    * ",  
          " *    * ",  
          "***  ***" 
        ],
        [
          "***", 
          " * ",  
          " * ", 
          " * ",  
          " * ",  
          " * ",  
          " * ",  
          "***"  
        ],   
        [
          "  ***", 
          "  *  ", 
          "  *  ", 
          "  *  ", 
          "  *  ", 
          "  *  ", 
          "* *  ", 
          "***  " 
        ],
        [
          "*** ** ",  
          " *  ** ",  
          " * **  ",   
          " **    ",     
          " * *   ",    
          " * **  ",   
          " *  ** ",  
          "*** ***" 
        ],
        [
          "***  ",   
          " *   ",    
          " *   ",    
          " *   ",    
          " *   ",    
          " *   ",    
          " *  *", 
          "*****" 
        ],
        [
          "***   ***", 
          " **   ** ", 
          " ***  ** ",  
          " * * * * ",  
          " * * * * ",  
          " *  *  * ",  
          " *  *  * ",  
          "***   ***" 
        ],
        [ 
          "**   ***",
          " **   * ",
          " **   * ",
          " * *  * ",
          " *  * * ",
          " *  *** ",
          " *   ** ",
          "***   * "
        ],
        [ 
          "  ***  ",
          " *   * ",
          "*     *",
          "*     *",
          "*     *",
          "*     *",
          " *   * ",
          "  ***  "
        ],
        [ 
          "***** ",
          " *   *",
          " *   *",
          " *   *",
          " **** ",
          " *    ",
          " *    ",
          "***   "
        ],
        [ 
          "  ***   ",
          " *   *  ",
          "*     * ",
          "*     * ",
          "*     * ",
          " *   ** ",
          "  ****  ",
          "      **"
        ],
        [ 
          "*****  ",
          " *   * ",
          " *   * ",
          " *  *  ",
          " ****  ",
          " *  *  ",
          " *  ** ",
          "***  **"
        ],
        [ 
          " *** ",
          "*  * ",
          "*    ",
          " *   ",
          "  ** ",
          "   * ",
          "*  * ",
          "***  "
        ],
        [ 
          "******* ",
          "   *    ",
          "   *    ",
          "   *    ",
          "   *    ",
          "   *    ",
          "   *    ",
          "  ***   "
        ],
        [
          "***  ***",
          " *    * ",
          " *    * ",
          " *    * ",
          " *    * ",
          " *    * ",
          " *    * ",
          "  ****  "
        ],
        [
          "***   ***",
          " **   *  ",
          "  *   *  ",
          "  *  **  ",
          "   * *   ",
          "   * *   ",
          "   **    ",
          "    *    "
        ],
        [
          "***  *  **",
          " *  **  * ",
          " *  **  * ",
          "  * **  * ",
          "  *** **  ",
          "  **  **  ",
          "  **  **  ",
          "   *  *   "
        ],
        [
          "***  **",
          " **  * ",
          "  * ** ",
          "   **  ",
          "  ***  ",
          " ** *  ",
          " *   * ",
          "**  ***"
        ],
        [
          "***  ***",
          " **  ** ",
          "  *  *  ",
          "   **   ",
          "   *    ",
          "   *    ",
          "   *    ",
          "  ***   "
        ],
        [
          "*****",
          "*  * ",
          "   * ",
          "  *  ",
          "  *  ",
          " *   ",
          " *  *",
          "*****"
        ]
       ]

{-| DESCRIPCI&#243;N: Permite obtener la representaci&#243;n en pixeles de un 
  caracter especial. Se accede a la posici&#243;n del arreglo de acuerdo 
  al n&#250;mero ASCII.

    PAR&#193;METROS:
                
                * (->) Char l

                * (<-) Pixels
-}
font alf   :: Char -> Pixels
font l 
  | DC.ord l >= 65 && DC.ord l <= 90 = alf !! ((DC.ord l) - 65)
  | l == '\209'                      = [
                                         "   ***  ",
                                         "**   ***",
                                         " **   * ",
                                         " * *  * ",
                                         " *  * * ",
                                         " *  *** ",
                                         " *   ** ",
                                         "***   * "
                                       ]
  | l == '-'                         = [
                                         "       ",
                                         "       ",
                                         "       ",
                                         "       ",
                                         "****** ",
                                         "       ",
                                         "       ",
                                         "       "
                                       ]
  | l == ' '                         = [
                                         " ",
                                         " ",
                                         " ",
                                         " ",
                                         " ",
                                         " ",
                                         " ",
                                         " "
                                       ]
  | otherwise                        = error "Not a valid input"

{-| DESCRIPCI&#211;N: Convierte un valor del tipo Pixels en un string, 
  colocando retornos del carro en el medio. Al Pixels(lista de 
  String) se le intercala el retorno de carro, entre cada par de 
  elementos y luego se concatenan todos los elementos, a trav&#233;s 
  de la func&#243;n 'Data.List.unlines'.
 
    PAR&#193;METROS:
                
                * (->) Pixels p  
                
                * (<-) String
-}

pixelsToString    :: Pixels -> String
pixelsToString    p  = unlines p

{-| DESCRIPCI&#211;N: Convierte una lista de Pixels en un valor Pixels que 
  lo represente, combinando los elementos de la lista original con una
  cadena vac&#205;a entre cada uno. A la lista de Pixels se le intercala una 
  lista que solo contiene la cadena vac&#205;a, y luego se concatenan sus 
  elementos. 

    PAR&#193;METROS:
                
                * (->) Lista de Pixels p  
                
                * (<-) String
-}
pixelListToPixels :: [Pixels] -> Pixels
pixelListToPixels pl = DL.concat $ DL.intersperse [""] pl

{-| DESCRIPCI&#211;N:  Procesa una lista de Pixels, convierte cada elemento 
  a String y luego combina todos los resultados incorporando retornos 
  de carro en medio. Convierte cada elemento a string a trav&#233;s de 
  'pixelsToString', le intercala el retorno de carro, y concatena 
  todos los elementos.

    PAR&#193;METROS:
                
                * (->) Lista de Pixels p  
                
                * (<-) String
-}
pixelListToString :: [Pixels] -> String
pixelListToString pl = DL.concat $ DL.intersperse "\n" $ DL.map unlines pl

{-| DESCRIPCI&#211;N: Convierte una lista de Pixels en un valor Pixels que lo 
  represente, pero realizando la concatenaci&#243;n horizontal. La 
  concatenaci&#243; se hace a trav&#233;s de la funció&#243;transpose, y l 
  luego se procede a concatenar cada uno de los elementos.

    PAR&#193;METROS:
                
                * (->) Lista de Pixels p  
                
                * (<-) Pixels
-}
concatPixels      :: [Pixels] -> Pixels
concatPixels      pl = DL.map DL.concat $ DL.transpose pl

{-| DESCRIPCI&#211;N: Convierte un String en un Pixels, agregando un espacio 
  en blanco entre caracteres. Se busca la representaci&#243;n de cada caracter 
  y luego se hace uso de la funci&#243;n 'concatPixels'

    PAR&#193;METROS:
                
                * (->) String s  
                
                * (<-) Pixels
-}
messageToPixels   :: String -> Pixels
messageToPixels "" = []
messageToPixels s  = concatPixels $ intersperse (font ' ') $ DL.map font s

{-| DESCRIPCI&#211;N: Toma el primer elemento de una Lista y lo coloca en 
el &#250;timo lugar de esta. Aplicada a un caracter, toma la primera fila 
de LEDs y la coloca como &#250;ltima fila del caracter.

    PAR&#193;METROS:

                * (->) Lista

                * (<-) Lista
-}

up         :: [a] -> [a]
up         p = DL.tail p ++ [ DL.head p ]

{-| DESCRIPCI&#211;N: Toma el &#250;ltimo elemento de una Lista y lo coloca en 
  el primer lugar de esta. Aplicada a un caracter, toma la &#250;ltima fila 
  de LEDs y la coloca como primera fila del caracter.

    PAR&#193;METROS:

                * (->) Lista

                * (<-) Lista
-}

down       :: [a] -> [a]
down       p = [ DL.last p ] ++ DL.init p

{-| DESCRIPCI&#211;N: Toma cada fila de LEDs del caracter y coloca el primer 
  LED de cada fila al final de la fila.

    PAR&#193;METROS:

                * (->) Pixels

                * (<-) Pixels
-}

left       :: Pixels -> Pixels
left       p = DL.map up p

{-| DESCRIPCI&#211;N: Toma cada fila de LEDs del caracter y coloca el 
  &#250;ltimo LED de cada fila al principio de la fila.

    PAR&#193;METROS:

                * (->) Pixels

                * (<-) Pixels
-}

right      :: Pixels -> Pixels
right      p = DL.map down p

{-| DESCRIPCI&#211;N: Invierte las filas de LEDs del caracter. Mueve cada 
  fila y la coloca en su posici&#211; opuesta y sim&#233;trica al centro de la 
  Lista de LEDs. Invierte verticalmente los Pixels.

    PAR&#193;METROS:

                * (->) Pixels

                * (<-) Pixels
-}

upsideDown :: Pixels -> Pixels
upsideDown p = DL.reverse p

{-| DESCRIPCI&#211;N: Para cada fila de LEDs, invierte cada LED de la 
  fila. Mueve cada LED y lo coloca en su posici&#243; opuesta y sim&#233;trica 
  al centro de la Lista de LEDs. Invierte horizontalmente los Pixels.

    PAR&#193;METROS:

                * (->) Pixels

                * (<-) Pixels
-}

backwards  :: Pixels -> Pixels
backwards  p = DL.map DL.reverse p
