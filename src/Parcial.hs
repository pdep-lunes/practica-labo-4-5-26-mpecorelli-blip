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

--modelado de personaje y guarderia
Zara :: Perrito
Zara = unPerrito {
  raza = "dalmata",
  juguetesFav := ["pelota","mantita"],
  tiempoEnGuarderia = 90,
  energia = 80
  }

GuarderiaDePerritos :: Guarderia
GuarderiaDePerritos = unaGuarderia {
  nombre = GuarderíaPdePerritos,
  rutinaEntretenimiento :: [ actividadJugar , actividadLadrar 18 , actividadRegalar , actividadSpa , actividadCampo ]
   }

actividadJugar :: Actividad
actividadJugar = unaActividad {
    ejercicio = jugar,
    tiempo = 30
}

actividadLadrar :: Int -> Actividad
actividadLadrar = unaActividad {
    ejercicio = ladrar /unaCantidad,
    tiempo = 20
}

actividadRegalar :: Actividad
actividadRegalar = unaActividad {
    ejercicio = regalar "pelota",
    tiempo = 0
}

actividadSpa :: Actividad
actividadSpa = unaActividad {
    ejercicio = diaDeSpa,
    tiempo = 120
}

actividadCampo :: Actividad
actividadCampo = unaActividad {
    ejercicio = diaDeCampo,
    tiempo = 720
}


