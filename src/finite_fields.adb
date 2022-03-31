package body Finite_Fields is

   function Is_Prime (P : Integer) return Boolean is
      I : Integer := 2;
   begin
      while I * I < P loop
         if P rem I = 0 then
            return False;
         end if;

         I := I + 1;
      end loop;

      return True;
   end Is_Prime;

   function FF_Add (A, B : Integer; P : Order) return Integer is
   begin
      return (A + B) mod Integer (P);
   end FF_Add;

   function FF_Sub (A, B : Integer; P : Order) return Integer is
   begin
      return (A - B) mod Integer (P);
   end FF_Sub;

   function FF_Mul (A, B : Integer; P : Order) return Integer is
   begin
      return (A * B) mod Integer (P);
   end FF_Mul;

   function FF_Div (A, B : Integer; P : Order) return Integer is
   begin
      return FF_Mul (A, FF_Exp (B, Integer (P - 2), P), P);
   end FF_Div;

   function FF_Exp (Base, Exp : Integer; P : Order) return Integer is
      Reduced_Exp : constant Integer := Exp mod Integer (P - 1);
      Result : Integer := 1;
   begin
      for Counter in 1 .. Reduced_Exp loop
         Result := (Result * Base) mod Integer (P);
      end loop;

      return Result;
   end FF_Exp;

end Finite_Fields;
