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

with Ada.Text_IO; use Ada.Text_IO;

with Words;    use Words;
with W_Shifts; use W_Shifts;
with FZ_Type;  use FZ_Type;


package body FFA_IO is
   
   -- Obtain the WChars corresponding to the given Word
   function W_To_WChars(N : Word) return WChars is
      H      : constant array(0 .. 15) of Character := "0123456789ABCDEF";
      W      : Word := N;
      Result : WChars;
   begin
      for b in WChars'Range loop               -- From bottom to top:
         Result(B) := H(Natural(W and 16#F#)); -- Get current nibble.
         W         := Shift_Right(W, 4);       -- Get the next nibble.
      end loop;
      return Result;
   end W_To_WChars;
   
   
   -- Display a hex representation of W to stdout
   procedure Dump(W : in Word) is
      T : WChars := W_To_WChars(W);
   begin
      for i in reverse T'Range loop
         Put(T(i));
      end loop;
   end Dump;
   
   
   -- Display a hex representation of N to stdout
   procedure Dump(N : in FZ) is
   begin
      for i in reverse N'Range loop
         Dump(N(i));
      end loop;
   end Dump;
   
end FFA_IO;
