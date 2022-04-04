with AUnit.Assertions;

package body Elliptic_Curves.Tests is

   function Make_Point (X, Y : Checked_Float) return On_Curve_Point;
   function Make_Point (X, Y : Checked_Float) return On_Curve_Point is
      --  All examples and exercises of J.Song Ch.2 are based on the y^2 = x^3 + 5x + 7 elliptic curve (which is not secp256k1)
      New_Testing_Point : constant On_Curve_Point := (X, Y, 5.0, 7.0);
   begin
      return New_Testing_Point;
   end Make_Point;

   procedure Invalid_Point_Instantiation_1;
   procedure Invalid_Point_Instantiation_1 is
      P : constant On_Curve_Point := (2.0, 4.0, 5.0, 7.0);
      pragma Unreferenced (P);
   begin
      null;
   end Invalid_Point_Instantiation_1;

   procedure Invalid_Point_Instantiation_2;
   procedure Invalid_Point_Instantiation_2 is
      P : constant On_Curve_Point := (5.0, 7.0, 5.0, 7.0);
      pragma Unreferenced (P);
   begin
      null;
   end Invalid_Point_Instantiation_2;

   procedure Test_Points_On_Curve (T : in out AUnit.Test_Cases.Test_Case'Class);
   procedure Test_Points_On_Curve (T : in out AUnit.Test_Cases.Test_Case'Class) is
      P_1 : constant On_Curve_Point := Make_Point (-1.0, -1.0); -- J.Song App.A Ch.2 Ex 1.2 (correctness implicitly checked by type predicate)
      P_2 : constant On_Curve_Point := Make_Point (18.0, 77.0); -- J.Song App.A Ch.2 Ex 1.3 (correctness implicitly checked by type predicate)
      pragma Unreferenced (T, P_1, P_2);
   begin
      AUnit.Assertions.Assert_Exception (Invalid_Point_Instantiation_1'Access, "J.Song App.A Ch.2 Ex 1.1");
      AUnit.Assertions.Assert_Exception (Invalid_Point_Instantiation_2'Access, "J.Song App.A Ch.2 Ex 1.4");
   end Test_Points_On_Curve;

   procedure Test_Point_Addition (T : in out AUnit.Test_Cases.Test_Case'Class);
   procedure Test_Point_Addition (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      PAI : constant Point_At_Infinity := (Checked_Float'Last, Checked_Float'Last, 5.0, 7.0);
      P_1 : constant On_Curve_Point := Make_Point (-1.0, -1.0);
      P_2 : constant On_Curve_Point := Make_Point (-1.0, 1.0);
      P_3 : constant On_Curve_Point := Make_Point (2.0, 5.0);
   begin
      AUnit.Assertions.Assert (P_1 = P_1 + PAI, "J.Song Ch.2 p33, P + Inf = P");
      AUnit.Assertions.Assert (P_2 = PAI + P_2, "J.Song Ch.2 p34, Inf + P = P");
      AUnit.Assertions.Assert (PAI = P_1 + P_2, "J.Song Ch.2 p34, P + (-P) = Inf");
      AUnit.Assertions.Assert (Make_Point (3.0, -7.0) = P_3 + P_1, "J.Song App.A Ch.2 Ex 4");
      AUnit.Assertions.Assert (Make_Point (18.0, 77.0) = P_1 + P_1, "J.Song App.A Ch.2 Ex 6");
   end Test_Point_Addition;

   overriding procedure Register_Tests (T : in out Test) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Points_On_Curve'Access, "Test_Points_On_Curve");
      Register_Routine (T, Test_Point_Addition'Access, "Test_Point_Addition");
   end Register_Tests;

   overriding function Name (T : Test) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Elliptic_Curves.Tests");
   end Name;

end Elliptic_Curves.Tests;
