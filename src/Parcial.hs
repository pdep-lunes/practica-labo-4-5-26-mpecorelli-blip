module Parcial where
import Text.Show.Functions()

//Hago la estructura por perrito
data Perrito = unPerrito {
  raza :: String,
  juguetesFav :: [String],
  tiempoEnGuarderia :: Int,
  energia :: Int
  }

data Guarderia = unaGuarderia {
   nombre :: String,
   rutinaEntretenimiento :: [Actividad]
   }

data Actividad = unaActividad {
   ejercicio :: Perrito -> Perrito,
   tiempo :: Int
   }
//Ejercicio es una función que luego voy a desarrollar
   
