#include "screen.h"


void print_char(int col, int row, char character, char attribyte_byte)
{
    if(!attribyte_byte){
        attribyte_byte = WHITE_ON_BLACK;
    }

    unsigned char* vidmem = (unsigned char *) VIDEO_ADDRESS;
    int position = ((row - 1) * 80 + (col - 1)) * 2;
    vidmem[position] = character;
    vidmem[position + 1] = attribyte_byte;
}

void print_string(int col, int row, char* string, char attribyte_byte)
{
    int i = 0;
    while(string[i])
    {
        print_char(col, row, string[i], attribyte_byte);
        i++;
        col++;
    }
}