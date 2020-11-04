#include <stdio.h>
#include <conio.h>

void main(){
  FILE *ass;
  ass=fopen("D:\\github\\SUPER_PROGRAM\\hach.txt", "w");
  int y, x;
  for(y=0;y<40;y++){
    for(x=0;x<30;x++){
     if(y==0||y==39){
      fprintf (ass, "o");
      fprintf (ass, " ");
     }else{
      if(x==0||x==29){
        fprintf (ass, "o");
      }else if((x>3&x<27)&(y>2&y<37)&(x==14||x==15||y==10||y==11)){
        fprintf (ass, "x");
      }else fprintf (ass, " "); fprintf (ass, " ");
     }
    }
    fprintf (ass, "\n");
  }
  fclose(ass);
  printf("Я ебал рэп");
}
