with AUnit.Assertions;

package body Finite_Fields.Tests is

   procedure Test_Addition (T : in out AUnit.Test_Cases.Test_Case'Class);
   procedure Test_Addition (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      -- Ex2 uses field 57, but 57 is not a prime number so I picked the closest one (59).
      AUnit.Assertions.Assert (FF_Add(44, 33, 59) = 18, "Song Appendix A, Ch1 Ex2-1");
      AUnit.Assertions.Assert (FF_Add(FF_Add(17, 42, 59), 49, 59) = 49, "Song Appendix A, Ch1 Ex2-3");
   end Test_Addition;

   procedure Test_Subtraction (T : in out AUnit.Test_Cases.Test_Case'Class);
   procedure Test_Subtraction (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      -- Ex2 uses field 57, but 57 is not a prime number so I picked the closest one (59).
      AUnit.Assertions.Assert (FF_Sub (9, 29, 59) = 39, "Song Appendix A, Ch1 Ex2-2");
      AUnit.Assertions.Assert (FF_Sub (FF_Sub (52, 30, 59), 38, 59) = 43, "Song Appendix A, Ch1 Ex2-4");
   end Test_Subtraction;

   overriding procedure Register_Tests (T : in out Test) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Addition'Access, "addition examples");
      Register_Routine (T, Test_Subtraction'Access, "subtraction examples");
   end Register_Tests;

   overriding function Name (T : Test) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Finite_Fields.Tests");
   end Name;

end Finite_Fields.Tests;
