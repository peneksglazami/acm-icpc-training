/**********************************
 Problem: 378 - Intersecting Lines
 Solved by Andrey Grigorov
 **********************************/

#include <stdio.h>

typedef struct{
	long int x,y;
}point;

long int vect(point& p1,point& p2,point& p3,point& p4){
	return (p1.x-p2.x)*(p3.y-p4.y)-(p1.y-p2.y)*(p3.x-p4.x);
}

int main(){
	point p1,p2,p3,p4;
	long int a1,a2,b1,b2,c1,c2;
	double d,d1,d2;
	int n;
	scanf("%d",&n);
	printf("INTERSECTING LINES OUTPUT\n");
	while (n--){
		scanf("%ld %ld %ld %ld %ld %ld %ld %ld",&p1.x,&p1.y,&p2.x,&p2.y,&p3.x,&p3.y,&p4.x,&p4.y);
		if (vect(p1,p2,p3,p4) != 0){
			a1 = p2.y - p1.y;
			b1 = p1.x - p2.x;
			c1 = -a1*p1.x-b1*p1.y;
			a2 = p4.y - p3.y;
			b2 = p3.x - p4.x;
			c2 = -a2*p3.x-b2*p3.y;
			d = a1*b2-a2*b1;
			d1 = -c1*b2+c2*b1;
			d2 = -a1*c2+a2*c1;
			printf("POINT %0.2lf %0.2lf\n",d1/d,d2/d);
		}
		else{
			a1 = p2.y - p1.y;
			b1 = p1.x - p2.x;
			c1 = -a1*p1.x-b1*p1.y;
			if (a1*p3.x+b1*p3.y+c1)
				printf("NONE\n");
			else
				printf("LINE\n");
		}
	}
	printf("END OF OUTPUT\n");
	return 0;
}