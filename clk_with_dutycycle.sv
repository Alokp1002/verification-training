module clk_gen;
  reg clk;
  parameter f=1000,dc=200;//30 in %
  real freq=f;  //in MHz
  real tp=1/(freq*1e3)*1e9; //convert in ns
  real duty_cycle=dc;
  real time_duration=duty_cycle*tp/100;
  always
    begin
      $dumpfile("dump.vcd"); 
      $dumpvars;
      clk=1'b0;
      if(time_duration>tp)
        $display("error");
      else
        $display("no error");
      #(tp*5) $finish;
    end
  always 
    begin
      #(tp-time_duration) clk=1'b1;
      #(time_duration) clk=1'b0;
    end
  
      endmodule
      