class parent;
  int a,b;
 task display;
   $display("parent class and a=%0d , b=%0d",a,b);
  endtask
endclass

class child extends parent;  
 //int a;
   task display;
     $display("child class and a=%0d",a);
     $display(super.b);
     super.display;
  endtask
endclass

module tb;
  parent p;
  child c;
  initial
    begin
      p=new(); c=new();
      c.a=8; c.b=20;                  p.a=2;p.b=1;
      p.display;
      c.display;
  
      c.a=3; p.a=5;
      p.display;
      c.display;
    end
endmodule