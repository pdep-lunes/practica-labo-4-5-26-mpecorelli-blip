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
jugar: disminuye en 10 unidades la energía del perrito 🪫. ¡No puede quedar un valor negativo!
ladrar: aumenta la energía la mitad de los ladridos que se establezcan. 

jugar :: Perrito -> Perrito
jugar unPerrito = unPerrito { energia = max 0 (energia unPerrito - 10) }

ladrar :: Int -> Perrito -> Perrito
ladrar CantLadridos unPerrito  = unPerrito { energia = (+ (cantLadridos `div` 2)) (energia unPerrito) }
   
