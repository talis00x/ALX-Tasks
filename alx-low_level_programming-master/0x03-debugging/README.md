<h1>0x03. C - Debugging</h1>

 <p0 - >In most projects, we often give you only one main file to test with. For example, this main file is a test for a <code>postitive_or_negative()</code> function similar to the one you worked with in <a href="/rltoken/lKcOFkG-GCivSDXgWgld2g" title="an earlier C project" target="_blank">an earlier C project</a>:</p>

<pre><code>carrie@ubuntu:/debugging$ cat main.c
#include "main.h"

/**
* main - tests function that prints if integer is positive or negative
* Return: 0
*/

int main(void)
{
        int i;

        i = 98;
        positive_or_negative(i);

        return (0);
}
carrie@ubuntu:/debugging$
</code></pre>

<pre><code>carrie@ubuntu:/debugging$ cat holberton.h
#ifndef HOLBERTON_H
#define HOLBERTON_H

#include &lt;stdio.h&gt;

void positive_or_negative(int i);

#endif /* HOLBERTON_H */
carrie@ubuntu:/debugging$ 
</code></pre>

<pre><code>carrie@ubuntu:/debugging$ gcc -Wall -pedantic -Werror -Wextra -std=gnu89 positive_or_negative.c main.c
carrie@ubuntu:/debugging$ ./a.out
98 is positive
carrie@ubuntu:/debugging$
</code></pre>

<p>Based on the <code>main.c</code> file above, create a file named <code>0-main.c</code>. This file must test that the function <code>positive_or_negative()</code> gives the correct output when given a case of <code>0</code>.</p>

<p>You are not coding the solution / function, you’re just testing it! However, you can adapt your function from <a href="/rltoken/lKcOFkG-GCivSDXgWgld2g" title="0x01. C - Variables, if, else, while - Task #0" target="_blank">0x01. C - Variables, if, else, while - Task #0</a> to compile with this main file to test locally.</p>

<ul>
<li>You only need to upload <code>0-main.c</code> and <code>holberton.h</code> for this task. We will provide our own <code>positive_or_negative()</code> function.</li>
<li>You are not allowed to add or remove lines of code, you may change only <strong>one</strong> line in this task.</li>
</ul>

<pre><code>carrie@ubuntu:/debugging$ gcc -Wall -pedantic -Werror -Wextra -std=gnu89 positive_or_negative.c 0-main.c -o 0-main
carrie@ubuntu:/debugging$ ./0-main
0 is zero
carrie@ubuntu:/debugging$ wc -l 0-main.c
16 1-main.c
carrie@ubuntu:/debugging$ 
</code></pre>

<p>1 - Copy this main file. Comment out (don’t delete it!) the part of the code that is causing the output to go into an infinite loop.</p>

<ul>
<li>Don’t add or remove any lines of code, as we will be checking your line count. You are only allowed to comment out existing code.</li>
<li>You do not have to compile with <code>-Wall -Werror -Wextra -pedantic</code> for this task.</li>
</ul>

<pre><code>carrie@ubuntu:/debugging$ cat 1-main.c
#include &lt;stdio.h&gt;

/**
* main - causes an infinite loop
* Return: 0
*/

int main(void)
{
        int i;

        printf("Infinite loop incoming :(\n");

        i = 0;

        while (i &lt; 10)
        {
                putchar(i);
        }

        printf("Infinite loop avoided! \\o/\n");

        return (0);
}
carrie@ubuntu:/debugging$
</code></pre>

<p>Your output should look like this:</p>

