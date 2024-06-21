module alok;  
  int data;
  semaphore smp;
        
    task process_1();
    begin
    
    smp.get(1);
    $display("start of process_1");
    
    for(int i = 1; i< 6 ; i++) begin 
      data=$random %10;
      $display("data = %0d",data);           
    end
    smp.put;
    $display("end of process_1");
        end
  endtask
  
  task process_2();  
    begin
    smp.get(1);
    
    $display("start of process_2");
    for(int i = 0; i<10; i++) begin
      data={$random} %6;
        $display("data = %0d",data);      
    end    
    smp.put;
    $display("end of process_2"); 
    end
      endtask

   
  initial 
    begin
    smp = new(1);    
  	fork      
      process_1();
      process_2();      
    join 
    end
  

endmodule