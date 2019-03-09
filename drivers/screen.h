#define VIDEO_ADDRESS 0xb8000
#define MAX_ROWS 25
#define MAX_COLS 80
#define WHITE_ON_BLACK 0x0f

#define REG_SCREEN_CTRL 0x3d4
#define REG_SCREEN_DATA 0x3d5


void print_char(int col, int row, char character, char attribyte_byte);
void print_string(int col, int row, char* string, char attribyte_byte);

// void print_char(char character, int col, int row, char attribute_byte)
// {
//     unsigned char *vidmem = (unsigned char *) VIDEO_ADDRESS;

//     // If attribute byte is sero, assume the default style
//     if(!attribute_byte)
//         attribute_byte = WHITE_ON_BLACK;


//     int offset;
//     // If col and row are non-negative. use them for offset
//     if(col >= 0 && row >= 0)
//         offset = get_screen_offset(col, row);
//     else 
//         offset = get_cursor();
    

//     if(character == '\n'){
//         int rows = offset / (2 * MAX_COLS);
//         offset = get_screen_offset(79, rows);   
//     }
//     else{
//         vidmem[offset] = character;
//         vidmem[offset + 1] = attribute_byte; 
//     }

//     offset += 2;

//     offset = handle_scrolling(offset);

//     set_cursor(offset);
// }