<pre><code>carrie@ubuntu:/debugging$ gcc -std=gnu89 1-main.c -o 1-main
carrie@ubuntu:/debugging$ ./1-main
Infinite loop incoming :(
Infinite loop avoided! \o/
carrie@ubuntu:/debugging$ wc -l 1-main.c
24 1-main.c
carrie@ubuntu:/debugging$
</code></pre>

<p>2 - This program prints the largest of three integers.</p>

<pre><code>carrie@ubuntu:/debugging$ cat 2-main.c
#include &lt;stdio.h&gt;
#include "main.h"

/**
* main - prints the largest of 3 integers
* Return: 0
*/

int main(void)
{
        int a, b, c;
        int largest;

        a = 972;
        b = -98;
        c = 0;

        largest = largest_number(a, b, c);

        printf("%d is the largest number\n", largest);

        return (0);
}
carrie@ubuntu:/debugging$
</code></pre>

<pre><code>carrie@ubuntu:/debugging$ cat 2-largest_number.c
#include "main.h"

/**
 * largest_number - returns the largest of 3 numbers
 * @a: first integer
 * @b: second integer
 * @c: third integer
 * Return: largest number
 */

int largest_number(int a, int b, int c)
{
    int largest;

    if (a &gt; b &amp;&amp; b &gt; c)
    {
        largest = a;
    }
    else if (b &gt; a &amp;&amp; a &gt; c)
    {
        largest = b;
    }
    else
    {
        largest = c;
    }

    return (largest);
}

carrie@ubuntu:/debugging$
</code></pre>

<pre><code>carrie@ubuntu:/debugging$ gcc -Wall -Werror -Wextra -pedantic -std=gnu89 2-largest_number.c 2-main.c -o 2-main
carrie@ubuntu:/debugging$ ./2-main
0 is the largest number
carrie@ubuntu:/debugging$
</code></pre>

<p>? That’s definitely not right.</p>

<p>Fix the code in <code>2-largest_number.c</code> so that it correctly prints out the largest of three numbers, no matter the case.</p>

<ul>
<li>Line count will not be checked for this task.</li>
</ul>

<p>3 - This program converts a date to the day of year and determines how many days are left in the year, taking leap year into consideration.</p>

<pre><code>carrie@ubuntu:/debugging$ cat 3-main_a.c
#include &lt;stdio.h&gt;
#include "holberton.h"

/**
* main - takes a date and prints how many days are left in the year, taking
* leap years into account
* Return: 0
*/

int main(void)
{
    int month;
    int day;
    int year;

    month = 4;
    day = 01;
    year = 1997;

    printf("Date: %02d/%02d/%04d\n", month, day, year);

    day = convert_day(month, day);

    print_remaining_days(month, day, year);

    return (0);
}

carrie@ubuntu:/debugging$
</code></pre>

<pre><code>carrie@ubuntu:/debugging$ cat 3-convert_day.c
#include "holberton.h"

/**
* convert_day - converts day of month to day of year, without accounting
* for leap year
* @month: month in number format
* @day: day of month
* Return: day of year
*/

int convert_day(int month, int day)
{
    switch (month)
    {
        case 2:
            day = 31 + day;
            break;
        case 3:
            day = 59 + day;
            break;
        case 4:
            day = 90 + day;
            break;
        case 5:
            day = 120 + day;
            break;
        case 6:
            day = 151 + day;
            break;
        case 7:
            day = 181 + day;
            break;
        case 8:
            day = 212 + day;
            break;
        case 9:
            day = 243 + day;
            break;
        case 10:
            day = 273 + day;
            break;
        case 11:
            day = 304 + day;
            break;
        case 12:
            day = 334 + day;
            break;
        default:
            break;
    }
    return (day);
}

carrie@ubuntu:/debugging$
</code></pre>

<pre><code>carrie@ubuntu:/debugging$ cat 3-print_remaining_days.c
#include &lt;stdio.h&gt;
#include "holberton.h"

/**
* print_remaining_days - takes a date and prints how many days are
* left in the year, taking leap years into account
* @month: month in number format
* @day: day of month
* @year: year
* Return: void
*/

void print_remaining_days(int month, int day, int year)
{
    if ((year % 4 == 0 || year % 400 == 0) &amp;&amp; !(year % 100 == 0))
    {
        if (month &gt;= 2 &amp;&amp; day &gt;= 60)
        {
            day++;
        }

        printf("Day of the year: %d\n", day);
        printf("Remaining days: %d\n", 366 - day);
    }
    else
    {
        if (month == 2 &amp;&amp; day == 60)
        {
            printf("Invalid date: %02d/%02d/%04d\n", month, day - 31, year);
        }
        else
        {
            printf("Day of the year: %d\n", day);
            printf("Remaining days: %d\n", 365 - day);
        }
    }
}

carrie@ubuntu:/debugging$ 
</code></pre>

<pre><code>carrie@ubuntu:/debugging$ gcc -Wall -Werror -Wextra -pedantic -std=gnu89 3-convert_day.c 3-print_remaining_days.c 3-main_a.c -o 3-main_a 
carrie@ubuntu:/debugging$ ./3-main_a
Date: 04/01/1997
Day of the year: 91
Remaining days: 274
carrie@ubuntu:/debugging$
</code></pre>

<p>Output looks good for <code>04/01/1997</code>! Let’s make a new main file <code>3-main_b.c</code> to try a case that is a leap year: <code>02/29/2000</code>.</p>

<pre><code>carrie@ubuntu:/debugging$ gcc -Wall -Werror -Wextra -pedantic -std=gnu89 3-convert_day.c 3-print_remaining_days.c 3-main_b.c -o 3-main_b 
carrie@ubuntu:/debugging$ ./3-main_b
Date: 02/29/2000
Invalid date: 02/29/2000
carrie@ubuntu:/debugging$
</code></pre>

<p>? That doesn’t seem right.</p>

<p>Fix the <code>print_remaining_days()</code> function so that the output works correctly for <em>all</em> dates and <em>all</em> leap years.</p>

<ul>
<li>Line count will not be checked for this task.</li>
<li>You can assume that all test cases have valid months (i.e. the value of <code>month</code> will never be less than <code>1</code> or greater than <code>12</code>) and valid days (i.e. the value of <code>day</code> will never be less than <code>1</code> or greater than <code>31</code>). </li>
<li>You can assume that all test cases have valid month/day combinations (i.e. there will never be a June 31st or November 31st, etc.), but not all month/day/year combinations are valid (i.e. February 29, 1991 or February 29, 2427).</li>
</ul>
**[TALIS](https://github.com/TALIS-PRO)**
