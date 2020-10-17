/*********************************
 Problem: 408 - Uniform Generator
 Solved by Andrey Grigorov
 *********************************/

#include <stdio.h>

int main(){
	const long int max = 100000;
	long int i,f,step,mod;
	bool ok,b[max+1];
	while (scanf("%ld %ld",&step,&mod) == 2){
		for (i = 0; i < mod; i++)
			b[i] = false;
		ok = true;
		i = 1;
		b[0] = true;
		f = 0;
		while (ok && (i < mod)){
			i++;
			f = (f+step)%mod;
			if (b[f])
				ok = false;
			else
				b[f] = true;
		}
		printf("%10ld %10ld",step,mod);
		if (ok)
			printf("    Good Choice\n");
		else
			printf("    Bad Choice\n");
		printf("\n");
	}
	return 0;
}