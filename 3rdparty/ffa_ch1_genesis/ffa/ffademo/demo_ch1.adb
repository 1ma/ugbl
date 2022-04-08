------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- This file is part of 'Finite Field Arithmetic', aka 'FFA'.               --
--                                                                          --
-- (C) 2017 Stanislav Datskovskiy ( www.loper-os.org )                      --
-- http://wot.deedbot.org/17215D118B7239507FAFED98B98228A001ABFFC7.html     --
--                                                                          --
-- You do not have, nor can you ever acquire the right to use, copy or      --
-- distribute this software ; Should you use this software for any purpose, --
-- or copy and distribute it to anyone or in any manner, you are breaking   --
-- the laws of whatever soi-disant jurisdiction, and you promise to         --
-- continue doing so for the indefinite future. In any case, please         --
-- always : read and understand any software ; verify any PGP signatures    --
-- that you use - for any purpose.                                          --
--                                                                          --
-- See also http://trilema.com/2015/a-new-software-licensing-paradigm .     --
------------------------------------------------------------------------------
------------------------------------------------------------------------------

-- From Ada:
with Ada.Text_IO; use Ada.Text_IO;

-- From FFA:
with Words;    use Words;
with FZ_Type;  use FZ_Type;
with FZ_Arith; use FZ_Arith;

-- From the Demo:
with FFA_IO;   use FFA_IO;


package body Demo_Ch1 is

   procedure Demo_Add_Sub is
      
      -- We are using 64-bit Words (see iron.ads).
      -- We'll begin with an elementary demo, using 256-bit FZ:
      X : FZ(1 .. 4) := (0,        0, 0, 0);
      Y : FZ(1 .. 4) := (16#5555#, 0, 0, 0);
      Z : FZ(1 .. 4) := (0,        0, 0, 0);
      
      -- Carry.
      C : WBool := 0;
      
   begin
      
      Put_Line("X         =");
      Dump(X);
      New_Line;
      
      Put_Line("Y         =");
      Dump(Y);
      New_Line;
      
      FZ_Add(X, Y, Z, C);
      Put_Line("X + Y     =");
      Dump(Z);
      New_Line;
      Put_Line("C         = " & WBool'Image(C));
      
      FZ_Sub(X, Y, Z, C);
      Put_Line("X - Y     =");
      Dump(Z);
      New_Line;
      Put_Line("C         = " & WBool'Image(C));
      
   end Demo_Add_Sub;
      
end Demo_Ch1;
