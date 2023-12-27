/*
 ============================================================================
 Name        : main.c
 Author      : 
 Version     :
 Copyright   : Your copyright notice
 Description : Hello RISC-V World in C
 ============================================================================
 */

#include <stdint.h>
#include <unistd.h>
#include <stdio.h>
#include <platform.h>

#define STRBUF_SIZE			256	// String buffer size


int main(void)
{

	while(1)
	{
		printf("Hello World!\n");
	}
	return 0;
}
