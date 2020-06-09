#include "Halide.h"
#include <stdio.h>
#include<time.h>
#define X 5
#define Y 5
#define L 5

int main() {

    //defining variables
    Halide::Func addition("addition");
    Halide::Var x, y, l;
    int A_[X][Y],B_[X][Y];
        int i,j;


  //initialization
  for(i=0;i<X;i++){
    for(j=0;j<Y;j++){
      A_[i][j] = i+j;
    } 
  }
  for(i=0;i<X;i++){
    for(j=0;j<Y;j++){
      B_[i][j] = i+2*j;
    } 
  }

    Halide::Buffer<int32_t> A(A_),B(B_);
    addition(x,y) =  A(y,x) * L  + B(y,x);


    
    //execution
    clock_t start= clock();
    Halide::Buffer<int32_t> C = addition.realize(X,Y);
    clock_t duration = clock() - start;

    
    //printing the results

    for(i=0;i<X;i++){
        for(j=0;j<Y;j++){
        printf("%d ",C(i,j));
        }
        printf("\n");
    }

    printf("\n    the execution took %ld ticks ~ %f s\n\n", duration,(double)duration/CLOCKS_PER_SEC);

    return 0;
}
