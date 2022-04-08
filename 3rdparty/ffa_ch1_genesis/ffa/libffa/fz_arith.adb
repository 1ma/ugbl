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

with Word_Ops; use Word_Ops;

-- Fundamental Arithmetic operators on FZ:
package body FZ_Arith is
   
   -- Sum := X + Y; Overflow := Carry
   procedure FZ_Add(X          : in  FZ;
                    Y          : in  FZ;
                    Sum        : out FZ;
                    Overflow   : out WBool) is
      Carry : WBool := 0;
   begin
      for i in X'Range loop
         declare
            A : constant Word := X(I);
            B : constant Word := Y(I);
            S : constant Word := A + B + Carry;
         begin
            Sum(i) := S;
            Carry  := W_Carry(A, B, S);
         end;
      end loop;
      Overflow := Carry;
   end FZ_Add;
   pragma Inline_Always(FZ_Add);
   
   
   -- Difference := X - Y; Underflow := Borrow
   procedure FZ_Sub(X          : in  FZ;
                    Y          : in  FZ;
                    Difference : out FZ;
                    Underflow  : out WBool) is
      Borrow : WBool := 0;
   begin
      for i in 0 .. Word_Index(X'Length - 1) loop
         declare
            A : constant Word := X(X'First + i);
            B : constant Word := Y(Y'First + i);
            S : constant Word := A - B - Borrow;
         begin
            Difference(Difference'First + i) := S;
            Borrow := W_Borrow(A, B, S);
         end;
      end loop;
      Underflow := Borrow;
   end FZ_Sub;
   pragma Inline_Always(FZ_Sub);
   
end FZ_Arith;
