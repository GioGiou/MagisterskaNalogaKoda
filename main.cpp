//
// Created by Jani on 5. 07. 2024.
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <stdio.h>
#include <stdint.h>

int main(){

    puts("Zacetek\n");

    float start = (float)clock()/CLOCKS_PER_SEC;
    uint64_t i;
    for(i =0; i<1000000000;i++){
    }
    float end = (float)clock()/CLOCKS_PER_SEC;
    float deltaT = end-start;

    puts("Konec\n");
    printf("Time: %fs\nIterations: %d\n",deltaT,i);

    return 0;
}