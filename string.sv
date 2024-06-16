module string_opr;
  string s1="12_3xyz",s2="alok",s3="Alok";
  int a,b,c;
  initial
    begin
      $display("length of s1 is %d",s1.len());
      s2.putc(3,"S");
      $display(s2);
      $display(s1.getc(0));
      
      $display(s2.toupper());
      $display(s2.substr(1,3));
       a=s1.atoi();
      $display("a=%d",a);
      b=s3.compare("alok");
      $display("b=%d",b);
      c=s3.icompare("Alok");
      $display("c=%d",c);
      $display(s2==s3);
      
    end
endmodule