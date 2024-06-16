
module tb;
  reg [3:0] a,b,S,cout;
  reg cin;
  
  
  ripadder uut(.a(a),.b(b),.cin(cin),.S(S),.cout(cout));
  
  initial
    begin
$dumpfile("dump.vcd"); 
      $dumpvars(5,tb);
      a[3:0]=4'b0111;
      b[3:0]=4'b0101;
      cin=1;
      #50 $finish;
    end
endmodule