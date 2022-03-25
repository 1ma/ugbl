package Finite_Fields is

   pragma Pure;

   type Element is mod 2**64;
   for Element'Size use 64;

   function Is_Prime (P : in Positive) return Boolean;

   type Order is new Positive
      with Dynamic_Predicate => Order = 1 or Is_Prime (Positive(Order));

   function FF_Add (A, B : in Element; O : in Order) return Element
      with Pre => A < Element(O) and B < Element(O),
           Post => FF_Add'Result < Element(O);

   function FF_Sub (A, B : in Element; O : in Order) return Element
      with Pre => A < Element(O) and B < Element(O),
           Post => FF_Sub'Result < Element(O);

   function FF_Mul (A, B : in Element; O : in Order) return Element
      with Pre => A < Element(O) and B < Element(O),
           Post => FF_Mul'Result < Element(O);

end Finite_Fields;
