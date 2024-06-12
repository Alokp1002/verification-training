module sync_fifo #(parameter WIDTH = 8, DEPTH = 8)(
  
  input clk, rst_n,wr_en,rd_en,
  input [WIDTH - 1 : 0]data_in,
  output full,empty,
  output reg [WIDTH - 1 : 0]data_out
);
  
  parameter PTR_WIDTH = $clog2(DEPTH);
  reg [WIDTH -1 : 0] memory [0 : DEPTH-1];
  reg [PTR_WIDTH : 0] rd_ptr, wr_ptr; // width of the ptrs are 1 bit more in order to track the full and empty conditions, MSB will tell us about FULL and Empty
  wire wrap_around ;
  always @(posedge clk) begin
    
    if(!rst_n) begin   
      rd_ptr <= 0;
      wr_ptr <= 0;
      //data_out <= 0;    
    end  
  end
  
  //write condition 
  
  always @(posedge clk) begin    
    if ( wr_en & !full) begin    
      memory [ wr_ptr[PTR_WIDTH - 1 : 0]] <= data_in;
      wr_ptr <= wr_ptr + 1'b1;
            
    end 
  end
  
  //read condition
  
  always @(posedge clk) begin  
    if( rd_en & !empty) begin     
      data_out <= memory [ rd_ptr [ PTR_WIDTH - 1 : 0]];
      rd_ptr <= rd_ptr + 1'b1;      
    end  
  end

  assign wrap_around = wr_ptr[PTR_WIDTH] ^ rd_ptr[PTR_WIDTH]; //if the msb is same then there is no wrap around if msb is diff then there is wrap around condition we used xor to check it

  //assign data_out = memory [ rd_ptr [ PTR_WIDTH - 1 : 0]];

  assign full = (wrap_around) && (rd_ptr[PTR_WIDTH - 1 : 0] == wr_ptr[PTR_WIDTH - 1 : 0]);
  assign empty = (rd_ptr == wr_ptr);
  
endmodule



module syn_fifo_tb();
  reg clk, rst_n;
  reg wr_en, rd_en;
  reg [7:0] data_in;
  wire [7:0] data_out;
  wire full,empty;
  
  //instantiation
  sync_fifo uut(.clk(clk),.rst_n(rst_n),.wr_en(wr_en),.rd_en(rd_en),.data_in(data_in),.data_out(data_out),.full(full),.empty(empty));
  
  //clock generation
  initial
  forever #5 clk = ~clk;
 
  initial 
  begin
    $dumpfile("dump.vcd");      $dumpvars(8,syn_fifo_tb);
    clk = 0; rst_n = 0;
    wr_en = 0; rd_en = 0;
    #15 rst_n = 1;
     wr_en = 1;
     
     //giving data input for verification
    data_in = 8'b01110111;
    #10
    data_in = 8'b00011011;
    #10
    data_in = 8'b01011011;
    #10
    data_in = 8'b00011001;
    #10
    data_in = 8'b10011000;
    #10
    data_in = 8'b10011011;
    #10
    data_in = 8'b11011010;
    #10
    data_in = 8'b00111100;
    #10 rd_en=1;
    #200 $finish();
    end
endmodule
  