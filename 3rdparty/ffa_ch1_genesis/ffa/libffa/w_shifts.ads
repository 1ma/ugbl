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

with Words; use Words;

-- For some peculiar reason, the Ada standards group made
-- the fundamental Shift and Rotate bitwise ops into ~optional~ components!

-- However on GNAT we can force them to exist, as described in:
-- https://gcc.gnu.org/onlinedocs/gnat_rm/Shifts-and-Rotates.html

-- On a non-GNAT compiler, you're own your own.

package W_Shifts is
   
   pragma Pure;
   
   function Shift_Left
     (Value  : Word; 
      Amount : Natural)
     return    Word;
   pragma Import(Intrinsic, Shift_Left);
   
   function Shift_Right
     (Value  : Word; 
      Amount : Natural)
     return    Word;
   pragma Import(Intrinsic, Shift_Right);
   
   function Rotate_Left
     (Value  : Word; 
      Amount : Natural)
     return    Word;
   pragma Import(Intrinsic, Rotate_Left);
   
   function Rotate_Right
     (Value  : Word; 
      Amount : Natural)
     return    Word;
   pragma Import(Intrinsic, Rotate_Right);
   
end W_Shifts;
