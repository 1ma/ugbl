package body Elliptic_Curves is

   function On_Demo_Curve (X, Y : Integer_Access) return Boolean is
   begin
      return Y.all * Y.all = X.all * X.all * X.all + 5 * X.all + 7;
   end On_Demo_Curve;

end Elliptic_Curves;
