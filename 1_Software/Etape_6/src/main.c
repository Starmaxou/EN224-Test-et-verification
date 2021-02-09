#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include "assert.h"

#include "pgcd.h"

int main (int argc, char * argv []){
	printf("(II) Starting PGCD program\n");

	assert(PGCD(1024,800)==32);
	
	assert(PGCD(32767,65535)==1);
	
	assert(PGCD(512,2048)==512);
	
	assert(PGCD(458,6272)==2);

	printf("(II) End of PGCD program\n");
 	return 0;
}
