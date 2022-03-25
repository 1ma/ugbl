package body Finite_Fields is

   function Is_Prime (P : in Positive) return Boolean is
      I : Positive := 2;
   begin
      while I * I < P loop
         if P rem I = 0 then
            return False;
         end if;

         I := I + 1;
      end loop;

      return True;
   end Is_Prime;

   function FF_Add (A, B : in Element; O : in Order) return Element is
   begin
      return (A + B) mod Element(O);
   end FF_Add;

   function FF_Sub (A, B : in Element; O : in Order) return Element is
   begin
      return (A - B) mod Element(O);
   end FF_Sub;

   function FF_Mul (A, B : in Element; O : in Order) return Element is
   begin
      return (A * B) mod Element(O);
   end FF_Mul;

end Finite_Fields;
