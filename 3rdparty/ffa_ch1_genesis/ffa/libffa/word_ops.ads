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

-- Fundamental Operations on Words:
package Word_Ops is
   
   pragma Pure;
   
   -- Branch-free calculation of 'carry' from a machine-word addition.
   function W_Carry(A : in Word; B : in Word; S : in Word)
                   return WBool;
   
   -- Branch-free calculation of 'borrow' from a machine-word subtraction.
   function W_Borrow(A : in Word; B : in Word; D : in Word)
                    return WBool;
   
   -- Without any branching: if Sel == 0, return A; if Sel == 1, return B.
   function W_Mux(A : in Word; B : in Word; Sel : in WBool)
                 return Word;
   
   -- Exchange A and B.
   procedure W_Swap(A : in out Word; B : in out Word);
   
end Word_Ops;
