/*******************************************************
 Problem: 3006 - Graphics
 Problem 4 - ACM ICPC - South Pacific Region - 2004/2005
 Solved by Andrey Grigorov
 *******************************************************/

#include <stdio.h>
#include <string.h>

char a[260];
bool out;

void readstring(char* s){
  int i;
  char c;
  i = 0;
  while ((c = getchar()) != '\n'){
    s[i] = c;
    i++;
  }
  s[i] = '\0';
}

void down(int i){
  if (i == -1)
    out = true;
  else
    switch(a[i]){
      case '1': a[i] = '4'; break;
      case '2': a[i] = '3'; break;
      case '3': a[i] = '2'; down(i-1); break;
      case '4': a[i] = '1'; down(i-1); break;
    }
}

void right(int i){
  if (i == -1)
    out = true;
  else
    switch(a[i]){
      case '1': a[i] = '2'; break;
      case '2': a[i] = '1'; right(i-1); break;
      case '3': a[i] = '4'; right(i-1); break;
      case '4': a[i] = '3'; break;
    }
}

void left(int i){
  if (i == -1)
    out = true;
  else
    switch(a[i]){
      case '1': a[i] = '2'; left(i-1); break;
      case '2': a[i] = '1'; break;
      case '3': a[i] = '4'; break;
      case '4': a[i] = '3'; left(i-1); break;
    }
}

void up(int i){
  if (i == -1)
    out = true;
  else
    switch(a[i]){
      case '1': a[i] = '4'; up(i-1); break;
      case '2': a[i] = '3'; up(i-1); break;
      case '3': a[i] = '2'; break;
      case '4': a[i] = '1'; break;
    }
}

int main(){
  char b[260];
  char end[] = "END";
  int i,lena,lenb;
  readstring(a);
  while (strcmp(a,end)){
    readstring(b);
    out = false;
    lena = strlen(a)-1;
    lenb = strlen(b)-1;
    for (i = 0; i<= lenb; i++)
      switch (b[i]){
        case 'D': down(lena); break;
        case 'R': right(lena); break; 
        case 'L': left(lena); break;
        case 'U': up(lena); break; 
    }
    if (out)
      printf("OUT\n");
    else{
      for (i = 0; i <= lena; i++)
        printf("%c",a[i]);
      printf("\n");
    }
    readstring(a);
  }
  return 0;
}