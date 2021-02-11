#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include "time.h"
#include "assert.h"

#include "pgcd.h"

#define MAX_RAND 65535
#define MIN_RAND 0 

int RandA(void){
	int A = (rand() % (MAX_RAND + 1 - MIN_RAND)) + MIN_RAND;
	assert((A <= MAX_RAND) & (A >= MIN_RAND));	//check if A is in range
    return A;
}

int RandB(void){
	int B = (rand() % (MAX_RAND + 1 - MIN_RAND)) + MIN_RAND;;
	assert((B <= MAX_RAND) & (B >= MIN_RAND));	//check if B is in range
    return B;
}

int main (int argc, char * argv []){
	int A, B, i;
	if (argc < 2){
		printf("Entrez un nombre de test\n");
		return -1;
	}
	int nombre = atoi(argv[1]);
	printf("(II) Starting PGCD program\n");
	srand(time(NULL));
	for (i = 0 ; i < nombre ; i++){
		A = RandA();
		B = RandB();
		printf("-- test %d\n",i);
		printf("idata_a <= std_logic_vector(to_unsigned(%d, 32));\n",A);
		printf("idata_b <= std_logic_vector(to_unsigned(%d, 32));\n",B);
		printf("idata_en <= '1';\nwait for 10 ns;\nwhile odata_en = '0' loop\n\tidata_en <= '0';\n\twait for 10 ns;\nend loop;\n");
		printf("ASSERT UNSIGNED(odata) = TO_UNSIGNED( %d, 32) SEVERITY ERROR;\n",PGCD(A,B));
		printf("\n");
	}

	printf("(II) End of PGCD program\n");
 	return 0;
}
