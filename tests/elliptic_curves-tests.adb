with AUnit.Assertions;

package body Elliptic_Curves.Tests is

   procedure Test_Points_On_Demo_Curve (T : in out AUnit.Test_Cases.Test_Case'Class);
   procedure Test_Points_On_Demo_Curve (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      X : constant Integer_Access := new Integer;
      Y : constant Integer_Access := new Integer;
   begin
      X.all := 2;
      Y.all := 4;
      AUnit.Assertions.Assert (False = On_Demo_Curve (X, Y), "Song Appendix A, Ch2 Ex1-1");

      X.all := -1;
      Y.all := -1;
      AUnit.Assertions.Assert (True = On_Demo_Curve (X, Y), "Song Appendix A, Ch2 Ex1-2");

      X.all := 18;
      Y.all := 77;
      AUnit.Assertions.Assert (True = On_Demo_Curve (X, Y), "Song Appendix A, Ch2 Ex1-3");

      X.all := 5;
      Y.all := 7;
      AUnit.Assertions.Assert (False = On_Demo_Curve (X, Y), "Song Appendix A, Ch2 Ex1-4");
   end Test_Points_On_Demo_Curve;

   overriding procedure Register_Tests (T : in out Test) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Points_On_Demo_Curve'Access, "Tests a few real points on a made up curve");
   end Register_Tests;

   overriding function Name (T : Test) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Elliptic_Curves.Tests");
   end Name;

end Elliptic_Curves.Tests;
