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

package Iron is
   
   pragma Pure;
   
   --------------------------------------
   -------- For a 64-bit system: --------
   --------------------------------------
   MachineBitness     : constant Positive := 64;
   MachineBitnessLog2 : constant Positive := 6; -- log2(64)
   --------------------------------------
   
   --------------------------------------
   -------- For a 32-bit system: --------
   --------------------------------------
   --  MachineBitness     : constant Positive := 32;
   --  MachineBitnessLog2 : constant Positive := 5; -- log2(32)
   --------------------------------------
   
   -- Bits per Byte
   ByteBits           : constant Positive := 8;
   
end Iron;
