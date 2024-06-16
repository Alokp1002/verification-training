module tb;
  int dy1[]='{5,6,7,8};
initial
  begin
    repeat(2)
      if(dy1.size!=0)
        begin
          foreach(dy1[i])
            $display("dy1[%d]=%d",i,dy1[i]);
          dy1.delete;
        end  
      else 
  $display("empty");
  end
endmodule