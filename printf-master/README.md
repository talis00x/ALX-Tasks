# _printf :page_facing_up:

A formatted output conversion C program completed as part of the low-level
programming and algorithm track at ALX. The program is a pseudo-
recreation of the C standard library function, `printf`.

## Dependencies :couple:

The `_printf` function was coded on an Ubuntu 14.04 LTS machine with `gcc` version 4.8.4.

## Usage :running:

To use the `_printf` function, assuming the above dependencies have been installed,
compile all `.c` files in the repository and include the header `main.h` with
any main function.

Example `main.c`:
```
#include "main.h"

int main(void)
{
    _printf("Hello, World!");

    return (0);
}
```

Compilation:
```
$ gcc *.c -o tester
```

Output:
```
$ ./tester
Hello, World!
$
```

## Description :speech_balloon:

The function `_printf` writes output to standard output. The function writes
under the control of a `format` string that specifies how subsequent arguments
(accessed via the variable-length argument facilities of `stdarg`) are
converted for output.

Prototype: `int _printf(const char *format, ...);`

### Return Value

Upon successful return, `_printf` returns the number of characters printed
(excluding the terminating null byte used to end output to strings). If an
output error is encountered, the function returns `-1`.

### Format of the Argument String

The `format` string argument is a constant character string composed of zero
or more directives: ordinary characters (not `%`) which are copied unchanged
to the output stream; and conversion specifications, each of which results in
fetching zero or more subsequent arguments. Conversion specification is
introduced by the character `%` and ends with a conversion specifier. In
between the `%` character and conversion specifier, there may be (in order)
zero or more _flags_, an optional minimum _field width_, an optional
_precision_ and an optional _length_ modifier. The arguments must correspond
with the conversion specifier, and are used in the order given.

#### Flag Characters

The character `%` may be followed by zero or more of the following flags:

#### #
  * For `o` conversions, the first character of the output string is prefixed
  with `0` if it was not zero already.
  * For `x` converions, `0x` is prepended for non-zero numbers.
  * For `X` conversions, `0X` is prepeneded for non-zero numbers.

Example `main.c`:
```
int main(void)
{
    _printf("%#x\n", 7);
}
```
Output:
```
0x7
```

#### (space)
  * A blank is left before a positive number or empty string produced by a
  signed conversion.

Example `main.c`:
```
int main(void)
{
    _printf("% d\n", 7);
}
```
Output:
```
 7
```

#### +
  * A sign (`+` or `-`) is always placed before a number produced by signed
  conversion.
  * Overrides a space flag.

Example `main.c`:
```
int main(void)
{
    _printf("%+d\n", 7);
}
```
Output:
```
+7
```

#### 0
  * For `d`, `i`, `o`, `u`, `x`, and `X` conversions, the converted value is
  padded on the left with zeroes rather than blanks.
  * If the `0` flag is provided to a numeric conversion with a specified
  precision, it is ignored.

Example `main.c`:
```
int main(void)
{
    _printf("%05d\n", 7);
}
```
Output:
```
00007
```

#### -
  * The converted value is left-justified (padded on the right with blanks
  instead of on the left with blanks or zeroes).
  * Overrides a `0` flag.

Example `main.c`:
```
int main(void)
{
    _printf("%-5d7\n", 7);
}
```
Output:
```
7    7
```

#### Field Width

After flags, a minimum field width may be specified by a decimal digit string
The first digit must be non-zero. If the converted value has fewer characters
than the provided width, the output is padded on the left or right with spaces
(depending on whether the `-` flag was provided).

Example `main.c`:
```
int main(void)
{
    _printf("%7d\n", 7);
}
```
Ouptut:
```
      7
```

Alternatively, width may be provied as an argument using the `*` character
For example, in the following:
`_printf("%*d\n", 6, 1);`
the argument `6` is considered the width for the conversion of the decimal `1`.

#### Precision

After any flags or provided width, a precision may be specified by a `.`
followed by a decimal digit string. For `d`, `i`, `o`, `u`, `x`, and `X`
conversions, the precision specifies the minimum number of digits to appear.
For `s` and `S` conversions, the precision specifies the maximum characters
to be printed.

Example `main.c`:
```
int main(void)
{
    _printf("%.7d\n", 7);
}
```
Output:
```
0000007
```

Alternatively, precision may be provided as an argument using the `*` character
after the `.`. For example, in the following:
`_printf("%.*d\n", 6, 1);`
the argument `6` is considered the precision for the conversion of the decimal
`1`.

#### Length Modifiers

After flags, width, and precision and before a conversion specifier, one of the
following length modifiers may be provided:

#### h
Specifies that an integer conversion corresponds to a `short int` or
`unsigned short int` argument.

Example `main.c`:
```
int main(void)
{
    _printf("%hd\n", SHRT_MAX);
}
```
Output:
```
32767
```

#### l
Specifies that an integer conversion corresponds to a `long int` or
`unsigned long int` argument.

