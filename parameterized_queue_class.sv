class queue #(type datatype = bit[3:0]);
  
  datatype queue[];
  int size;
  int wr_ptr, rd_ptr;
  
  function new (int size);
    this.size = size;
    this.queue = new[size];
    this.wr_ptr = 0;
    this.rd_ptr = 0;    
  endfunction
  
  function void push(datatype element);       
      queue[wr_ptr] = element;
    wr_ptr = {(wr_ptr + 1)} % size;
  endfunction
  
  function datatype pop();    
    datatype value;   	
    value = queue[rd_ptr];
    rd_ptr = {(rd_ptr + 1)} % size;
    return value;    
  endfunction  
endclass

module tb();
  
  queue#(int) q1;
  queue#(real) q2;
  queue#(string) q3;
  
  initial begin    
    q1 = new(3);    
    q1.push(10);
    q1.push(20);
    q1.push(25);
    q1.push(15);
    
    $display("Element popped : %0d", q1.pop());
    $display("Element popped : %0d", q1.pop());
    $display("Element popped : %0d", q1.pop());
    $display("Element popped : %0d", q1.pop());
    
    $display("-------------------------------");    
    
    q2 = new(3);
    
    q2.push(1.9);
    q2.push(8.7);
    q2.push(2.4);
  
    $display("Element popped : %0f", q2.pop());
    $display("Element popped : %0f", q2.pop());
    $display("Element popped : %0f", q2.pop()); 
    $display("-------------------------------");
   
    q3 = new(2);
    q3.push("Alok");
    q3.push("Shyamu");
    
    $display("Element popped : %s", q3.pop());
    $display("Element popped : %s", q3.pop()); 
    $finish;
  end  
endmodule
  