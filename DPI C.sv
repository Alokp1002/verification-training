//tb
import "DPI-C" context function int sum(int a,int b);
  export "DPI-C" function sub;
  
  int sumation;
  
  initial begin
    
    $display("Hello world!! In SV right now");
    sumation = sum(2,6);
    $display("Returned Value by C = %0d",sumation);
    
  end
  
  function int sub(int c,int d);
   int y;
    y = c-d;
    return y;    
  endfunction
  
endmodule


//c
#include <stdio.h>
#include <svdpi.h>

extern "C" int sub(int c,int d);

extern "C" int sum(int a,int b) {
  int x=a+b;
  printf("Hello world!\n");
  
  printf("In C Right Now\n");
  
  int R;
  R = sub(8,2);
  printf("Returned value by SV : %0d\n",R);
  
  return x;  
}

