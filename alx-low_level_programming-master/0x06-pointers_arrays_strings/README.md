<h1>0x06. C - More pointers, arrays and strings</h1>
<p>>
0. strcat
mandatory

Write a function that concatenates two strings.

    Prototype: char *_strcat(char *dest, char *src);
    This function appends the src string to the dest string, overwriting the terminating null byte (\0) at the end of dest, and then adds a terminating null byte
    Returns a pointer to the resulting string dest

FYI: The standard library provides a similar function: strcat. Run man strcat to learn more.
</p>

<p>

1. strncat
mandatory

Write a function that concatenates two strings.

    Prototype: char *_strncat(char *dest, char *src, int n);
    The _strncat function is similar to the _strcat function, except that
        it will use at most n bytes from src; and
        src does not need to be null-terminated if it contains n or more bytes
    Return a pointer to the resulting string dest

FYI: The standard library provides a similar function: strncat. Run man strncat to learn more
</p>

<p>

2. strncpy
mandatory

Write a function that copies a string.

    Prototype: char *_strncpy(char *dest, char *src, int n);
    Your function should work exactly like strncpy

FYI: The standard library provides a similar function: strncpy. Run man strncpy to learn more.
</p>
**[TALIS](https://github.com/TALIS-PRO)**
