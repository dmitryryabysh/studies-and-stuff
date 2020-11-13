#include <stdio.h>
const char CERC[] = {"oooooooooooooooooooooooooooooo\n
                      oooooooooooooooooooooooooooooo\n
                      oooooooooooooooooooooooooooooo\n
                      oooooooooooooooooooooooooooooo\n
                      oooooooooooooooooooooooooooooo\n
                      oooooooooooooooooooooooooooooo\n
                      oooooooooooooooooooooooooooooo\n
                      oooooooooooooooooooooooooooooo\n
                      oooooooooooooooooooooooooooooo\n
                      oooooooooooooooooooooooooooooo\n"
};

void main(){
  int y, x, cycle=0;
  while (cycle!=1){
    //for(y=0;y<10;y++){
    //  for(x=0;x<30;x++){
    //    printf ("o");
    //  }
    //  printf ("\n");
    //}

    puts (CERC);
    cycle++;
  }

}
