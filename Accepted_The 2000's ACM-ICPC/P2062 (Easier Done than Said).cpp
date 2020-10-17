/***************************************************
 Problem 2062 - Easier Done than Said?
 ACM ICPC - North America - Mid Central - 2000/2001
 Solved by Andrey Grigorov
 ***************************************************/

#include <stdio.h>
#include <string.h>

const int maxl = 20;
const char vowel[] = "aeiou";

void trim(char* st)
{
    if (strstr(st," "))
        *strstr(st," ") = '\0';
}

bool have_vowel(char* st)
{
    return strpbrk(st,vowel) != NULL;
}

bool is_vowel(char ch)
{
    return strrchr(vowel,ch) != NULL;
}

bool no_three(char *st)
{
    char s[maxl+1];
    int i;
    for (i = 0; i < strlen(st); i++)
        s[i] = (is_vowel(st[i])) ? '0' : '1';
    return (strstr(s,"000") == NULL) && (strstr(s,"111") == NULL);
}

bool no_double(char *st)
{
    int i;
    for (i = 1; i < strlen(st); i++)
        if ((st[i] != 'e') && (st[i] != 'o') && (st[i-1] == st[i]))
            return false;
    return true;
}

int main()
{
    char st[maxl+1];
    gets(st);
    trim(st);
    while (strcmp(st,"end"))
    {
        if (have_vowel(st) && no_three(st) && no_double(st))
            printf("<%s> is acceptable.\n",st);
        else
            printf("<%s> is not acceptable.\n",st);
        gets(st);
        trim(st);
    }
    return 0;
}