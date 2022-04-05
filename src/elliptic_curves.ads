package Elliptic_Curves is

   pragma Pure;

   type Checked_Float is new Long_Float range Long_Float'Range;
   --  Float type without IEEE 754 semantics for infinity and NaN
   --  See https://comp.lang.ada.narkive.com/6CLlHF6S/s-is-nan-or-s-is-inf#post5

   overriding function "=" (L, R : Checked_Float) return Boolean;

   subtype Infinity is Checked_Float range Checked_Float'Last .. Checked_Float'Last;
   --  Checked_Float'Last is approximately 1.79769313486232E+308
   --  This is *conceptually WRONG* but this is throwaway code anyway and it'd rather forgo the pointerolade.

   type Free_Point is record
      X, Y, A, B : Checked_Float;
   end record
      with Dynamic_Predicate =>
         (X not in Infinity or Y in Infinity) and
         (Y not in Infinity or X in Infinity) and
         (X in Infinity or Y not in Infinity) and
         (Y in Infinity or X not in Infinity);
   --  The Dynamic_Predicate enforces that "X is Infinity <==> Y is Infinity" and "X is not Infinity <==> Y is not Infinity"
   --  This guarantees that for each Free_Point either X and Y will both represent Infinity or none will.

   overriding function "=" (L, R : Free_Point) return Boolean;

   subtype On_Curve_Point is Free_Point
      with Dynamic_Predicate =>
         (On_Curve_Point.X in Infinity and On_Curve_Point.Y in Infinity) or else
         On_Curve_Point.Y * On_Curve_Point.Y =
            On_Curve_Point.X * On_Curve_Point.X * On_Curve_Point.X +
            On_Curve_Point.A * On_Curve_Point.X +
            On_Curve_Point.B;

   subtype Point_At_Infinity is On_Curve_Point
      with Dynamic_Predicate => Point_At_Infinity.X in Infinity and Point_At_Infinity.Y in Infinity;

   function "+" (L, R : On_Curve_Point) return On_Curve_Point
      with Pre => L.A = R.A and L.B = R.B;

end Elliptic_Curves;
