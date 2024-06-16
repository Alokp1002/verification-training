module que;
  string q1[$]='{"alok","ankit"};
  int q2[$]='{7,2,4,5};
  int q4[$]='{3,2,4,5};
  int q3[$]='{1,3,9,8};
  int q[$];
initial
  begin
    q={q3,q2};//cant concatinate q1 and q2
    $display("%p",q);
    if(q2==q4)
      $display("%s",q1.pop_back());
    else
      $display("queue are not equal");
  end
endmodule