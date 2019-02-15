WITH Productos;
WITH ada.Text_IO, ada.Integer_Text_IO, ada.Float_Text_IO;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
PACKAGE BODY Inventario IS
   Max: constant := 500;
   TYPE Lista_Productos IS ARRAY (1..Max) OF Productos.Producto;
   TYPE Inventario IS RECORD
      Pro: Lista_Productos;
      Cont: Integer;
   END RECORD;

   Inv: Inventario;

   PROCEDURE Insertar_Ordenado (P: Productos.Producto) IS
      Codigo, i: Integer;
      BEGIN
         Codigo := Productos.Codigo_Producto(P);
         I:= 1;
         IF Inv.Cont /= 0 THEN

         WHILE I<=Inv.Cont AND THEN Productos.Codigo_Producto(Inv.Pro(I)) < Codigo LOOP
                  I := I+1;
            END LOOP;
            Inv.Pro(I+1..Inv.Cont+1):= Inv.Pro(I..Inv.Cont);
            Inv.Pro(I) := P;
            inv.cont := inv.cont + 1;
         ELSE
            Inv.Cont := Inv.Cont +1;
            Inv.Pro(Inv.Cont) := P;
         END IF;

   END Insertar_Ordenado;


  PROCEDURE Cargar_Inventario IS
     File: File_Type;
     P: Productos.Producto;
     BEGIN
     Open(File, In_File, "productos.txt");
      WHILE NOT End_Of_File(File) LOOP
        Productos.Leer_De_Fichero(File, P);
        Insertar_Ordenado(P);
        Skip_Line(File);
      END LOOP;
        Close(File);
   END Cargar_Inventario;

   PROCEDURE Guardar_Inventario IS
   File: file_type;
   BEGIN

      open(File, Out_File, "productos.txt");
      FOR I IN 1..Inv.Cont LOOP
         Productos.Escribir_En_Fichero(File, Inv.Pro(I));
         New_Line(File);
         end loop;
   END Guardar_Inventario;

   PROCEDURE Imprimir_Inventario IS
      Codigo, Cantidad: Integer;
      Peso, Precio: Float;
      nombre: string (1..25);
   BEGIN
      FOR I IN 1..Inv.Cont LOOP
         Codigo := Productos.Codigo_Producto(Inv.Pro(I));
         Peso := Productos.Peso_Producto(Inv.Pro(I));
         Precio := Productos.Precio_Producto(Inv.Pro(I));
         Cantidad := Productos.Cantidad_Producto(Inv.Pro(I));
         Nombre := Productos.Nombre_Producto(Inv.Pro(I));
         Put("Codigo: "); Put(Codigo,0); Put(" Precio: "); Put(Precio, 0, 2, 0);
         Put(" Cantidad: "); Put(Cantidad, 0); Put (" Peso: "); Put(Peso, 0, 2, 0);
         Put(" Nombre: "); Put(Nombre);
         New_Line;
      END LOOP;

   END Imprimir_Inventario;

   FUNCTION Cuantos_Productos RETURN Integer IS
      BEGIN
         RETURN Inv.Cont;
   END Cuantos_Productos;

   PROCEDURE Obtener_Pos_Producto (CodigoP: Integer; Posicion: OUT Integer) IS
      Codigo: Integer;
   BEGIN
      FOR I IN 1..Inv.Cont LOOP
         Codigo := Productos.Codigo_Producto(Inv.Pro(I));
         IF CodigoP = Codigo THEN
            Posicion := I;
            RETURN;
         ELSE
            Posicion := 0;
         END IF;
      END LOOP;

      END Obtener_Pos_Producto;

   PROCEDURE Obtener_Producto (Codigo: Integer; Exito: OUT Boolean; pro: out productos.Producto) IS
      Posicion: Integer;
   BEGIN
      Obtener_Pos_Producto(Codigo, Posicion);
      IF Posicion /= 0 THEN
         pro := inv.pro(posicion);
         Exito := True;
      ELSE
         Put("Producto inexistente");
      END IF;
   END Obtener_Producto;

   PROCEDURE Actualizar_Cantidad (Codigo: Integer; NuevaCant: Integer) IS
      posicion: integer;
   BEGIN
      Obtener_Pos_Producto(Codigo, Posicion);
      if posicion/=0 then
      Productos.Cambiar_Cantidad(inv.pro(posicion), NuevaCant);
      ELSE
         Put("Producto inexistente");
      END IF;

   END Actualizar_Cantidad;

   PROCEDURE Dar_De_Alta (pro: productos.Producto) IS
      Codigo_Ultimo, Codigo_Nuevo: Integer;
   BEGIN
      codigo_ultimo := productos.Codigo_Producto(inv.pro(inv.cont));
      Codigo_nuevo := Codigo_ultimo + 1;
      Inv.Cont := Inv.Cont + 1;
      inv.pro(inv.cont) := pro;
      Productos.Cambiar_Codigo(inv.pro(inv.cont), Codigo_Nuevo);

   END Dar_De_Alta;

   PROCEDURE Dar_De_Baja (Codigo: Integer) IS
   BEGIN
      FOR I IN 1..Inv.Cont LOOP
            IF Codigo = Productos.Codigo_Producto(Inv.Pro(I)) THEN
            FOR J IN I..Inv.Cont LOOP
               Inv.Pro(J) := Inv.Pro(J+1);
            END LOOP;
               Inv.Cont := Inv.Cont -1;
         END IF;
      END LOOP;

   END Dar_De_Baja;


BEGIN
   Inv.Cont:=0;
END Inventario;
