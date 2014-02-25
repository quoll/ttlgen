ttlgen
======

Generates large TTL files

## Description

This program generates enourmous quantities of RDF in TTL format for testing
purposes.

To build, just type 'make'.  This builds two programs: ttlgen and test.

"test" is used to determine that the internal functions are all working as
expected.  It is only included for completeness.

"ttlgen" will generate RDF describing numbers up to 2^32 or to a number
provided on the command line.  The TTL is sent to stdout.  For large files
it may be advisable to pipe the results through gzip.

## Example

To generate statements for the first million numbers, use:

```
$ ttlgen 1000000 > data.tll
```

## Details

The properties described are:
 * An english textual representation of the number
 * The Roman numeral representation for the number, if it is less than 40000
 * Whether or not the number is prime
 * The list of prime factors for the number
 * The square of the number (for all numbers whose square is less than 2^32)
 * Whether or not the number is triangular
 * Whether or not the number is Perfect

When run, the ttlgen program will start by generating an internal list of all
prime numbers to 2^32.  This process can take some time (a minute or so).
Once this list is built, the program will start generating the RDF.

The process is less than optimal, and generating this much RDF takes a long
time.  In order to terminate the generation cleanly, send a USR1 signal to the
application.
eg.
```
killall -USR1 ttlgen
```

Terminating early will finish writing the properties for the current number.

