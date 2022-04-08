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

with Words;   use Words;
with FZ_Type; use FZ_Type;

-- Fundamental Arithmetic operators on FZ:
package FZ_Arith is

   pragma Pure;

   -- Sum := X + Y; Overflow := Carry
   procedure FZ_Add(X          : in    FZ;
                    Y          : in    FZ;
                    Sum        : out   FZ;
                    Overflow   : out   WBool);
   pragma Precondition(X'Length = Y'Length and X'Length = Sum'Length);
   pragma Inline_Always(FZ_Add);

   -- Difference := X - Y; Underflow := Borrow
   procedure FZ_Sub(X          : in  FZ;
                    Y          : in  FZ;
                    Difference : out FZ;
                    Underflow  : out WBool);
   pragma Precondition(X'Length = Y'Length and X'Length = Difference'Length);
   pragma Inline_Always(FZ_Sub);

end FZ_Arith;
