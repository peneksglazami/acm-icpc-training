/*************************************
 Problem 2052 - Number Steps
 ACM ICPC - Asia - Tehran - 2000/2001
 Solved by Andrey Grigorov
 *************************************/
#include <stdio.h>

int main()
{
    int n,x,y,s;
    scanf("%d",&n);
    while (n--)
    {
        scanf("%d %d",&x,&y);
        s = 4*(y/2);
        if (x == y)
        {
            if (y % 2)
                printf("%d",s+1);
            else
                printf("%d",s);
        }
        else
            if (x == y+2)
            {
                if (y % 2)
                    printf("%d",s+3);
                else
                    printf("%d",s+2);
            }
            else
                printf("No Number");
        printf("\n");
    }
    return 0;
}
