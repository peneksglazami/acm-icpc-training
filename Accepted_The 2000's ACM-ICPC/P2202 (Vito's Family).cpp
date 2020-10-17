/*********************************************
 Problem: 2202 - Vito's Family
 ACM ICPC - Europe - Southwestern - 2000/2001
 Solved by Andrey Grigorov
 *********************************************/

#include <stdio.h>
#include <string.h>

int main()
{
    const int maxs = 30000;
    int test,i,n,d,s[maxs],l,r,sum,min;
    scanf("%d",&test);
    while (test--)
    {
        memset(s,0,maxs*sizeof(s[0]));
        scanf("%d",&n);
        for (i = 1; i <= n; i++)
        {
            scanf("%d",&d);
            s[d]++;
        }
        sum = 0;
        l = 0;
        r = 0;
        for (i = 2; i < maxs; i++)
            if (s[i])
            {
                r += s[i];
                sum += (i-1)*s[i];
            }
        l = n-r;
        min = sum;
        for (i = 2; i < maxs; i++)
        {
            sum += l-r;
            if (sum < min)
                min = sum;
            if (s[i])
            {
                l += s[i];
                r -= s[i];
            }
        }
        printf("%d\n",min);
    }
    return 0;
}