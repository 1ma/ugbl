package body Elliptic_Curves is

   function On_Secp256k1_Curve (X, Y : Integer) return Boolean is
   begin
      return Y * Y = X * X * X + 5 * X + 7;
   end On_Secp256k1_Curve;

end Elliptic_Curves;
