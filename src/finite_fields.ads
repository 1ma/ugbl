package Finite_Fields is

   pragma Pure;

   function Is_Prime (P : Integer) return Boolean
      with Pre => P > 1;

   type Order is new Integer range 2 .. Integer'Last
      with Dynamic_Predicate => Is_Prime (Integer (Order));

   function FF_Add (A, B : Integer; P : Order) return Integer
      with Post => FF_Add'Result >= 0 and FF_Add'Result < Integer (P);

   function FF_Sub (A, B : Integer; P : Order) return Integer
      with Post => FF_Sub'Result >= 0 and FF_Sub'Result < Integer (P);

   function FF_Mul (A, B : Integer; P : Order) return Integer
      with Post => FF_Mul'Result >= 0 and FF_Mul'Result < Integer (P);

   function FF_Div (A, B : Integer; P : Order) return Integer
      with Pre => B /= 0,
           Post => FF_Div'Result >= 0 and FF_Div'Result < Integer (P);

   function FF_Exp (Base, Exp : Integer; P : Order) return Integer
      with Post => FF_Exp'Result >= 0 and FF_Exp'Result < Integer (P);

end Finite_Fields;
