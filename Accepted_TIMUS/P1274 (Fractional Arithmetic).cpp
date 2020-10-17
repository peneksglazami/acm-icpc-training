/************************************************************************
 Problem: 1274 - Fractional Arithmetic
 2003-2004 ACM Central Region of Russia Quarterfinal Programming Contest
 Rybinsk, October 15-16, 2003
 Solved by Andrey Grigorov
 ************************************************************************/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>

const int maxn = 100;

typedef struct{
	bool sign;
	long int a,b,c;
} number;

void strtonum(char* st, number& num){
	char ss[maxn] = "$",s[maxn];
	int i,state; //1 - C; 2 - B; 3 - A; 4 - S
	strcat(ss,st);
	strcpy(st,ss);
	state = 1;
	i = strlen(st)-1;
	num.sign = false;
	s[0] = '\0';
	do{
		switch(state){
			case 1 : 
				if (isdigit(st[i])){
					ss[0] = st[i];
					ss[1] = '\0';
					strcat(ss,s);
					strcpy(s,ss);
					i--;
				}
				else
					switch (st[i]){
						case '-' : 
							state = 4; 
							num.sign = true; 
							num.a = atol(s);
							num.b = 0;
							num.c = 1;
							break;
						case '$' :
							state = 4;
							num.a = atol(s);
							num.b = 0;
							num.c = 1;
							break;
						case '/' :
							state = 2;
							num.c = atol(s);
							s[0] = '\0';
							i--;
							break;
					};
				break;
			case 2 : 
				if (isdigit(st[i])){
					ss[0] = st[i];
					ss[1] = '\0';
					strcat(ss,s);
					strcpy(s,ss);
					i--;
				}
				else
					switch (st[i]){
						case '-' : 
							state = 4; 
							num.sign = true; 
							num.a = 0;
							num.b = atol(s);
							break;
						case '$' :
							state = 4;
							num.a = 0;
							num.b = atol(s);
							break;
						case ' ' :
							state = 3;
							num.b = atol(s);
							s[0] = '\0';
							i--;
							break;
					};
				break;
			case 3 : 
				if (isdigit(st[i])){
					ss[0] = st[i];
					ss[1] = '\0';
					strcat(ss,s);
					strcpy(s,ss);
					i--;
				}
				else
					switch (st[i]){
						case '-' : 
							state = 4; 
							num.sign = true; 
							num.a = atol(s);
							break;
						case '$' :
							state = 4;
							num.a = atol(s);
							break;
					};
				break;
		}
	}while(state != 4);
}

long int gcd(long int a, long int b){
	long int nd;
	nd = b;
	while (a){
		nd = a;
		a = b % a;
		b = nd;
	}
	return nd;
}

long int lcm(long int a, long int b){
	return (a/gcd(a,b))*b;
}

void numtoab(number num, long int& a, long int& b){
	long int ab_gcd;
	a = num.a*num.c+num.b;
	b = num.c;
	ab_gcd = gcd(a,b);
	a = a / ab_gcd;
	b = b / ab_gcd;
	if (num.sign)
		a = -a;
}

void sum(number num1, number num2, number& num3){
	long int a1,b1,a2,b2,ar,br,ab_gcd,b_lcm;
	numtoab(num1,a1,b1);
	numtoab(num2,a2,b2);
	b_lcm = lcm(b1,b2);
	ar = a1*(b_lcm / b1)+a2*(b_lcm / b2);
	br = b_lcm;
	if (ar < 0){
		num3.sign = true;
		ar = -ar;
	}
	else
		num3.sign = false;
	ab_gcd = gcd(ar,br);
	ar = ar / ab_gcd;
	br = br / ab_gcd;
	num3.a = ar / br;
	num3.b = ar - num3.a*br;
	num3.c = br;
}

void sub(number num1, number num2, number& num3){
	long int a1,b1,a2,b2,ar,br,ab_gcd,b_lcm;
	numtoab(num1,a1,b1);
	numtoab(num2,a2,b2);
	b_lcm = lcm(b1,b2);
	ar = a1*(b_lcm / b1)-a2*(b_lcm / b2);
	br = b_lcm;
	if (ar < 0){
		num3.sign = true;
		ar = -ar;
	}
	else
		num3.sign = false;
	ab_gcd = gcd(ar,br);
	ar = ar / ab_gcd;
	br = br / ab_gcd;
	num3.a = ar / br;
	num3.b = ar - num3.a*br;
	num3.c = br;
}

void mult(number num1, number num2, number& num3){
	long int a1,b1,a2,b2,ar,br,ab_gcd,b_lcm;
	double a1f,a2f,arf;
	numtoab(num1,a1,b1);
	numtoab(num2,a2,b2);
	a1f = double(a1);
	a2f = double(a2);
	arf = a1*a2;
	br = b1*b2;
	if (arf < 0){
		num3.sign = true;
		arf = -arf;
	}
	else
		num3.sign = false; 
	num3.a = arf/br;
	arf = arf - num3.a*br;
	num3.b = arf;
	num3.c = br;
	ab_gcd = gcd(num3.b,num3.c);
	num3.b = num3.b / ab_gcd;
	num3.c = num3.c / ab_gcd;
}

void reversnum(number& num){
	long int a,b;
	a = num.a*num.c+num.b;
	b = num.c;
	num.a = 0;
	num.b = b;
	num.c = a;
}

void div(number num1, number num2, number& num3){
	long int a1,b1,a2,b2,ar,br,ab_gcd,b_lcm;
	reversnum(num2);
	mult(num1,num2,num3);
}

void printnum(number num){
	if (num.sign)
		printf("-");
	if (num.a != 0){
		printf("%ld",num.a);
		if (num.b != 0)
			printf(" ");
	}
	else
		if (num.b == 0)
			printf("%ld",num.a);
	if (num.b != 0)
		printf("%ld/%ld",num.b,num.c);
}

int main(){
	char op[2],st[maxn];
	number num1,num2,res;
	gets(st);
	strtonum(st,num1);
	gets(op);
	gets(st);
	strtonum(st,num2);
	switch (op[0]){
		case '+' : sum(num1,num2,res); break;
		case '-' : sub(num1,num2,res); break;
        	case '*' : mult(num1,num2,res); break;
		case '/' : div(num1,num2,res); break;
	}
	printnum(res);
	return 0;
}