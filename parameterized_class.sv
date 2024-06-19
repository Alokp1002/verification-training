class alok #(number=10, type dtype=int);
  dtype arr[number];
 
  function void randomiz();
    foreach(arr[i])
      arr[i]=$urandom%20;
  endfunction
  
  function void display();
    foreach(arr[i])
      $display("arr[%0d]=%0d",i,arr[i]);
  endfunction
endclass

module tb;
  alok #(5)h1;
  alok #(,bit[3:0])h2;
  alok #(3,bit)h3;

initial begin
  h1=new(); h2=new(); h3=new();
  h1.display();
  h1.randomiz();
  h1.display();
  h2.randomiz();
  h2.display();
  h3.randomiz();
  h3.display();
end
endmodule