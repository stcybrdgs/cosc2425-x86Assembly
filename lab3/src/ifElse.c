/*******************************************************************************
Programmer:     Stacy Bridges
Course:         COSC2425-002: PC Architecture and Machine Language
Assignment:     cosc2425_lab3
Completed :     10/07/2014
Status    :     Complete

Description:    This program prints compares A to B and 
		prints "false" to indicate A !> B;
*******************************************************************************/
#include<stdio.h>

int A = 5;
int B = 10;

int main( int argc, char **argv){
	if (A > B)
		printf("true\n");
	else
		printf("false\n");
}
