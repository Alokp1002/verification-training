
module ripadder(
  input [3:0] a,b,
  input cin,
  output [3:0] S,cout);
  
  adder abx(.x(a[0]),.y(b[0]),.zin(cin),.zout(cout[0]),.s(S[0]));
  adder abc(.x(a[1]),.y(b[1]),.zin(cout[0]),.zout(cout[1]),.s(S[1]));
  adder abd(.x(a[2]),.y(b[2]),.zin(cout[1]),.zout(cout[2]),.s(S[2]));
  adder abf(.x(a[3]),.y(b[3]),.zin(cout[2]),.zout(cout[3]),.s(S[3]));
endmodule

module adder(input x,y,zin, output s,zout);
  assign s=x^y^zin;
  assign zout = x&y|y&zin|zin&x;
endmodule

// testbench

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