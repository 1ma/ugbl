package body Elliptic_Curves is

   Cmp_Epsilon : constant Checked_Float := 0.000001;
   --  An arbitrary cutout point to safely compare Checked_Floats.

   overriding function "=" (L, R : Checked_Float) return Boolean is
   begin
      return abs (L - R) < Cmp_Epsilon;
   end "=";

   overriding function "=" (L, R : Free_Point) return Boolean is
   begin
      return L.A = R.A and L.B = R.B and ((L.X = null and R.X = null) or else (L.X.all = R.X.all and L.Y.all = R.Y.all));
   end "=";

   function At_Infinity (P : Free_Point) return Boolean is
   begin
      return P.X = null and P.Y = null;
   end At_Infinity;

   function On_Curve (P : Free_Point) return Boolean is
   begin
      return At_Infinity (P) or else P.Y.all * P.Y.all = P.X.all * P.X.all * P.X.all + P.A * P.X.all + P.B;
   end On_Curve;

   function On_Same_Curve (L, R : On_Curve_Point) return Boolean is
   begin
      return L.A = R.A and L.B = R.B;
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

      if L = R then
         if L.Y.all = 0.0 then
            declare
               PAI : constant Point_At_Infinity := (null, null, L.A, L.B);
            begin
               return PAI;
            end;
         end if;
         declare
            Slope : constant Checked_Float := (3.0 * L.X.all * L.X.all + L.A) / (2.0 * L.Y.all);
            New_X : constant Float_Access := new Checked_Float'(Slope * Slope - 2.0 * L.X.all);
            New_Y : constant Float_Access := new Checked_Float'(Slope * (L.X.all - New_X.all) - L.Y.all);
            L_Plus_R : constant On_Curve_Point := (New_X, New_Y, L.A, L.B);
         begin
            return L_Plus_R;
         end;
      end if;

      declare
         Slope : constant Checked_Float := (R.Y.all - L.Y.all) / (R.X.all - L.X.all);
         New_X : constant Float_Access := new Checked_Float'(Slope * Slope - L.X.all - R.X.all);
         New_Y : constant Float_Access := new Checked_Float'(Slope * (L.X.all - New_X.all) - L.Y.all);
         L_Plus_R : constant On_Curve_Point := (New_X, New_Y, L.A, L.B);
      begin
         return L_Plus_R;
      end;
   end "+";

end Elliptic_Curves;
