/****************************************************
 Problem: 2640 - A Simple Question of Chemistry
 ACM ICPC - North America - Mid Atlantic - 2002/2003
 Solved by Andrey Grigorov
 ****************************************************/

#include <stdio.h>
#include <math.h>

int main(){
    const double approx = 0.001;
    double t1,t2;
    scanf("%lf",&t1);
    scanf("%lf",&t2);
    while (fabs(t2-999.00) > approx){
        printf("%0.2lf\n",t2-t1);
        t1 = t2;
        scanf("%lf",&t2);
    }
    printf("End of Output\n");
    return 0;
}