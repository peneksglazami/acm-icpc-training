/*************************************************
 Problem: 3317 - Making the Grade
 ACM ICPC - North America - Southeast - 2005/2006
 Solved by Andrey Grigorov
 *************************************************/

#include <stdio.h>
#include <math.h>

int main(){
	int i,n,n_path = 0;
	long int m1,m2,mm1,mm2;
	double h1,h2,slope;
	scanf("%d",&n);
	while (n){
		scanf("%ld %lf",&m1,&h1);
		scanf("%ld %lf",&m2,&h2);
		slope = (h2-h1)/(m2-m1);
		mm1 = m1; mm2 = m2;
		for (i = 3; i <= n; i++){
			m1 = m2; h1 = h2;
			scanf("%ld %lf",&m2,&h2);
			if (fabs(slope) < fabs((h2-h1)/(m2-m1))){
				slope = (h2-h1)/(m2-m1);
				mm1 = m1; mm2 = m2;
			}
		}
		printf("Path %d has steepest slope of %0.2lf between checkpoints %ld and %ld\n",++n_path,slope,mm1,mm2);
		scanf("%d",&n);
	}
	return 0;
}