module mealy110110(clk,rst,in,out,prtstate,nxtstate);
 input clk,rst,in;
 output reg out;
  output reg [2:0] prtstate,nxtstate;
 //encoding of states
 parameter idle=3'b000,st1=3'b001,st11=3'b010,st110=3'b011,st1101=3'b100,st11011=3'b101;
//always block for state register
 always @(posedge clk )
 begin
      if(rst)
      begin 
       prtstate <= idle;
       out <= 0;
       end
       else
       prtstate <= nxtstate ;
    end
 //always block for next state decoder and output decoder 
  always @(prtstate , in )
    begin 
      case(prtstate)
         idle:if(in)
           begin
           nxtstate<=st1;
           out<=0;
           end
           else
           begin
           nxtstate<=idle;
           out<=0;
           end
       st1:if(in)
           begin 
           nxtstate <= st11;
           out <= 0;
           end 
           else 
           begin
           nxtstate <= idle;
           out <= 0;
           end
      st11: if(in)
            begin
            nxtstate <= st11;
            out<=0;
            end 
            else 
            begin
            nxtstate <= st110; 
            out<=0;
            end
      st110:if(in)
            begin
            nxtstate <= st1101;
            out <= 0;
            end 
            else 
            begin 
            nxtstate <= idle;
            out <= 0;
            end
      st1101:if(in)
            begin
            nxtstate <= st11011;
            out <= 0;
            end 
            else 
            begin 
            nxtstate <= idle;
            out <= 0;
            end
     st11011:if(in)
            begin
            nxtstate <= st11;
            out <= 0;
            end 
            else 
            begin 
            nxtstate <= st110;
            out <= 1;
            end
      default:begin 
      nxtstate = idle;
      out = 0;
      end
    endcase
  end      
endmodule

//testbench

module seq110110_tb;
 reg clk,rst,in;
 wire out;
  wire [2:0] prtstate,nxtstate;
  mealy110110 dut(clk,rst,in,out,prtstate,nxtstate
 );
 initial 
   begin
     $dumpvars(6,seq110110_tb);
   $dumpfile("dump.vcd"); 
 clk=0; rst=1;
   #5 rst=0;  
  in=1;
 #10 in=1;
 #10 in=0;
 #10 in=1;
 #10 in=1;
 #10 in=0;
 #10 in=1;
 #10 in=1;
 #10 in=0;
 #10 in=1;
 #120 $finish;
 end
  initial
    forever #5 clk=~clk;
endmodule