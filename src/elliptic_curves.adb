package body Elliptic_Curves is

   function On_Curve (P : Free_Point) return Boolean is
   begin
      return
         (P.X = null and P.Y = null) or else
         ((P.X /= null and P.Y /= null) and P.Y.all * P.Y.all = P.X.all * P.X.all * P.X.all + P.A * P.X.all + P.B);
   end On_Curve;

   function On_Same_Curve (P, Q : On_Curve_Point) return Boolean is
   begin
      return P.A = Q.A and P.B = Q.B;
   end On_Same_Curve;

   function "+" (L, R : On_Curve_Point) return On_Curve_Point is
   begin
      if L in Point_At_Infinity then
         return R;
      end if;

      if R in Point_At_Infinity then
         return L;
      end if;

      if L.X.all = R.X.all and L.Y.all /= R.Y.all then
         declare
            PAI : constant Point_At_Infinity := (null, null, L.A, L.B);
         begin
            return PAI;
         end;
      end if;

      --  TODO
      return L;
   end "+";

end Elliptic_Curves;
