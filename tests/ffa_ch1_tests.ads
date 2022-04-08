with AUnit.Test_Cases;

package FFA_Ch1_Tests is

   type Test is new AUnit.Test_Cases.Test_Case with null record;

   overriding procedure Register_Tests (T : in out Test);

   overriding function Name (T : Test) return AUnit.Message_String;

end FFA_Ch1_Tests;
