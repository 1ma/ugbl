# 1ma's GNAT Bitcoin Library

[![.github/workflows/ci.yml](https://github.com/1ma/ugbl/actions/workflows/ci.yml/badge.svg)](https://github.com/1ma/ugbl/actions)

A dubious attempt at synthesizing Jimmy Song's Python code from his book [Programming Bitcoin](https://programmingbitcoin.com/) with Stanislav Datskovskiy's [Adatronic approach to bignum arithmetic](http://www.loper-os.org/?p=1913).

The primary goal of the project is to be able to forge valid keypairs and transactions with dependency-free code[^*] that I personally understand.

### Caveat

This library contains cryptographic primitives _and_ is partly based on educational code samples _and_ is written for autodidactic purposes, so use it at your own risk.


[^*]: Besides the use of [AUnit](https://github.com/adacore/aunit) to drive the automatic test suite.
