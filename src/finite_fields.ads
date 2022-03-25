package Finite_Fields is

   pragma Pure;

   type Element is mod 2**64;
   for Element'Size use 64;

   function Is_Prime (P : in Positive) return Boolean;

   procedure FF_Add (A, B : in Element; Order : in Positive; Sum : out Element);
   pragma Precondition (A < Element(Order));
   pragma Precondition (B < Element(Order));
   pragma Precondition (Is_Prime(Order));
   pragma Postcondition (Sum < Element(Order));

   procedure FF_Sub (A, B : in Element; Order : in Positive; Sub : out Element);
   pragma Precondition (A < Element(Order));
   pragma Precondition (B < Element(Order));
   pragma Precondition (Is_Prime(Order));
   pragma Postcondition (Sub < Element(Order));

   procedure FF_Mul (A, B : in Element; Order : in Positive; Mul : out Element);
   pragma Precondition (A < Element(Order));
   pragma Precondition (B < Element(Order));
   pragma Precondition (Is_Prime(Order));
   pragma Postcondition (Mul < Element(Order));

end Finite_Fields;
