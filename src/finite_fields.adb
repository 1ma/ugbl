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

   procedure FF_Add (A, B : in Element; Order : in Positive; Sum : out Element) is
   begin
      Sum := (A + B) mod Element(Order);
   end FF_Add;

   procedure FF_Sub (A, B : in Element; Order : in Positive; Sub : out Element) is
   begin
      Sub := (A - B) mod Element(Order);
   end FF_Sub;

   procedure FF_Mul (A, B : in Element; Order : in Positive; Mul : out Element) is
   begin
      Mul := (A * B) mod Element(Order);
   end FF_Mul;

end Finite_Fields;
