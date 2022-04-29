productoCodiciado:: Num a => (String, a) -> Bool
productoCodiciado (nombre, _) = length nombre > 10

productoXL:: Num a => (String, a) -> String
productoXL (nombre, _) = nombre ++ "XL"

productoCorriente:: Num a => (String, a) -> Bool
productoCorriente (nombre, _) = elem (nombre!!0) ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U']

descodiciarProducto:: Num a => (String, a) -> String
descodiciarProducto (nombre, _) = take 10 nombre

versionBarata:: Num a => (String, a) -> String
versionBarata (nombre, precio) = reverse (descodiciarProducto (nombre, precio))

productoDeLujo:: Num a => (String, a) -> Bool
productoDeLujo (nombre, _) = (elem 'x' nombre) || (elem 'z' nombre)

productoDeElite:: Num a => (String, a) -> Bool
productoDeElite (nombre, precio)= productoDeLujo (nombre, precio) && productoCodiciado (nombre, precio) && not (productoCorriente (nombre, precio))

aplicarDescuento:: Num a => (String, a) -> a -> a
aplicarDescuento (_, precio) descuento = precio - descuento

entregaSencilla:: String -> Bool
entregaSencilla dia = mod (length dia) 2 == 0

aplicarCostoDeEnvio:: Num a => (String, a) -> a -> a
aplicarCostoDeEnvio (_, precio) costo = precio + costo

precioTotal:: Num a => (String, a) -> a -> a -> a -> a
precioTotal (nombre, precio) cantidad descuento costoDeEnvio = aplicarCostoDeEnvio (nombre, ((aplicarDescuento (nombre, precio) descuento)) * cantidad) costoDeEnvio

--take:: Int -> [a] -> [a]

--drop:: Int -> [a] -> [a]

--head:: [a] -> a

--elem:: a -> [a] -> Bool

--reverse:: [a] -> [a]
