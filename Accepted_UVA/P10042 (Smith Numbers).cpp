/*********************************************
 Problem 10042 - Smith Numbers
 ACM ICPC - Europe - Southwestern - 2000/2001
 Solved by Andrey Grigorov
 *********************************************/
#include <stdio.h>

const int maxp = 3440;

long int p[maxp];

void create_prime()
{
    long int i,j;
    bool ok;
    p[0] = 1;
    p[1] = 2;
    for (i = 3; i <= 32000; i+=2)
    {
        ok = true;
        for (j = 1; (j <= p[0]) && (p[j]*p[j] <= i) && ok; j++)
            ok = i % p[j];
        if (ok)
            p[++p[0]] = i;
    }
}

bool is_prime(long int n)
{
    for (int i = 1; i <= p[0]; i++)
        if (n == p[i])
            return true;
        else
            if (!(n % p[i]))
                return false;
    return true;
}

int digits_sum(long int n)
{
    int s = 0;
    while (n)
    {
        s += n % 10;
        n /= 10;
    }
    return s;
}

int to_prime(long int n)
{
    if (n == 1)
        return 1;
    int s = 0,s1;
    for (int i = 1; (i <= p[0]) && (n != 1); i++)
        if (!(n % p[i]))
        {
            s1 = digits_sum(p[i]);
            do{
                s += s1;
            }while (!((n /= p[i]) % p[i]));
        }
    if (n != 1)
        s += digits_sum(n);
    return s;
}


bool is_smith_number(long int n)
{
    return (digits_sum(n) == to_prime(n));
}

int main()
{
    long int i,n;
    int test;
    create_prime();
    scanf("%d",&test);
    while (test--)
    {
        scanf("%ld",&n);
        for (i = n+1; !is_smith_number(i) || is_prime(i); i++);
        printf("%ld\n",i);
    }
    return 0;
}