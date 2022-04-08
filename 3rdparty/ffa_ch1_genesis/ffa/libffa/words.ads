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

with Iron;

package Words is
   
   pragma Pure;
   
   -- The most fundamental fact about Word: width.
   Bitness     : constant Positive := Iron.MachineBitness;
   
   -- It is possible to calculate BitnessLog2 at elaboration time,
   -- but we will avoid having ~any~ elaboration at all in FFA.
   BitnessLog2 : constant Positive := Iron.MachineBitnessLog2;
   
   -- The Word width, expressed in ~bytes~:
   Byteness    : constant Positive := Bitness / Iron.ByteBits;
   
   -- What kind of words to use. Must be machine-word or smaller.
   type Word is mod 2**Bitness;
   for Word'Size use Bitness;
   
   -- The very same Word, but its only legal values are 0 and 1.
   subtype WBool is Word range 0 .. 1;
   
   -- When we must refer to individual bit positions of a machine word:
   subtype WBit_Index is Natural range 0 .. Bitness - 1;
   
end Words;
