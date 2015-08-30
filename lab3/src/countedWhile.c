/*******************************************************************************
Programmer:     Stacy Bridges
Course:         COSC2425-002: PC Architecture and Machine Language
Assignment:     cosc2425_lab3
Completed :     10/07/2014
Status    :     Complete

Description:    This program uses a for loop to count to 5;
*******************************************************************************/
#include<stdio.h>

int main(int argc, char **argv) 
{
    int count = 0;
    while(count != 5)
    {
        printf("counting\n");
		count ++;
    }
}

