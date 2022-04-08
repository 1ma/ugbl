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

with W_Shifts; use W_Shifts;

-- Fundamental Operations on Words:
package body Word_Ops is
   
   -- Ada (like C) does not (portably) tell us over/underflow from arithmetic.
   -- And there existed in the past, and apparently exist today, CPUs made
   -- by idiots and wreckers (e.g. 'RISC-V') that do not have flags at all!
   
   -- However, for multi-word addition, subtraction, the inner loop of
   -- Comba's multiplication, and for a handful of other ops, we need it!
   
   -- So we derive the Carry or Borrow at the 'eldest' binary position.
   -- See the elementary proof (base case: 1 bit) further below:
   
   -- Find the Carry, from an addition where it is known that A + B == S:
   function W_Carry(A : in Word; B : in Word; S : in Word)
                   return WBool is
   begin
      return WBool(Shift_Right((A and B) or ((A or B) and (not S)),
                               Bitness - 1));
   end W_Carry;
   pragma Inline_Always(W_Carry);
   
   
   -- Find the Borrow, from a subtraction where it is known that A - B == D:
   function W_Borrow(A : in Word; B : in Word; D : in Word)
                    return WBool is
   begin
      return WBool(Shift_Right(((not A) and B) or (((not A) or B) and D),
                               Bitness - 1));
   end W_Borrow;
   pragma Inline_Always(W_Borrow);
   
   -- A+B+C is the output bit of 1-bit adder; C is carry-in;
   -- A-B-C is the output bit of 1-bit subber; C is borrow-in.
   -- Observe that A+B+C is equal to A-B-C for all A,B,C !
   --  +-+-+-+-----+--------------+-----+----------------+
   --  |           | 'Carry' out: |     | 'Borrow' out:  |
   --  +-+-+-+-----+--------------+-----+----------------+
   --  | | | |     |(a and b) or  |     |(~a and b) or   |
   --  |A|B|C|A+B+C| ((a or b) and|A-B-C| ((~a or b) and |
   --  | | | |     |    ~(A+B+C)) |     |    (A-B-C))    |
   --  +-+-+-+-----+--------------+-----+----------------+
   --  |0|0|0|  0  |      0       |  0  |       0        |
   --  +-+-+-+-----+--------------+-----+----------------+
   --  |1|0|0|  1  |      0       |  1  |       0        |
   --  +-+-+-+-----+--------------+-----+----------------+
   --  |0|1|0|  1  |      0       |  1  |       1        |
   --  +-+-+-+-----+--------------+-----+----------------+
   --  |1|1|0|  0  |      1       |  0  |       0        |
   --  +-+-+-+-----+--------------+-----+----------------+
   --  |0|0|1|  1  |      0       |  1  |       1        |
   --  +-+-+-+-----+--------------+-----+----------------+
   --  |1|0|1|  0  |      1       |  0  |       0        |
   --  +-+-+-+-----+--------------+-----+----------------+
   --  |0|1|1|  0  |      1       |  0  |       1        |
   --  +-+-+-+-----+--------------+-----+----------------+
   --  |1|1|1|  1  |      1       |  1  |       1        |
   --  +-+-+-+-----+--------------+-----+----------------+
   -- This base case extends to any N bit register, since
   -- both equations depend ~strictly~ on A, B, and C.
   
   
   -- Without any branching: if Sel == 0, return A; if Sel == 1, return B.
   function W_Mux(A : in Word; B : in Word; Sel : in WBool) return Word is
   begin
      return B xor ((Sel - 1) and (A xor B));
   end W_Mux;
   pragma Inline_Always(W_Mux);
   
   
   -- Exchange A and B.
   procedure W_Swap(A : in out Word; B : in out Word) is
   begin
      A := A xor B;
      B := A xor B;
      A := A xor B;
   end W_Swap;
   pragma Inline_Always(W_Swap);
   
end Word_Ops;
