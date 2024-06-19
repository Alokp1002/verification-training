class alok;
  static int a;
  int b;
  
  task increment;
    a++;
    b++;
  endtask
endclass

module tb;
alok a1,a2,a3;
initial 
  begin
    a1=new();
    a2=new();
    a3=new();
    a1.increment;
    $display("a=%0d,b=%0d",a1.a,a1.b);
    a2.increment;
    $display("a=%0d,b=%0d",a2.a,a2.b);
    a3.increment;
    $display("a=%0d,b=%0d",a3.a,a3.b);
    a2.a=7;a2.b=3;
    $display("a=%0d,b=%0d",a1.a,a1.b);
    $display("a=%0d,b=%0d",a2.a,a2.b);
    $display("a=%0d",alok::a);
  end
endmodule