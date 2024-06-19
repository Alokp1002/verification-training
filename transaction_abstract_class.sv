virtual class transaction; 
  bit [7:0] header;
  bit [15:0] payload;
  bit parity;
  
  pure virtual function void print_packets();
  pure virtual function void display_payload();
  pure virtual function bit calculate_parity();
  pure virtual function void display_parity();    
endclass
    
class large_packet extends transaction;
  bit [7:0] header;
  bit [31:0] payload;
  bit parity;
  
  function new ( bit[7:0] header, bit[31:0] payload);
    
    this.header = header;
    this.payload = payload;
    this.parity = calculate_parity();    
  endfunction
  
  function void print_packets();    
    $display("Large packet : Header = %0h, Payload = %0h, parity = %b", this.header, this.payload, this.parity);    
  endfunction
    
  function void display_payload();
    $display("Payload = %0h", this.payload);   
  endfunction;
    
  function bit calculate_parity();    
    return ^ this.payload;    
  endfunction

  function void display_parity();    
    $display("Parity = %b", this.parity);    
  endfunction
endclass
    
class small_packet extends transaction;  
  function new (bit[2:0] header, bit[7:0] payload);
    bit [2:0] header;
    bit [7:0] payload;
    bit parity;
  
    this.header = header;
    this.payload = payload;
    this.parity = calculate_parity();    
  endfunction
  
  function void print_packets();    
    $display("Small Packet : header = %0h, Payload = %0h, parity = %b", this.header, this.payload, this.parity);    
  endfunction
  
  function void display_payload();    
    $display("Payload = %0h", this.payload);    
  endfunction
  
  function bit calculate_parity();    
    return ^this.payload;    
  endfunction
  
  function void display_parity();    
    $display("Parity = %b", this.parity);    
  endfunction
endclass
    
class corrupted_packet extends transaction;  
  function new (bit[7:0] header, bit[15:0] payload);
     bit [7:0] header;
     bit [15:0] payload;
     bit parity;
  
    this.header = header;
    this.payload = payload;
    this.parity = calculate_parity();    
  endfunction
  
  
  function void print_packets();    
    $display("Corrupted Packet : Header = %0h, Payload = %0h, Parity = %b", this.header, this.payload, this.parity);    
  endfunction
  
  function void display_payload();    
    $display("Payload = %0h ", this.payload);    
  endfunction
  
  function bit calculate_parity();    
    return ^this.payload;    
  endfunction
  
  function void display_parity();    
    $display("Parity = %b",this.parity);    
  endfunction  
endclass
    
    
module tb();  
  
  function void send_packet(transaction t);
    t.print_packets();
    t.display_payload();
    t.display_parity();    
  endfunction
  
  large_packet l1;
  small_packet s1;
  corrupted_packet c1;
  
  initial begin    
    l1 = new(8'h30,32'h15000);
    s1 = new(3'h5,8'h40);
    c1 = new(8'h96,16'h500);
    
    send_packet(l1);
    $display("--------------------------------------");
    send_packet(s1);
    $display("--------------------------------------");
    send_packet(c1);    
    $finish;
  end   
endmodule
    
    
  