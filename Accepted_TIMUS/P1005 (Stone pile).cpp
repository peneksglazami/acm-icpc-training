/***************************
 Problem: 1005 - Stone pile
 Solved by Andrey Grigorov
 ***************************/

#include <stdio.h>

bool a[21];

void plus(){
	int i;
	i = 0;
	while (a[i]){
		a[i] = false;
		i++;
	}
	a[i] = !a[i];
}

long int fabs(long int a){
	return (a >= 0) ? a : -a;
}

int main(){
	long int w1,w2,min,w[21];
	int i,n;
	scanf("%d",&n);
	min = 0;
	for (i = 0; i < n; i++){
		scanf("%ld",&w[i]);
		min += w[i];
	}
	for (i = 0; i <= n; i++)
		a[i] = false;
	do{
		w1 = 0;
		w2 = 0;
		for (i = 0; i < n; i++)
			if (a[i])
				w1 += w[i];
			else
				w2 += w[i];
		if (min > (fabs(w1-w2)))
			min = fabs(w1-w2);
		plus();
	}while (!a[n]);
	printf("%ld",min);
	return 0;
}