module Parcial where
import Text.Show.Functions()

--Hago la estructura por perrito
data Perrito = unPerrito {
  raza :: String,
  juguetesFav :: [String],
  tiempoEnGuarderia :: Int,
  energia :: Int
  } deriving (Show , Eq)

data Guarderia = unaGuarderia {
   nombre :: String,
   rutinaEntretenimiento :: [Actividad]
   } deriving (Show , Eq)

data Actividad = unaActividad {
   ejercicio :: Perrito -> Perrito,
   tiempo :: Int
   } deriving (Show , Eq)
--Ejercicio es una función que luego voy a desarrollar

--Modifica energía
jugar :: Perrito -> Perrito
jugar unPerrito = unPerrito { energia = max 0 (energia unPerrito - 10) }

ladrar :: Int -> Perrito -> Perrito
ladrar CantLadridos unPerrito  = unPerrito { energia = (+ (cantLadridos `div` 2)) (energia unPerrito) }

--funcion regalar
regalar :: String -> Perrito -> Perrito
regalar unJuguete unPerrito = unPerrito { juguetesFav = unJuguete : juguetesFav unPerrito }

--dias especiales
diaDeSpa :: Perrito -> Perrito
diaDeSpa unPerrito  
    | tiempoEnGuarderia unPerrito >= 50 
    || raza unPerrito == "dalmata" 
    || pomerania unPerrito == "pomerania" 
   = regalar "peine de goma" ( unPerrito { energia = 100 } )
   | otherwise = unPerrito

diaDeCampo :: Perrito -> Perrito
diaDeCampo unPerrito = unPerrito { juguetesFav = tail ( jueguetesFav unPerrito ) }


