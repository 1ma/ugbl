with Ada.Command_Line;
with AUnit; use AUnit;
with AUnit.Reporter.Text;
with AUnit.Run;
with AUnit.Test_Cases;
with AUnit.Test_Suites;
with Finite_Fields.Tests;

procedure UGBL_Tests is
   function UGBL_Test_Suite return AUnit.Test_Suites.Access_Test_Suite;
   function UGBL_Test_Suite return AUnit.Test_Suites.Access_Test_Suite is
      FF_Tests : constant AUnit.Test_Cases.Test_Case_Access := new Finite_Fields.Tests.Test;

      Suite : constant AUnit.Test_Suites.Access_Test_Suite := new AUnit.Test_Suites.Test_Suite;
   begin
      Suite.Add_Test (FF_Tests);

      return Suite;
   end UGBL_Test_Suite;

   function Runner is new AUnit.Run.Test_Runner_With_Status (UGBL_Test_Suite);

   Result : AUnit.Status;
   Reporter : AUnit.Reporter.Text.Text_Reporter;
begin
   AUnit.Reporter.Text.Set_Use_ANSI_Colors (Reporter, True);

   Result := Runner (Reporter);

   if Result /= AUnit.Status'(Success) then
      Ada.Command_Line.Set_Exit_Status (1);
   end if;
end UGBL_Tests;