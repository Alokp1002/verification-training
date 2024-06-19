class sample;
  randc bit[3:0] num;
endclass

class main;
  rand sample sm1;
  sample sm2;
  function new();
    sm1=new();sm2=new();
  endfunction
endclass

program test;
  main m;
  initial begin
    m=new();
    repeat(10) begin
      assert(m.randomize());
      $display(m.sm1.num);end
    repeat(10) begin
      assert(m.randomize());
        $display(m.sm2.num);
    end 
  end
endprogram
