WITH Text_IO;
USE Text_IO;
PACKAGE Productos IS
   TYPE Producto IS PRIVATE; --de tipo privado porque puedo jugar con la asignacion y la igualdad en este caso
   PROCEDURE Crear_Producto (Nombre_Producto: String; Peso: float; Precio: float; Cantidad: Integer; Pro: OUT Producto);
   --pre: nombre tiene exactamente 25 caracteres, peso y precio: float, cantidad: integer
   --post: inicializa el producto con los parametros y codigo toma el valor 0
   FUNCTION Nombre_Producto (Pro: Producto) RETURN String;
   --post: devuelve el nombre del producto Pro
   FUNCTION Cantidad_Producto (Pro: Producto) RETURN Integer;
   --post: devuelve la cantidad del producto Pro
   FUNCTION Precio_Producto (Pro: Producto) RETURN Float;
   --post: devuelve el precio del producto Pro
   FUNCTION Peso_Producto (Pro: Producto) RETURN Float;
   --post: devuelve el peso del producto Pro
   FUNCTION Codigo_Producto (Pro: Producto) RETURN Integer;
   --post: devuelve el codigo del producto Pro
   PROCEDURE Cambiar_Codigo (Pro: IN OUT Producto; Codigo: Integer);
   --post: modificia el codigo del producto con el valor Codigo
   PROCEDURE Cambiar_Nombre (Pro: IN OUT Producto; Nombre: String);
   --post: modifica el nombre del producto con el valor Nombre
   PROCEDURE Cambiar_Precio (Pro: IN OUT Producto; Precio: Float);
   --post: modifica el precio del producto con el valor Precio
   PROCEDURE Cambiar_Cantidad (Pro: IN OUT Producto; Cantidad: Integer);
   --post: modifica la cantidad del producto con el valor Cantidad
   PROCEDURE Cambiar_Peso (Pro: IN OUT Producto; Peso: Float);
   --post: modifica el peso del producto con el valor Peso
   PROCEDURE Leer_De_Fichero (File: IN File_Type; Pro: OUT Producto);
   --pre: dado un fichero que por linea sigue en orden los atributos: codigo, precio
   --cantidad, peso y nombre
   --post: asigna los atributos de la linea del fichero al producto Pro
   PROCEDURE Imprimir_Producto (Pro: Producto);
   --post: imprime por pantalla los atributos codigo, nombre, precio, cantidad y peso
   PROCEDURE Escribir_En_Fichero (File: IN OUT File_Type; Pro: producto);
   --pre: dado un fichero de texto abierto en modo escritura
   --post: escribe un producto con sus atributos en una linea del fichero
   PROCEDURE Leer_De_Teclado (P :OUT Producto);
   --post: crea un producto a partir de lo introducido por teclado

   PRIVATE
   TYPE Producto IS RECORD
      Codigo: Integer;
      Precio: Float;
      Cantidad: Integer;
      Peso: Float;
      Nombre_Producto: String (1..25);
   END RECORD;

END Productos;


