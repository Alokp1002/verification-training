class parent;
  int a=3;
  
  function void d1();
    $display("parent d1");
  endfunction
 
virtual function void d2();
    $display("parent d2");
  endfunction
  
endclass

class child extends parent;
  int a=9,b=8;
  
  function void d1();
    $display("child d1");
  endfunction
  function void d2();
    $display("child d2");
  endfunction
endclass

module tb;
  parent p; child c;
  initial begin
    c=new();
    p=c;//polymorphism occur
    p.d1;p.d2;
    $display("a=%0d a=%0d",p.a,c.a);
    c.a=12;
    $display("a=%0d a=%0d",p.a,c.a);
    
  end 
endmodule