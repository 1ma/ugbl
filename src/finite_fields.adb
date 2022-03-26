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

   function FF_Add (A, B : Integer; O : Order) return Integer is
   begin
      return (A + B) mod Integer (O);
   end FF_Add;

   function FF_Sub (A, B : Integer; O : Order) return Integer is
   begin
      return (A - B) mod Integer (O);
   end FF_Sub;

   function FF_Mul (A, B : Integer; O : Order) return Integer is
   begin
      return (A * B) mod Integer (O);
   end FF_Mul;

end Finite_Fields;
