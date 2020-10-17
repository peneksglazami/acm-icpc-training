/*********************************************
 Problem: 3413 - Reduced ID Numbers
 ACM ICPC - Europe - Northwestern - 2005/2006
 Problemsetter: Tom Verhoeff
 Solved by Andrey Grigorov
 *********************************************/

#include <stdio.h>

int main(){
	const int maxg = 300, maxn = 999999;
	long int m,max,a[maxg+1];
	bool find,b[maxn];
	int i,test,G;
	scanf("%d",&test);
	while (test){
		scanf("%d",&G);
		max = 0;
		for (i = 1; i <= G; i++){
			scanf("%ld",&a[i]);
			if (a[i] > max)
				max = a[i];
		}
		m = (G == 1) ? 1 : G-1;
		find = false;
		do{
			for (i = 0; i < m; i++)
				b[i] = false;
			find = true;
			for (i = 1; i <= G; i++)
				if (!b[a[i]%m])
					b[a[i]%m] = true;
				else{
					find = false;
					break;
				}
			m++;
		} while (!find);
		printf("%ld\n",--m);
		test--;
	}
	return 0;
}