Example `main.c`:
```
int main(void)
{
    _printf("%ld\n", LONG_MAX);
}
```
Output:
```
9223372036854775807
```

#### Conversion Specifiers

The conversion specifier (introduced by the character `%`) is a character that
specifies the type of conversion to be applied. The `_printf` function
supports the following conversion specifiers:

#### d, i
The `int` argument is converted to signed decimal notation.

Example `main.c`:
```
int main(void)
{
    _printf("%d\n", 7);
}
```
Output:
```
7
```

#### b
The `unsigned int` argument is converted to signed decimal notation.

Example `main.c`:
```
int main(void)
{
    _printf("%b\n", 7);
}
```
Output:
```
111
```

#### o, u, x, X
The `unsigned int` argument is converted to unsigned octal (`o`), unsigned
decimal (`u`), or unsigned hexadecimal (`x` and `X`). The letters `abcdef` are
used for `x` conversions and the letters `ABCDEF` are used for `X` conversions.

Example `main.c`:
```
int main(void)
{
    _printf("%o\n", 77);
}
```
Output:
```
115
```

#### c
The `int` argument is converted to an `unsigned char`.

Example `main.c`:
```
int main(void)
{
    _printf("%c\n", 48);
}
```
Output:
```
0
```

#### s
The `const char *` argument is expected to be a pointer to a character array
(aka. pointer to a string). Characters from the array are written starting
from the first element of the array and ending at, but not including, the
terminating null byte (`\0`).

Example `main.c`:
```
int main(void)
{
    _printf("%s\n", "Hello, World!");
}
```
Output:
```
Hello, World!
```

#### S
Identical to the `s` conversion specifier, except any non-printable characters
in the array (ie. characters with an ASCII value < 32 or >= 127) are written
as `\x` followed by the ASCII code value in hexadecimal (upper case, two
characters).

Example `main.c`:
```
int main(void)
{
    _printf("%S\n", "Hello, World! Π");
}
```
Output:
```
Hello, World! \x0FFFFFFFFFFFFFFCE\x0FFFFFFFFFFFFFFA0
```

r
Identical to the `s` conversion specifier, except characters from the array
are written in reverse, starting from, but not including, the terminating null
byte (`\0`) and ending at the first element of the array.

Example `main.c`:
```
int main(void)
{
    _printf("r\n", "Hello, World");
}
```
Output:
```
dlroW ,olleH
```

#### R

Identical to the `s` conversion specifier, except each character of the array
is converted to its corresponding character in ROT13 before being written.

Example `main.c`:
```
int main(void)
{
    _printf("%R\n", "Hello, World");
}
```
Output:
```
Uryyb, Jbeyq
```

#### p
The address of the argument is written. The address is written in hexadecimal
with a leading `0x`.

Example `main.c`:
```
int main(void)
{
    char *str = "Hello, World";

    _printf("%p\n", (void *)str);
}
```
Output:
```
0x561a6d7bab5d
```

#### %
A `%` is written. No argument is converted. The complete conversion
specification is `%%`.

Example:
```
int main(void)
{
    _printf("%%\n");
}
```
Output:
```
%
```

## More Examples :thumbsup:

To print the address of Holberton School in the format "972 Mission St., San
Francisco, CA 94103" where *street*, *city* and *state* are pointers to strings:

Example `main.c`:
```
#include "main.h"

int main(void)
{
	char *street = "Mission St.", *city = "San Francisco", *state = "CA";

	_printf("%d %s, %s, %s %d\n", 972, street, city, state, 94103);
}
```
Output:
```
972 Mission St., San Francisco, CA 94103
```

To print the result of basic mathematical operations prepended by signs and
all numbers printed with a minimum precision of two digits:

Example `main.c`:
```
#include "main.h"

int main(void)
{
	_printf("%.2d + %.2d = %+.2d\n", 1, 2, 1 + 2);
	_printf("%d - %d = %+d\n", 10, 20, 10 - 20);
}
```
Output:
```
01 + 02 = +03
10 - 20 = -10
```

To print the values of `LONG_MAX` and `LONG_MIN` aligned and
left-justified with a width of 30:

Example `main.c`:
```
#include "main.h"
#include <limits.h>

int main(void)
{
	_printf("% -30ld -> LONG_MAX\n", LONG_MAX);
	_printf("%-30ld -> LONG_MIN\n", LONG_MIN);
}
```
Output:
```
 9223372036854775807           -> LONG_MAX
-9223372036854775808           -> LONG_MIN
```

## Authors :black_nib:

* (cm-amos)Amos Mwongela <[cm-amos](https://github.com/cm-amos)>
* Kibangedi <[kibagendi20](https://github.com/kibagendi20)>


## Acknowledgements :pray:

The `_printf` function emulates functionality of the C standard library
function `printf`. This README borrows from the Linux man page
[printf(3)](https://linux.die.net/man/3/printf).
**[TALIS](https://github.com/TALIS-PRO)**
