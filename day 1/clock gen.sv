
module clkgen();
  reg clk;
  real freq=500;//500MHz
  real tp =1/(freq*1e6)*1e9;
  initial begin
      clk=1'b0;
       $dumpfile("dump.vcd");
    $dumpvars(1,clkgen);
      #(tp*5) $finish;
  end
  always  #(tp/2) clk=~clk;
endmodule
      