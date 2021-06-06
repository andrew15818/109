#include "libmini.c"
static jmp_buf buf;
void second(){
    write(1, "second\n", 7);
    longjmp(buf, 1);
}
void first(){
    second();
    write(1, "first\n", 6);
}
int main(){
    if(!setjmp(buf)){
        first();
    }
    else{
        write(1, "main\n", 5);
    }
    return 0;
}