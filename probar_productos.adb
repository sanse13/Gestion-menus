WITH Ada.Text_IO, Ada.Integer_Text_IO, ada.Float_Text_IO;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
WITH Productos;

PROCEDURE Probar_Productos IS
   Pro, P, Producto: Productos.Producto;
   File: file_type;
BEGIN
   Productos.Crear_Producto ("Leche merengada          ", 12.5, 2.5, 50, Pro);
   Put(Productos.Nombre_Producto(Pro));
   New_Line;
   Put(Productos.Cantidad_Producto(Pro),0);
   New_Line;
   Put(Productos.Precio_Producto(Pro), 0, 2, 0);
   New_Line;
   Put(Productos.Peso_Producto(Pro),0, 2, 0);
   New_Line;
   Put(Productos.Codigo_Producto(Pro),0);
   New_Line;
   new_line;
   Put("El nuevo producto de la leche es el siguiente: ");   New_Line;
   New_Line;
   put("Nombre: ");
   Productos.Cambiar_Nombre(Pro, "Leche kaiku              ");
   Put(Productos.Nombre_Producto(pro));
   New_Line;
   Put("Peso: ");   Productos.Cambiar_Peso(Pro, 15.0); Put(Productos.Peso_producto(pro), 0, 2, 0);
   New_Line;
   put("Precio: ");
   Productos.Cambiar_Precio(Pro, 3.0); Put(Productos.Precio_producto(pro), 0, 2, 0);
   New_Line;
   put("Codigo: ");
   Productos.Cambiar_Codigo(Pro, 100010010); Put(Productos.Codigo_producto(pro), 0);
   New_Line;
   put("Cantidad: ");
   Productos.Cambiar_Cantidad(Pro, 100); Put(Productos.Cantidad_Producto(Pro), 0);
   New_Line; New_Line;
   Open(File, In_File, "productosP.txt");
   productos.Leer_De_Fichero(file, pro);
   Productos.Imprimir_Producto(Pro);
   Close(File);
--   create(file, Out_File, "nuevosProductos.txt");
--   Productos.Escribir_En_Fichero(File, 102120, 12.5, 30, 20.2, "Mesa tipo escritorio");
--   Close(File);
   Productos.Crear_Producto("Consolador rosa y negro  ", 5.00, 20.95, 1, Producto);
   Productos.Cambiar_Codigo(Pro, 1000);
   Create(File, Out_File, "nuevosProductos.txt");
   Productos.Escribir_En_Fichero(File, Producto);
   close(file);
   new_line;
   Productos.Leer_De_Teclado(P);
   New_Line;
   productos.Imprimir_Producto(p);
   New_Line;




END Probar_Productos;
