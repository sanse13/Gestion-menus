WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
PACKAGE BODY Productos IS

   PROCEDURE Crear_Producto (Nombre_Producto: String; Peso: float; Precio: float; Cantidad: Integer; Pro: OUT Producto) IS
   BEGIN
      Pro.Nombre_Producto := Nombre_Producto;
      Pro.Peso := Peso;
      Pro.Precio := Precio;
      Pro.Cantidad := Cantidad;
      pro.codigo := 0;

   END Crear_Producto;

   FUNCTION Nombre_Producto (pro: Producto) RETURN String IS
   BEGIN
      RETURN pro.Nombre_Producto;

   END Nombre_Producto;

   FUNCTION Cantidad_Producto (Pro: Producto) RETURN Integer IS
   BEGIN

      RETURN pro.Cantidad;

   END Cantidad_Producto;

   FUNCTION Precio_Producto (Pro: Producto) RETURN Float IS
   BEGIN

      RETURN Pro.Precio;

   END Precio_Producto;

   FUNCTION Peso_Producto (Pro: Producto) RETURN Float IS
   BEGIN
      RETURN Pro.Peso;
   END Peso_Producto;

   FUNCTION Codigo_Producto (Pro: Producto) RETURN Integer IS
   BEGIN
      RETURN Pro.Codigo;
   END Codigo_Producto;

   PROCEDURE Cambiar_Codigo (Pro: IN OUT Producto; Codigo: Integer) IS
   BEGIN
      Pro.Codigo := Codigo;
   END Cambiar_Codigo;

   PROCEDURE Cambiar_Nombre (Pro: IN OUT Producto; Nombre: String) IS
   BEGIN
      Pro.Nombre_Producto := Nombre;
   END Cambiar_Nombre;

   PROCEDURE Cambiar_Precio (Pro: IN OUT Producto; Precio: Float) IS
   BEGIN
      Pro.Precio := Precio;
   END Cambiar_Precio;

   PROCEDURE Cambiar_Cantidad (Pro: IN OUT Producto; Cantidad: Integer) IS
   BEGIN
      Pro.Cantidad := Cantidad;
   END Cambiar_Cantidad;

   PROCEDURE Cambiar_Peso (Pro: IN OUT Producto; Peso: Float) IS
   BEGIN
      Pro.Peso := Peso;
   END Cambiar_Peso;

   PROCEDURE Leer_De_Fichero (File: IN File_Type; Pro: OUT Producto) IS
  --In_File si es de lectura, Out_File si es de escritura
      Codigo, Cantidad: Integer;      Precio, Peso: Float;
      Nombre: String (1..25);
   BEGIN

      Get(File, Codigo); Get(File, Precio); Get(File, Cantidad);
      get(file, peso); get(file, nombre);
      Pro.Codigo := Codigo;
      Pro.Precio := Precio;
      Pro.Cantidad := Cantidad;
      Pro.Peso := Peso;
      Pro.Nombre_Producto := Nombre;

   END Leer_De_Fichero;

   PROCEDURE Imprimir_Producto (Pro: Producto) IS
   BEGIN
      Put("Los datos del producto buscado son :"); New_Line;
      Put("PRODUCTO codigo     : "); Put(Codigo_Producto(Pro), 0); New_Line;
      Put("     nombre         : "); Put(Nombre_Producto(Pro)); New_Line;
      Put("     precio         : "); Put(Precio_Producto(Pro), 0, 2, 0); New_Line;
      Put("     cantidad       : "); Put(Cantidad_Producto(Pro), 0); New_Line;
      Put("     peso           : "); Put(Peso_Producto(Pro), 0, 2, 0); New_Line;
   END Imprimir_Producto;

   PROCEDURE Escribir_En_Fichero (File: IN OUT File_Type; Pro: producto) IS
   BEGIN
      Put(File, Codigo_Producto(pro), 0); put(file, " ");
      Put(File, Precio_Producto(pro), 0, 2, 0); put (file, " ");
      Put(File, Cantidad_Producto(pro), 0); put(file, " ");
      Put(File, Peso_Producto(pro), 0, 2, 0); put(file, " ");
      Put(File, Nombre_Producto(pro));

   END Escribir_En_Fichero;

   PROCEDURE Leer_De_Teclado (P: OUT Producto) IS
      Lectura_Correcta: Boolean := False;
      Linea : String(1..80):= (OTHERS => ' ');
      Pre: Float := 0.0;
      Pes: Float := 0.0;
      Can: Integer :=0;
      N: Integer;
   BEGIN
      p.codigo := 0;
      Put("--Introduce el nombre del producto (string): ");
      while not Lectura_Correcta loop
         begin
            Get_Line(Linea, N);
            Cambiar_Nombre(P, Linea(1..25));
            Lectura_Correcta := True;
         exception
            when others => Put(
                  "Nombre erroneo, vuelva a introducirlo (string): ");
         end;
      end loop;

      Lectura_Correcta := False;
      Put("--Introduce el precio del producto por unidad (0.0):  ");
      while not Lectura_Correcta loop
         begin
            Get(Pre);
            Cambiar_Precio(P, Pre);
            Skip_Line;
            Lectura_Correcta := True;
         exception
            when others => Skip_Line;
               Put_Line("Precio erroneo, vuelva a introducirlo (0.0): ");
         end;
      end loop;

      Lectura_Correcta := False;
      Put("--Introduce la cantidad (numero de unidades):");
      while not Lectura_Correcta loop
         begin
            Get(Can);
            Cambiar_Cantidad(P, Can);
            Skip_Line;
            Lectura_Correcta := True;
         exception
            when others => Skip_Line;
               Put("Cantidad erronea, vuelva a introducirla: ");
         end;
      end loop;

      Lectura_Correcta := False;
      Put("--Introduce el peso del producto por unidad (en kg)(0.0):");
      while not Lectura_Correcta loop
         begin
            Get(Pes);
            Cambiar_Peso(P, Pes);
            Skip_Line;
            Lectura_Correcta := True;
         exception
            when others => Skip_Line;
               Put("Peso erroneo, vuelva a introducirlo (0,0): ");
         end;
      end loop;
      New_Line;
   end Leer_De_Teclado;

END Productos;




