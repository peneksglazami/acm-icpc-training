/*******************************
 Problem: 424 - Integer Inquiry
 Solved by Andrey Grigorov
 *******************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const int Osn = 10; 
const int MaxN = 105;

typedef long int TLong[MaxN+1];

void Sum(TLong& A, TLong& B, TLong& C){
	int i,N;
	for (i = 1; i <= MaxN; i++)
		C[i] = 0;
	N = (A[0] > B[0]) ? A[0] : B[0];
	for (i = 1; i <= N; i++){
		C[i+1] = (A[i]+B[i]+C[i])/Osn;
		C[i] = (A[i]+B[i]+C[i])%Osn;
	}
	C[0] = (C[N+1] > 0) ? N+1 : N;
}

void StrToLong(char* st, TLong& A){
	unsigned int i,j;
	for (i = 0; i <= MaxN; i++)
		A[i] = 0;
	for (i = 0; i <= strlen(st)-1; i++){
		for (j = A[0]; j >= 1; j--){
			A[j+1] = A[j+1]+(10*A[j])/Osn;
			A[j] = (10*A[j])%Osn;
		}
		A[1] = A[1]+st[i]-'0';
		if (A[A[0]+1] > 0)
			A[0]++;
	}
}

int main(){
	TLong A,B,S;
	char st[101],zero[] = "0";
	int i;
	for (i = 1; i <= MaxN; i++)
		S[i] = 0;
	S[0] = 1;
	scanf("%s",&st);
	while (strcmp(st,zero)){
		StrToLong(st,A);
		for (i = 0; i <= MaxN; i++)
			B[i] = S[i];
		Sum(A,B,S);
		scanf("%s",&st);
	}
	for (i = S[0]; i >= 1; i--)
		printf("%d",S[i]);
	return 0;
}