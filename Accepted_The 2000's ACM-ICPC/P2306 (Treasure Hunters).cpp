/*****************************************************
 Problem 2306 - Treasure Hunters
 ACM ICPC - North America - South Central - 2001/2002
 Solved by Andrey Grigorov
 *****************************************************/
 
#include <stdio.h>
#include <string.h>

const int maxt = 8, maxh = 6;

int t,h,b[maxt+1],best[maxt+1],best_diff;
long int a[maxh+1][maxt+1],s[maxh+1];

void rec(int i)
{
    long int max,min;
    int j;
    if (i == t+1)
    {
        memset(s,0,(maxh+1)*sizeof(s[0]));
        for (j = 1; j <= t; j++)
            s[b[j]]+=a[b[j]][j];
        min = max = s[1];
        for (j = 2; j <= h; j++)
            if (min > s[j])
                min = s[j];
            else
                if (max < s[j])
                    max = s[j];
        if (max-min < best_diff)
        {
            best_diff = max-min;
            for (j = 1; j <= t; j++)
                best[j] = b[j];
        }
    }
    else
        for (j = 1; j <= h; j++)
        {
            b[i] = j;
            rec(i+1);
        }
}

int main()
{
    char st[10];
    long int sum;
    int i,j;
    gets(st);
    while (!feof(stdin))
    {
        scanf("%d",&t);
        scanf("%d",&h);
        for (i = 1; i <= h; i++)
            for (j = 1; j <= t; j++)
                scanf("%ld",&a[i][j]);
        gets(st);
        while (strcmp(st,"END"))
            gets(st);
        best_diff = 100000;
        rec(1);
        for (i = 1; i <= h; i++){
            sum = 0;
            for (j = 1; j <= t; j++)
                if (best[j] == i)
                {
                    sum += a[i][j];
                    printf("%d ",j);
                }
            printf("%ld\n",sum);
        }
        printf("\n");
        while (!feof(stdin) && strcmp(st,"START"))
            gets(st);
    }
    return 0;
}