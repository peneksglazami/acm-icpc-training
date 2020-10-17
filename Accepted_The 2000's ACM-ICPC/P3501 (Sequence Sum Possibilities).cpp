/********************************************************
 ACM ICPC - North America - Greater New York - 2005/2006
 Problem: 3501 - Sequence Sum Possibilities
 Solved by Andrey Grigorov
 ********************************************************/

#include <stdio.h>

const unsigned long int maxn = 3000000000;
unsigned long int p[5600];


void create_prime(){
	unsigned long int i,j;
	bool ok;
	p[0] = 1;
	p[1] = 2;
	for (i = 3; i*i <= maxn; i+=2){
		ok = true;
		for (j = 1; (j <= p[0]) && ok && (p[j]*p[j] <= i); j++)
			ok = ok && (i % p[j] != 0);
		if (ok)
			p[++p[0]] = i;
	}
}

long int f(long int n){
	int i;
	long int sum,s;
	while (!(n % 2))
		n /= 2;
	i = 2;
	sum = 1;
	while ((i <= p[0]) && (n != 1)){
		if (!(n % p[i])){
			s = 1;
			while (!(n % p[i])){
				n /= p[i];
				s++;
			}
			sum *= s;
		}
		i++;
	}
	if (n > 1)
		sum *= 2;
	return sum-1;
}

int main(){
	int test,num;
	long int n;
	create_prime();
	scanf("%d",&test);
	while (test){
		scanf("%d %ld",&num,&n);
		printf("%d %ld\n",num,f(n));
		test--;
	}
	return 0;
}