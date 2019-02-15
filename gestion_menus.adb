with Productos, Inventario;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Gestion_Menus is
   Terminar, Exito: Boolean := False;
   Eleccion, Cantidad, Codigo: Integer:= 0;
   P: Productos.Producto;

   procedure Menu is
   begin
      New_line;
      Put_Line("Seleccione la accion a realizar tecleando el numero que la precede:");
      Put_Line("         1. Volver a cargar el inventario");
      Put_Line("         2. Mostrar inventario");
      Put_Line("         3. Cuantos productos hay en el inventario");
      Put_Line("         4. Obtener el producto");
      Put_Line("         5. Actualizar la cantidad del producto");
      Put_Line("         6. Dar de alta un producto");
      Put_Line("         7. Dar de baja un producto");
      Put_Line("         8. Guardar el inventario");
      Put_Line("         9. FINALIZAR");
   end Menu;

begin
   Inventario.Cargar_Inventario;
   while not Terminar loop
      Menu;
      New_line;
      Get(Eleccion); Skip_Line;
      if Eleccion in 1..9 then
         case Eleccion is
           when 1 =>
               Put_Line("Se van a cargar de nuevo los productos del fichero ");
               Inventario.Cargar_Inventario;

            when 2 =>
               Put_Line("Se van a mostrar los productos del inventario");
               Inventario.Imprimir_Inventario;

            when 3 =>
                Put_Line("Se van a mostrar el numero de productos del inventario");
                Cantidad := Inventario.Cuantos_Productos;
                Put(Cantidad, 0);

            when 4 =>
               New_line;
               Put_Line(">> Escribe el codigo del producto que quieres imprimir");
               Get(Codigo); Skip_Line;
               Put_Line("Codigo leido : " & Integer'Image(Codigo));
               Inventario.Obtener_Producto(Codigo, Exito, P);
               if exito then
                 productos.Imprimir_Producto(P);
                 New_Line;
               end if;

            when 5 =>
              New_Line;
              Put_Line(">> Escribe el codigo del producto que quieres actualizar");
              get(codigo); Skip_Line;
              Put_Line("Codigo leido : " & Integer'Image(Codigo));
              Inventario.Obtener_Producto(Codigo, Exito, P);
              if exito THEN
                Put_Line(">> Escribe la nueva cantidad para que se actualice");
                Get(Cantidad); skip_line;
                Put_Line("Nueva cantidad leida : " & Integer'Image(Cantidad));
                Inventario.Actualizar_Cantidad(Codigo, Cantidad);
                new_line;
                Inventario.Imprimir_Inventario;
              end if;

            when 6 =>
              new_line;
              Put_Line("Vamos a dar de alta un producto");
              productos.Leer_De_Teclado(P);
              new_line;
              inventario.Dar_De_Alta(P);
              inventario.Imprimir_Inventario;
              new_line;

              when 7 =>
                new_line;
                Put_Line(">>Escribe un codigo para encontrar un producto");
                get(codigo); skip_line;
                Put_Line("Codigo leido : " & Integer'Image(Codigo));
                inventario.Obtener_Producto(Codigo, exito, P);
                if exito THEN
                  inventario.Dar_De_Baja(codigo);
                  inventario.Imprimir_Inventario;
                end if;

            when 8 =>
              new_line;
              Put_Line("Se va a guardar el inventario");

            when 9 =>
               Put_Line(" ===========  FIN DE LA SESION =============");
               Terminar := True;
            when others => null;
         end case;
         New_Line;
         Put_Line("       (Pulsa salto de linea para continuar >>");
         Skip_line; -- detiene el ciclo hasta que el usuario pulsa CR/RT)
      else
           Put_Line("Intentelo de nuevo. La opcion debe ser un numero entre 1 y 8");
      end if;
   end loop;

end Gestion_Menus;
