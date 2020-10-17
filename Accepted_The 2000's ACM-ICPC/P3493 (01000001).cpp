/********************************************************
 ACM ICPC - North America - Greater New York - 2005/2006
 Problem: 3493 - 01000001
 Solved by Andrey Grigorov
 ********************************************************/

#include <stdio.h>
#include <string.h>

int main(){
	int i,t,n,test,buf,a[82],b[82],c[82];
	char st[200];
	scanf("%d",&test);
	gets(st);
	for (t = 1; t <= test; t++){
		for (i = 0; i <= 81; i++)
			a[i] = b[i] = c[i] = 0;
		gets(st);
		n = strlen(st);
		st[n] = ' ';
		st[n+1] = '\0';
		a[0] = 0;
		i = 0;
		while (st[i] != ' ')
			a[++a[0]] = st[i++] - '0';
		b[0] = 0;
		i++;
		while (st[i] != ' ')
			b[++b[0]] = st[i++] - '0';
		for (i = 1; i <= a[0] / 2; i++){
			buf = a[i];
			a[i] = a[a[0]-i+1];
			a[a[0]-i+1] = buf;
		}
		for (i = 1; i <= b[0] / 2; i++){
			buf = b[i];
			b[i] = b[b[0]-i+1];
			b[b[0]-i+1] = buf;
		}
		n = (a[0] > b[0]) ? a[0] : b[0];
		for (i = 1; i <= n; i++){
			c[i+1] = (a[i]+b[i]+c[i])/2;
			c[i] = (a[i]+b[i]+c[i])%2;
		}
		c[0] = (c[n+1]) ? n+1 : n; 
		while ((!c[c[0]]) && (c[0] > 1))
			c[0]--;
		printf("%d ",t);
		for (i = c[0]; i > 0; i--)
			printf("%d",c[i]);
		printf("\n");
	}
	return 0;
}