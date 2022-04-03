with AUnit.Assertions;

package body Elliptic_Curves.Tests is

   procedure Invalid_Point_Instantiation_1;
   procedure Invalid_Point_Instantiation_1 is
      P : constant On_Curve_Point := (new Integer'(2), new Integer'(4), 5, 7);
      pragma Unreferenced (P);
   begin
      null;
   end Invalid_Point_Instantiation_1;

   procedure Invalid_Point_Instantiation_2;
   procedure Invalid_Point_Instantiation_2 is
      P : constant On_Curve_Point := (new Integer'(5), new Integer'(7), 5, 7);
      pragma Unreferenced (P);
   begin
      null;
   end Invalid_Point_Instantiation_2;

   procedure Test_Points_On_Curve (T : in out AUnit.Test_Cases.Test_Case'Class);
   procedure Test_Points_On_Curve (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      P_1 : constant On_Curve_Point := (new Integer'(-1), new Integer'(-1), 5, 7);
      P_2 : constant On_Curve_Point := (new Integer'(18), new Integer'(77), 5, 7);
      pragma Unreferenced (P_1, P_2);
   begin
      AUnit.Assertions.Assert_Exception (Invalid_Point_Instantiation_1'Access, "Song Appendix A, Ch2 Ex1-1");
      AUnit.Assertions.Assert_Exception (Invalid_Point_Instantiation_2'Access, "Song Appendix A, Ch2 Ex1-4");
   end Test_Points_On_Curve;

   procedure Test_Point_Addition (T : in out AUnit.Test_Cases.Test_Case'Class);
   procedure Test_Point_Addition (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      PAI : constant Point_At_Infinity := (null, null, 5, 7);
      P_1 : constant On_Curve_Point := (new Integer'(-1), new Integer'(-1), 5, 7);
      P_2 : constant On_Curve_Point := (new Integer'(-1), new Integer'(1), 5, 7);
   begin
      AUnit.Assertions.Assert (P_1 = P_1 + PAI, "Song Ch2 p33, P + Inf = P");
      AUnit.Assertions.Assert (P_2 = PAI + P_2, "Song Ch2 p34, Inf + P = P");
      AUnit.Assertions.Assert (PAI = P_1 + P_2, "Song Ch2 p34, P + (-P) = Inf");
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
