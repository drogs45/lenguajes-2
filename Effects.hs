
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

module Effects (
  readDisplayInfo
)
where


--import Data.Char as DC
import Data.List
--import Data.Map  as DM
--import Data.Maybe 
import Graphics.HGL
import System.IO
import Pixels

data Effects   = Up 
               | Down
               | Left
               | Right
               | Backwards
               | UpsideDown
               | Invert
               | Color Color
               | Delay Integer
               | Forever [Effects]
               | Repeat Integer [Effects]
               deriving(Show, Read, Eq)

readDisplayInfo :: Handle -> IO (String, Effects)
readDisplayInfo h = do
                      str <- hGetLine h
                      s <- hGetContents h
                      let e = concat $ intersperse " " $ words s 
                      let f = toEffectList e
                      return (str, Repeat 1 f) 

toEffectList :: String -> [Effects]
toEffectList s = if xs == "" then [e]
                             else  e:toEffectList xs
                 where [(e, xs)] = reads s :: [(Effects, String)]

--up :: Pixels -> Pixels
up []     = []
up (x:xs) = xs ++ [ x ]

--down :: Pixels -> Pixels
down [] = []
down xs =  last xs : init xs 

left :: Pixels -> Pixels
left []     = []
left (x:xs) = up x : left xs

right :: Pixels -> Pixels
right []     = []
right (x:xs) = down x : right xs

backwards :: Pixels -> Pixels
backwards []     = []
backwards (x:xs) = reverse x : backwards xs

upsideDown :: Pixels -> Pixels
upsideDown [] = []
upsideDown xs = reverse xs

invert :: Pixels -> Pixels
invert []     = []
invert (x:xs) = map inv x : invert xs
              where
                   inv p = if (on p)
                              then Pixel False (color p)
                              else Pixel True  (color p)

--delay :: Int

{-
-- | DESCRIPCI&#211;N: Tipo de Datos que vamos a utilizar para imprimir 
-- los mensajes en el LED DISPLAY. 
type Pixels = [[Pixel]]

data Pixel = Empty | Pixel { on :: Bool, color :: Color}
						 deriving (Show)

-- Convierto cada caracter en pixel
convertPixels :: Char -> Pixel
convertPixels x = if x == '*' then Pixel { on = True, color = White}
                              else Pixel { on = False, color = White}

-- Busco la columna
columna :: String -> Int
columna y = read $ (words y) !! 1

--Imprimo los pixels a partir de un arreglo de string
stringToPixel :: [Char] -> [Pixel]
stringToPixel x = Prelude.map convertPixels x

-- Construyo un arreglo
crearF t col = if (ys == []) then [(x,Prelude.map stringToPixel $ tail xs)]
                             else (x, Prelude.map stringToPixel $ tail xs):(crearF ys col)
               where 
                  (xs, ys) = splitAt (col+1) t
                  x = head $ tail $ head xs 

-- Recibe el archivo y devuelve el hash
readFont :: Handle -> IO (DM.Map Char Pixels)
readFont h = do 
                t <- hGetContents h
                let x = lines t
                let col = columna (head x)
                return $ fromList $ crearF (tail x) col

-- Prende un Pixel
pixelOn :: Pixel -> Pixel
pixelOn x = Pixel { on = True, color = White}

-- Prende la fila
pixelRowOn ::  [Pixel] -> [Pixel]
pixelRowOn a = Prelude.map pixelOn a

-- Revisa el font
font :: DM.Map Char Pixels -> Char -> Pixels
font alf c = if isJust y then fromJust y
												 else Prelude.map pixelRowOn elem1
						 where 
						 		y = DM.lookup c alf
								elem1 = snd $ elemAt 0 alf


-- FUNCIONES GRAFICAs

ppc     = 8
altura  = 20
anchura = 20

type Posicion = (Int,Int)
type Pantalla = [ Posicion ]

strToPos :: [ Pixel ] -> Int -> Int -> [ Posicion ]
strToPos []     _ _ = []
strToPos (x:xs) n m = if ( on x ) 
                         then (n,m) : strToPos xs (n+1) m
                         else strToPos xs (n+1) m

pixelToPos :: Pixels -> Int -> [ Posicion ]
pixelToPos []     _ = []
pixelToPos (x:xs) n = strToPos x 1 n  ++ pixelToPos xs (n+1)


led :: Posicion -> Graphic
led (x,y) = withColor White $ ellipse (x*ppc,y*ppc) ((x+1)*ppc,(y+1)*ppc)

leds :: Pantalla -> [ Graphic ]
leds t = DL.map led t

toIO :: Pantalla -> IO Pantalla
toIO p =
  return $ p



 {-| DESCRIPCI&#211;N: Convierte una lista de Pixels en un valor Pixels que 
    lo represente, combinando los elementos de la lista original con una
    cadena vac&#205;a entre cada uno. A la lista de Pixels se le intercala una 
    lista que solo contiene un pixel apagado, y luego se concatenan sus 
    elementos. 
  
      PAR&#193;METROS:
                  
                  * (->) Lista de Pixels p  
                  
                  * (<-) Pixels
-}
pixelListToPixels :: [Pixels] -> Pixels
pixelListToPixels pl = DL.concat $ DL.intersperse [[ Pixel { on = False , color = White} ]] pl

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
messageToPixels   :: DM.Map Char Pixels -> String -> Pixels
messageToPixels _   ""   = []
messageToPixels alf s    = concatPixels $ intersperse (font alf ' ') $ DL.map (font alf) s
-}
