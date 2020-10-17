/************************************
 Problem: 10088 - Trees on My Island
 Author: Rezaul Alam Chowdhury
 Solved by Andrey Grigorov
 ************************************/

#include <stdio.h>
#include <math.h>

const int maxn = 1000;

typedef struct{
	double x,y;} point;

int N;
point p[maxn+1];

int next(int& i){
	return (i < N) ? i+1 : 1;
}

double square(){
	double s;
	int i;
	s = 0;
	for (i = 1; i <= N; i++)
		s+=p[i].x*p[next(i)].y-p[next(i)].x*p[i].y;
	return fabs(s)/2;
}

long int gcd(long int&a, long int& b){
	long int nd;
	nd = b;
	while (a){
		nd = a;
		a = b % a;
		b = nd;
	}
	return nd;
}

int main(){
	int i;
	long int x,y,l1,l2,cnt;
	double sum;
	scanf("%d",&N);
	while (N){
		for (i = 1; i <= N; i++){
			scanf("%ld %ld",&x,&y);
			p[i].x = x;
			p[i].y = y;
		}
		cnt = 0;
		for (i = 1; i <= N; i++){
			l1 = floor(fabs(p[i].x-p[next(i)].x));
			l2 = floor(fabs(p[i].y-p[next(i)].y));
			cnt+=gcd(l1,l2);
		}
		sum = square()-cnt/2+1;
		printf("%0.0f\n",floor(sum));
		scanf("%d",&N);
	}
	return 0;
}