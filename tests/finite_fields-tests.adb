with AUnit.Assertions;

package body Finite_Fields.Tests is

   procedure Test_Finite_Field_Addition (T : in out AUnit.Test_Cases.Test_Case'Class);
   procedure Test_Finite_Field_Addition (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);

      E1, E2 : Element;
   begin
      FF_Add(44, 33, 53, E1);
      AUnit.Assertions.Assert (E1 = 24, "Addition test 1");

      FF_Add(17, 42, 53, E2);
      FF_Add(E2, 49, 53, E2);
      AUnit.Assertions.Assert (E2 = 2, "Addition test 2");
   end Test_Finite_Field_Addition;

   procedure Test_Finite_Field_Subtraction (T : in out AUnit.Test_Cases.Test_Case'Class);
   procedure Test_Finite_Field_Subtraction (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);

      E1, E2 : Element;
   begin
      FF_Sub(9, 29, 53, E1);
      AUnit.Assertions.Assert (E1 = 33, "Subtraction test 1");

      FF_Sub(52, 30, 53, E2);
      FF_Sub(E2, 38, 53, E2);
      AUnit.Assertions.Assert (E1 = 37, "Subtraction test 2");
   end Test_Finite_Field_Subtraction;

   overriding procedure Register_Tests (T : in out Test) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Finite_Field_Addition'Access, "Finite Field Addition tests");
      Register_Routine (T, Test_Finite_Field_Subtraction'Access, "Finite Field Subtraction tests");
   end Register_Tests;

   overriding function Name (T : Test) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Finite_Fields");
   end Name;

end Finite_Fields.Tests;
