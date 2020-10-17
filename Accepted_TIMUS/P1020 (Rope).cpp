/*******************************************************************
 Problem: 1020 - Rope
 Ural State University Internal Contest October'2000 Junior Session
 Автор задачи: А.Петров, Н.Шамгунов
 Solved by Andrey Grigorov
 *******************************************************************/

#include <stdio.h>
#include <math.h>

double dist(double x1, double y1, double x2, double y2){
	return sqrt(pow(x2-x1,2.0)+pow(y2-y1,2.0));
}

int main(){
	const int maxn = 100;
	int i,n;
	double d,r,x[maxn+1],y[maxn+1];
	scanf("%d %lf",&n,&r);
	for (i = 0; i < n; i++){
		scanf("%lf %lf",&x[i],&y[i]);
	}
	x[n] = x[0];
	y[n] = y[0];
	d = 0;
	for (i = 0; i < n; i++)
		d += dist(x[i],y[i],x[i+1],y[i+1]);
	d += 4*acos(0.0)*r;
	printf("%0.2lf",d);
	return 0;
}