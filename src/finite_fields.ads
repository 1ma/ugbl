package Finite_Fields is

   pragma Pure;

   function Is_Prime (P : in Integer) return Boolean
      with Pre => P > 1;

   type Order is new Integer range 2 .. Integer'Last
      with Dynamic_Predicate => Is_Prime (Integer (Order));

   function FF_Add (A, B : in Integer; O : in Order) return Integer
      with Post => FF_Add'Result >= 0 and FF_Add'Result < Integer (O);

   function FF_Sub (A, B : in Integer; O : in Order) return Integer
      with Post => FF_Sub'Result >= 0 and FF_Sub'Result < Integer (O);

   function FF_Mul (A, B : in Integer; O : in Order) return Integer
      with Post => FF_Mul'Result >= 0 and FF_Mul'Result < Integer (O);

end Finite_Fields;
