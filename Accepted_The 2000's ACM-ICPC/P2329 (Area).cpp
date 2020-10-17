/*********************************************
 Problem 2329 - Area
 ACM ICPC - Europe - Northwestern - 2001/2002
 Solved by Andrey Grigorov
 *********************************************/
 
#include <stdio.h>
#include <math.h>

const int maxm = 100;

typedef struct{
    int x,y;
}point;

point p[maxm+1];
int m;

int next(int &i)
{
    return (i == m) ? 0 : i+1;
}

double square()
{
    double s;
    int i;
    s = 0;
    for (i = 0; i <= m; i++)
        s += p[i].x*p[next(i)].y - p[next(i)].x*p[i].y;
    return fabs(s)/2;
}

int gcd(int a, int b)
{
    int nd;
    nd = b;
    while (a)
    {
        nd = a;
        a = b%a;
        b = nd;
    }
    return nd;
}

int on_edge(int x1, int y1, int x2, int y2)
{
    return gcd(abs(x2-x1),abs(y2-y1));
}

int main()
{
    int i,test,dx,dy,E,I,n_case = 0;
    double S;
    scanf("%d",&test);
    p[0].x = 0;
    p[0].y = 0;
    while (test--)
    {
        scanf("%d",&m);
        E = 0;
        for (i = 1; i <= m ; i++)
        {
            scanf("%d %d",&dx,&dy);
            p[i].x = p[i-1].x+dx;
            p[i].y = p[i-1].y+dy;
            E += on_edge(p[i-1].x,p[i-1].y,p[i].x,p[i].y);
        }
        E += on_edge(p[0].x,p[0].y,p[m].x,p[m].y);
        S = square();
        I = (int)(square()-(double)E/2+1);
        printf("Scenario #%d:\n",++n_case);
        printf("%d %d %0.1lf\n",I,E,S);
        printf("\n");
    }
    return 0;
}
