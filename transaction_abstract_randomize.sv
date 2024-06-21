virtual class transaction; 
 rand bit [7:0] header;
 rand bit [15:0] payload;
  bit parity;
  
  pure virtual function void print_packets();
  pure virtual function void display_payload();
  pure virtual function void display_parity();          
    constraint data_payload {payload<1500;}  
        
    function void post_randomize();      
      this.parity = ^this.payload;      
    endfunction
endclass
    
class large_packet extends transaction;
  
  function void print_packets();    
    $display("Large packet : Header = %0h, Payload = %0h, parity = %b", this.header, this.payload, this.parity);    
  endfunction
    
  function void display_payload();
    $display("Payload = %0h", this.payload);   
  endfunction;

  function void display_parity();    
    $display("Parity = %b", this.parity);    
  endfunction
endclass
    
class small_packet extends transaction;  
  
  function void print_packets();    
    $display("Small Packet : header = %0h, Payload = %0h, parity = %b", this.header, this.payload, this.parity);    
  endfunction
  
  function void display_payload();    
    $display("Payload = %0h", this.payload);    
  endfunction
  
  function void display_parity();    
    $display("Parity = %b", this.parity);    
  endfunction
endclass
    
class corrupted_packet extends transaction;  
  
  function void print_packets();    
    $display("Corrupted Packet : Header = %0h, Payload = %0h, Parity = %b", this.header, this.payload, this.parity);    
  endfunction
  
  function void display_payload();    
    $display("Payload = %0h ", this.payload);  
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
    l1 = new();
    s1 = new();
    c1 = new();
    
    for( int i = 0 ; i<2 ; i++) begin      
      l1.randomize();
      send_packet(l1);	      
    end
    $display("--------------------------------------");
    for( int i = 0 ; i<2 ; i++) begin      
      s1.randomize() with {payload>1200;payload<1202;};
      send_packet(s1);	      
    end  
    $display("--------------------------------------");
    for( int i = 0 ; i<2 ; i++) begin      
      c1.randomize() with {payload > 900;payload < 1000;};
      send_packet(c1);	      
    end   
    $finish;
  end   
endmodule
    
    
  
