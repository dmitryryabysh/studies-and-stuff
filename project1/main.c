
#include <stdio.h>
#include <unistd.h>
unsigned int sleep (unsigned int sec);

int main(){
  unsigned int hour=0,
               sec=0,
               min=0,
               min1=0;
  for(;sec<61;sec++){
    min1=(min*100)/60;
    if(sec==60){
      sec=0;
      min++;
      if(min==60){
        min=0;
        min1=0;
        hour++;
        if(hour==24){
          hour=0;
        }
      }
    }
  printf("%d:%d:%d\r", hour, min1, sec);
  sleep(1);
  }
}
