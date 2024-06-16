module associative;
  int a[string]='{"jan":1,"feb":2,"alok":3,"march":4};
string index;
initial
  begin
    $display("size is %d",a.size());
    $display(a.exists("alok"));
     a.first(index);
    $display("element at first index is %d", a[index]);
    while(a.next(index))
      $display("%s %d",index,a[index]);
    
  end
endmodule