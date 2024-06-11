
module dlatch( input en,reset,d, output reg q);
  
  always @(*)
    begin
    if(reset)
      q<=1'b0;
  else if (en)
       q<=d;
  end
endmodule
//tb
module tb;
  reg en,reset,d;
  wire q;
  dlatch uut(.d(d),.en(en),.reset(reset),.q(q));
  initial
    begin
       $dumpfile("dump.vcd"); 
      $dumpvars(1,tb);
      en=1;reset=0;d=0;
      #10 d=1;
      #10 d=0;
       #10 d=1;
      #10 reset=1;
      #10
     #70 $finish;
    end
endmodule