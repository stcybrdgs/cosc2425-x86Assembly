/*******************************************************************************
Programmer:     Stacy Bridges
Course:         COSC2425-002: PC Architecture and Machine Language
Assignment:     cosc2425_lab3
Completed :     10/07/2014
Status    :     Complete

Description:    This program uses a while loop to print a message;
*******************************************************************************/
#include<stdio.h>

int main(int argc, char **argv) 
{
	int num = 1;
    while(num != 0)
    {
        printf("And a One\n");
        printf("And a Two\n");
		num = 0;
    }
}
