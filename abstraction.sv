virtual class abstract;
  
  pure virtual task display;
    
    virtual function int inc(int a);
    return a+1;
  endfunction
    
  endclass

    class abc extends abstract;
      task display;
        //display must to define coz of pure virtual
        $display("abc");
      endtask
      
      function int inc(int b);
        //may or may not be defined
        return b+2;
      endfunction
    endclass
    
    class xyz extends abstract;
      task display;
        //display must to define coz of pure virtual
        $display("xyz");
      endtask
    endclass
    
    module tb;
      abstract abs;
      abc ab;
      xyz x;
      initial begin 
        //abs=new(); error
        ab=new(); x=new();
        ab.display; x.display;
        $display("%0d",ab.inc(2));
        $display("%0d",x.inc(5));
        abs=x; abs.display;
        $display("%0d",abs.inc(8));
        abs=ab;abs.display;
        $display("%0d",abs.inc(8));
      end
    endmodule