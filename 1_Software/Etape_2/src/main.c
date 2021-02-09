#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include "time.h"
#include "assert.h"

#define MAX_RAND 65535
#define MIN_RAND 0 

int PGCD(int A, int B)
{
	while(A != B){
		if (A > B){
			A = A - B;
		} else {
			B = B - A;
		}
	}
	return A;
}

int RandA(void){
	int A = (rand() % (MAX_RAND - MIN_RAND)) + MIN_RAND;
	assert((A <= 65535) & (A >= 0));	//check if A is in range
    return A;
}

int RandB(void){
	int B = (rand() % (MAX_RAND - MIN_RAND)) + MIN_RAND;
	assert((B <= 65535) & (B >= 0));	//check if B is in range
    return B;
}

int main (int argc, char * argv []){
	int A,B;
	srand(time(NULL));

	printf("(II) Starting PGCD program\n");

	for(int i = 0 ; i < 20 ; i++){
		A = RandA();
		B = RandB();
		printf("%d \t PGCD(%d, %d) = %d\n", i, A, B,PGCD(A, B));
	}
	
	printf("(II) End of PGCD program\n");
  	return 0;
}
