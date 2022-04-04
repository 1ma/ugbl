package body Elliptic_Curves is

   Cmp_Epsilon : constant Checked_Float := 0.000001;
   --  An arbitrary cutout point for crude Checked_Float comparisons.

   overriding function "=" (L, R : Checked_Float) return Boolean is
   begin
      return abs (L - R) < Cmp_Epsilon;
   exception
      when Constraint_Error => return False;
      --  The subtraction above can overflow if the values of L and R are sufficiently apart
      --  regardless of the order of the operands (e.g. Checked_Float'First and Checked_Float'Last).
      --  If this happens L and R are... definitely not equal.
   end "=";

   overriding function "=" (L, R : Free_Point) return Boolean is
   begin
      return L.X = R.X and L.Y = R.Y and L.A = R.A and L.B = R.B;
   end "=";

   function "+" (L, R : On_Curve_Point) return On_Curve_Point is
   begin
      if L in Point_At_Infinity then
         return R;
      end if;

      if R in Point_At_Infinity then
         return L;
      end if;

      if L.X = R.X and (L.Y /= R.Y or else L.Y = 0.0) then
         declare
            PAI : constant Point_At_Infinity := (Checked_Float'Last, Checked_Float'Last, L.A, L.B);
         begin
            return PAI;
         end;
      end if;

      if L = R then
         declare
            Slope : constant Checked_Float := (3.0 * L.X * L.X + L.A) / (2.0 * L.Y);
            New_X : constant Checked_Float := Slope * Slope - 2.0 * L.X;
            New_Y : constant Checked_Float := Slope * (L.X - New_X) - L.Y;
            L_Plus_R : constant On_Curve_Point := (New_X, New_Y, L.A, L.B);
         begin
            return L_Plus_R;
         end;
      end if;

      declare
         Slope : constant Checked_Float := (R.Y - L.Y) / (R.X - L.X);
         New_X : constant Checked_Float := Slope * Slope - L.X - R.X;
         New_Y : constant Checked_Float := Slope * (L.X - New_X) - L.Y;
         L_Plus_R : constant On_Curve_Point := (New_X, New_Y, L.A, L.B);
      begin
         return L_Plus_R;
      end;
   end "+";

end Elliptic_Curves;
