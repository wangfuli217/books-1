#include <stdio.h>
#include <string.h>

#define abs(x)	((x) < 0 ? -(x) : (x))
void reverse(char s[]);

/* itoa: convert n to characters in s, w characters wide */
void itoa(int n, char s[], int w)
{
	int i, sign;

	sign = n;	/* record sign */
	i = 0;
	do {	/* generate digits in reverse order */
		s[i++] = abs(n % 10) + '0';	/* get next digit */
	} while ((n /= 10) != 0);	/* delete it */
	if (sign < 0)
		s[i++] = '-';
	while (i < w)
		s[i++] = ' ';
	s[i] = '\0';
	reverse(s);
}

/* reverse: reverse string s in place */
void reverse(char s[])
{
	int c, i, j;

	for (i = 0, j = strlen(s) - 1; i < j; i++, j--) {
		c = s[i];
		s[i] = s[j];
		s[j] = c;
	}
}

int main(void)
{
	char data[16];
	int num = -100;

	itoa(num, data, 10);
	printf("%d %s\n", num, data);

	return 0;
}
