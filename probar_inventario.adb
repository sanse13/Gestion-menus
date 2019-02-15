WITH Inventario;
with productos;
WITH Ada.Text_IO, Ada.Integer_Text_IO;
USE Ada.Text_IO, Ada.Integer_Text_IO;

PROCEDURE Probar_Inventario IS
   Exito: Boolean;
   Pro, Nuevo, Nuevo1, Nuevo2: Productos.Producto;
BEGIN
   Inventario.Cargar_Inventario;
   Inventario.Imprimir_Inventario;
   new_line;
   New_Line; Put("El numero de productos diferentes son: ");
   Put(Inventario.Cuantos_Productos, 0);
   New_Line; new_line;
   put("Vamos a buscar el producto 4768: ");
   New_Line; Inventario.Obtener_Producto(4768, Exito, pro); New_Line;
   IF Exito THEN
      Productos.Imprimir_Producto(Pro);
   ELSE
      Put("Busqueda no exitosa");
   END IF;
   Inventario.Obtener_Producto(4657, Exito, Pro);
   if exito then
      Inventario.Actualizar_Cantidad(4657, 38); New_Line;

   END IF;
   New_Line;
   put("----------------------------------"); new_line;
   Put("Vamos a dar de alta 3 ordenadores y algunas cantidades actualizadas "); new_line;
   Productos.Crear_Producto("Ordenador portatil HP    ", 532.50, 1000.25, 20, Nuevo);
   Productos.Crear_Producto("Ordenador portatil Lenovo", 480.75, 867.25, 20, Nuevo1);
   Productos.Crear_Producto("Ordenador portatil Asus  ", 600.75, 534.25, 20, Nuevo2);
   Inventario.Dar_De_Alta(Nuevo);
   Inventario.Dar_De_Alta(Nuevo1);
   Inventario.Dar_De_Alta(nuevo2);
   New_Line;
   Inventario.Imprimir_Inventario;
   put("----------------------------------------------------------------");
   New_Line; put("Vamos a dar de baja ciertos productos: "); new_line; new_line;
   Inventario.Obtener_Producto(1001, Exito, Pro);
      IF Exito THEN
      inventario.Dar_De_Baja(1001);
   END IF;
   Inventario.Obtener_Producto(5010, Exito, Pro);
      IF Exito THEN
      inventario.Dar_De_Baja(5010);
   END IF;
   inventario.Imprimir_Inventario;
   put("----------------------------------------------------------------");
   Inventario.Guardar_Inventario;


END Probar_Inventario;

