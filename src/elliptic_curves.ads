package Elliptic_Curves is

   type Integer_Access is access Integer;

   type Free_Point is record
      X, Y : Integer_Access;
      A, B : Integer;
   end record;

   function On_Curve (P : Free_Point) return Boolean;

   subtype On_Curve_Point is Free_Point
      with Dynamic_Predicate => On_Curve (On_Curve_Point);

   subtype Point_At_Infinity is On_Curve_Point
      with Dynamic_Predicate => Point_At_Infinity.X = null and Point_At_Infinity.Y = null;

   function On_Same_Curve (P, Q : On_Curve_Point) return Boolean;

   function "+" (L, R : On_Curve_Point) return On_Curve_Point
      with Pre => On_Same_Curve (L, R);

end Elliptic_Curves;
