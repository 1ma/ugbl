with AUnit.Assertions;
with FZ_Arith;
with FZ_Type;
with Words;

package body FFA_Ch1_Tests is

   procedure FFA_Ch1_Demo (T : in out AUnit.Test_Cases.Test_Case'Class);
   procedure FFA_Ch1_Demo (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      use type FZ_Type.FZ;
      use type Words.Word;

      X : constant FZ_Type.FZ (1 .. 4) := (0,        0, 0, 0);
      Y : constant FZ_Type.FZ (1 .. 4) := (16#5555#, 0, 0, 0);
      Z : FZ_Type.FZ (1 .. 4) := (0, 0, 0, 0);
      C : Words.WBool := 0;

      Expected_Sum_Result : constant FZ_Type.FZ (1 .. 4) := Y;
      Expected_Sum_Carry : constant Words.WBool := 0;

      Expected_Sub_Result : constant FZ_Type.FZ (1 .. 4) := (
         16#FFFF_FFFF_FFFF_AAAB#, 16#FFFF_FFFF_FFFF_FFFF#,
         16#FFFF_FFFF_FFFF_FFFF#, 16#FFFF_FFFF_FFFF_FFFF#
      );
      Expected_Sub_Carry : constant Words.WBool := 1;
   begin
      FZ_Arith.FZ_Add (X, Y, Z, C);
      AUnit.Assertions.Assert (Expected_Sum_Result = Z, "Expected sum");
      AUnit.Assertions.Assert (Expected_Sum_Carry = C, "Expected carry");

      FZ_Arith.FZ_Sub (X, Y, Z, C);
      AUnit.Assertions.Assert (Expected_Sub_Result = Z, "Expected subtraction");
      AUnit.Assertions.Assert (Expected_Sub_Carry = C, "Expected carry");
   end FFA_Ch1_Demo;

   overriding procedure Register_Tests (T : in out Test) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, FFA_Ch1_Demo'Access, "FFA_Ch1_Demo");
   end Register_Tests;

   overriding function Name (T : Test) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("FFA.Ch1.Tests");
   end Name;

end FFA_Ch1_Tests;