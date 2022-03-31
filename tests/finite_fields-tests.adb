with AUnit.Assertions;

package body Finite_Fields.Tests is

   procedure Test_Addition (T : in out AUnit.Test_Cases.Test_Case'Class);
   procedure Test_Addition (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      --  Ex2 uses field 57, but 57 is not a prime number so I picked the closest one (59).
      AUnit.Assertions.Assert (18 = FF_Add (44, 33, 59), "Song Appendix A, Ch1 Ex2-1");
      AUnit.Assertions.Assert (49 = FF_Add (FF_Add (17, 42, 59), 49, 59), "Song Appendix A, Ch1 Ex2-3");
   end Test_Addition;

   procedure Test_Subtraction (T : in out AUnit.Test_Cases.Test_Case'Class);
   procedure Test_Subtraction (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      --  Ex2 uses field 57, but 57 is not a prime number so I picked the closest one (59).
      AUnit.Assertions.Assert (39 = FF_Sub (9, 29, 59), "Song Appendix A, Ch1 Ex2-2");
      AUnit.Assertions.Assert (43 = FF_Sub (FF_Sub (52, 30, 59), 38, 59), "Song Appendix A, Ch1 Ex2-4");
   end Test_Subtraction;

   procedure Test_Multiplication (T : in out AUnit.Test_Cases.Test_Case'Class);
   procedure Test_Multiplication (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      AUnit.Assertions.Assert (23 = FF_Mul (FF_Mul (95, 45, 97), 31, 97), "Song Appendix A, Ch1 Ex4-1");
      AUnit.Assertions.Assert (68 = FF_Mul (FF_Mul (FF_Mul (17, 13, 97), 19, 97), 44, 97), "Song Appendix A, Ch1 Ex4-2");
   end Test_Multiplication;

   procedure Test_Exp_And_Div (T : in out AUnit.Test_Cases.Test_Case'Class);
   procedure Test_Exp_And_Div (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      AUnit.Assertions.Assert (63 = FF_Mul (FF_Exp (12, 7, 97), FF_Exp (77, 49, 97), 97), "Song Appendix A, Ch1 Ex4-3");
      AUnit.Assertions.Assert (4 = FF_Div (3, 24, 31), "Song Appendix A, Ch1 Ex8-1");
      AUnit.Assertions.Assert (29 = FF_Exp (17, -3, 31), "Song Appendix A, Ch1 Ex8-2");
      AUnit.Assertions.Assert (13 = FF_Mul (FF_Exp (4, -4, 31), 11, 31), "Song Appendix A, Ch1 Ex8-3");
   end Test_Exp_And_Div;


   overriding procedure Register_Tests (T : in out Test) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Addition'Access, "addition examples");
      Register_Routine (T, Test_Subtraction'Access, "subtraction examples");
      Register_Routine (T, Test_Multiplication'Access, "multiplication examples");
      Register_Routine (T, Test_Exp_And_Div'Access, "exponentiation and division examples");
   end Register_Tests;

   overriding function Name (T : Test) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Finite_Fields.Tests");
   end Name;

end Finite_Fields.Tests;
