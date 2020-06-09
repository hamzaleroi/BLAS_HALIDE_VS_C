#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#define X 5
#define Y 5
#define L 5

void main(){
  int A[X][Y],B[X][Y],C[X][Y];

  //initialization
  int i=0,j=0;
  for(i=0;i<X;i++){
    for(j=0;j<Y;j++){
      A[i][j] = i+j;
    } 
  }
  for(i=0;i<X;i++){
    for(j=0;j<Y;j++){
      B[i][j] = i+2*j;
    } 
  }
  for(i=0;i<X;i++){
    for(j=0;j<Y;j++){
      C[i][j] = 0;
    } 
  }


  


  //calculating the product
  clock_t start = clock();
  int k=0;
  for(i=0;i<X;i++){
    for(j=0;j<Y;j++){
        C[i][j] = L*A[i][j]+ B[i][j];
    } 
  }
  clock_t duration = clock() - start;

  
  //printing the results


  for(i=0;i<X;i++){
    for(j=0;j<Y;j++){
      printf("%d ",C[i][j]);
    } 
    printf("\n");
  }

  printf("\n    the execution took %ld ticks ~ %f s\n\n", duration,(double)duration/CLOCKS_PER_SEC);



}