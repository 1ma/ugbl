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

-- FZ -- the fundamental FZ type: an unsigned integer of fixed width,
-- i.e. a contiguous array of machine words. There is no 'meta'-anything:
-- in particular, there is no normalization nor will there ever be any
-- normalization, nor any provisions for resizing, nor any such thing.
-- Note that endianness is irrelevant, here and elsewhere in FFA.

with Words; use Words;

package FZ_Type is
   
   pragma Pure;
   
   -- Indices of all indexable items:
   type Indices is new Natural;
   
   -- Index of a particular Word in an FZ:
   subtype Word_Index is Indices;
   
   -- The FZ, in person! I.e. a bignum of permanently fixed bitness.
   type FZ is array(Word_Index range <>) of Word;
   
   -- A count of Words in an FZ (cannot be 0):
   subtype Word_Count is Indices range 1 .. Indices'Last;
   
   -- An index of a particular ~bit~ in an FZ:
   subtype FZBit_Index is Indices;
   
end FZ_Type;
