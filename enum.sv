module enum_test;
  typedef enum {red=1,blue,green=0,orange=7}  color_e;
  color_e alok;
  initial
    begin
      alok=alok.first;
      do
        begin
          $display("color=%d %s",alok,alok.name);
          alok=alok.next;
        end
      while(alok != alok.first);
    end
endmodule


          