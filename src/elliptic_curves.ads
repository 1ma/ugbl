package Elliptic_Curves is

   type Checked_Float is new Long_Float range Long_Float'Range;
   --  Float type without IEEE 754 semantics for infinity and NaN
   --  See https://comp.lang.ada.narkive.com/6CLlHF6S/s-is-nan-or-s-is-inf#post5

   overriding function "=" (L, R : Checked_Float) return Boolean;

   type Float_Access is access Checked_Float;
   --  A null pointer will represent the infinity value.
   --  There probably is a less obtuse way to go about this.

   type Free_Point is record
      X, Y : Float_Access;
      A, B : Checked_Float;
   end record
      with Dynamic_Predicate =>
         (X /= null or Y = null) and
         (Y /= null or X = null) and
         (X = null or Y /= null) and
         (Y = null or X /= null);
   --  The Dynamic_Predicate enforces that "X is null <==> Y is null" and "X is float <==> Y is float"
   --  This guarantees that for each Free_Point either X and Y will be null or none will.

   overriding function "=" (L, R : Free_Point) return Boolean;

   function At_Infinity (P : Free_Point) return Boolean;

   function On_Curve (P : Free_Point) return Boolean;

   subtype On_Curve_Point is Free_Point
      with Dynamic_Predicate => On_Curve (On_Curve_Point);

   subtype Point_At_Infinity is On_Curve_Point
      with Dynamic_Predicate => At_Infinity (Point_At_Infinity);

   function On_Same_Curve (L, R : On_Curve_Point) return Boolean;

   function "+" (L, R : On_Curve_Point) return On_Curve_Point
      with Pre => On_Same_Curve (L, R);

end Elliptic_Curves;
