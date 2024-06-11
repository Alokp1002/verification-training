module que;
  int q[$]='{5,9,8,10};
  
initial
  begin
    $display("%d",q.pop_front());
    $display("%d",q.pop_back());
    $display("%d",q.size());
    q.push_front(6);
    q.push_back(2);
    q.insert(2,15);
    $display("%p",q);
    q.delete(3);
    $display("%p",q);
    q={q,7};
    $display("%p",q);
  end
endmodule







