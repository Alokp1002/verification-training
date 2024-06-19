class A;  
  function print();   
    $display("class A");    
  endfunction
endclass:A

class B extends A;  
  function print();         
    $display("class B");
    super.print();
  endfunction    
endclass:B

class C extends B;  
  function print(); 
    $display("class C");
    super.print();//super.super.print() doesnot exist. 
  endfunction  
endclass:C

module tb();  
  C c;  
  initial begin 
  c = new();
  c.print();   
  end  
endmodule

/*class A;
function print();   
    $display("class A");    
  endfunction
endclass:A

class B extends A;          
    super.print();    
endclass:B

class C extends B;    
    super.super.print();//super.super.print() doesnot exist.   
endclass:C*/