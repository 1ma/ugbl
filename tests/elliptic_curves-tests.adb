with AUnit.Assertions;

package body Elliptic_Curves.Tests is

   procedure Test_Points_On_Secp256k1_Curve (T : in out AUnit.Test_Cases.Test_Case'Class);
   procedure Test_Points_On_Secp256k1_Curve (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      AUnit.Assertions.Assert (False = On_Secp256k1_Curve (2, 4), "Song Appendix A, Ch2 Ex1-1");
      AUnit.Assertions.Assert (True = On_Secp256k1_Curve (-1, -1), "Song Appendix A, Ch2 Ex1-2");
      AUnit.Assertions.Assert (True = On_Secp256k1_Curve (18, 77), "Song Appendix A, Ch2 Ex1-3");
      AUnit.Assertions.Assert (False = On_Secp256k1_Curve (5, 7), "Song Appendix A, Ch2 Ex1-4");
   end Test_Points_On_Secp256k1_Curve;

   overriding procedure Register_Tests (T : in out Test) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Points_On_Secp256k1_Curve'Access, "Tests a few real points on the Sec256k1 curve");
   end Register_Tests;

   overriding function Name (T : Test) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Elliptic_Curves.Tests");
   end Name;

end Elliptic_Curves.Tests;
