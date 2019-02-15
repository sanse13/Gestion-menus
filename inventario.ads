with productos;
PACKAGE Inventario IS

   PROCEDURE Cargar_Inventario;
   --post: almacena los productos del fichero en un array
   PROCEDURE Guardar_Inventario;
   --post: sobreescribe los productos en el mismo fichero de texto
   PROCEDURE Imprimir_Inventario;
   --post: imprime todos los productos del inventario por pantalla
   FUNCTION Cuantos_Productos RETURN Integer;
   --post: devuelve cuantos productos diferentes contiene el inventario
   PROCEDURE Obtener_Producto (Codigo: Integer; Exito: OUT Boolean; Pro: OUT Productos.Producto);
   --pre: dado un codigo
   --post: devuelve el producto que coincide con el codigo pasado, e indica
   --con el parametro booleano exito
   PROCEDURE Actualizar_Cantidad (Codigo: Integer; NuevaCant: Integer);
   --pre: dado un codigo y una nueva cantidad
   --post: devuelve el producto que coincida con el codigo pasado y a este le pone la nueva cantidad
   PROCEDURE Dar_De_Alta(Pro: Productos.Producto);
   --pre: dado un producto;
   --post: devuelve el inventario con el producto añadido
   PROCEDURE Dar_De_Baja(Codigo: Integer);
   --pre: dado un codigo
   --post: devuelve el inventario pero sin el producto que coincida con el codigo pasado

END Inventario;


