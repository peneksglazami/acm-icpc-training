/*********************************************
 Problem: 2672 - Hansel and Grethel
 ACM ICPC - Europe - Northwestern - 2002/2003
 Solved by Andrey Grigorov
 *********************************************/

#include <stdio.h>
#include <math.h>

int main(){
	const double pi = 2*acos(0);
	double x,y,a1,a2,b1,b2,c1,c2,d,d1,d2,angle;
	int test;
	scanf("%d",&test);
	while (test--){
		scanf("%lf %lf %lf",&x,&y,&angle);
		angle = angle*pi/180;
		a1 = cos(angle);
		b1 = -sin(angle);
		c1 = -a1*x-b1*y;
		scanf("%lf %lf %lf",&x,&y,&angle);
		angle = angle*pi/180;
		a2 = cos(angle);
		b2 = -sin(angle);
		c2 = -a2*x-b2*y;
		d = a1*b2-a2*b1;
		d1 = -c1*b2+c2*b1;
		d2 = -a1*c2+a2*c1;
		printf("%0.4lf %0.4lf\n",d1/d,d2/d);
	}
	return 0;
}