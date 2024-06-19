class adress;
  string village;
  string state;
  int pincode;
  string country;
  
  function new(string village,string state,int pincode, string country);
    this.village=village;
    this.state=state;
    this.pincode=pincode;
    this.country=country;
  endfunction
  
  function void print();  
    $display("village = %s",this.village);
    $display("state = %s",this.state);
    $display("country = %s",this.country);
    $display("pincode = %0d",this.pincode);    
  endfunction
endclass
  
  typedef enum {CSE, ECE, EE} stream;
  
class student;
  string name;
  int rollno;
  stream s;
  adress addr;
  int fees;
  static int lastroll = 0;
  
  function new(string name,int rollno, stream s, adress addr,int fees);
    this.name=name;
    this.rollno=rollno;
    this.s=s;
    this.addr=addr;
    this.fees=fees;
    lastroll = lastroll+1;    
  endfunction

  function void print();    
    $display("Name = %s",this.name);
    $display("Roll Number = %0d",this.rollno);
    $display("Stream = %s",this.s);
    $display("Lastroll = %0d",lastroll);
    addr.print();   
  endfunction 
endclass

class student_1 extends student;
  int fees;
  
function new(string name,int rollno, stream s, adress addr,int fees);
  //stream s=ECE;
  super.new(name,rollno,s,addr,fees);
  this.fees = super.fees+(super.fees *0.3);
endfunction

  function void print();    
    super.print();
    $display("student_1 Fees = %0d",this.fees);
  endfunction
endclass 

class student_2 extends student;
  int fees;
  
function new(string name,int rollno, stream s, adress addr,int fees);
 // stream s=EE;
  super.new(name,rollno,s,addr,fees);
  this.fees = super.fees+(super.fees *0.2);
endfunction

  function void print();    
    super.print();
    $display("student_2 Fees = %0d",this.fees);
  endfunction
endclass 

class student_3 extends student;
  int fees;
  
function new(string name,int rollno, stream s, adress addr,int fees);
 // stream s=CSE;
  super.new(name,rollno,s,addr,fees);
  this.fees = super.fees+(super.fees *1);
endfunction

  function void print();    
    super.print();
    $display("student_3 Fees = %0d",this.fees);
  endfunction
endclass 
  
module top_tb(); 
  
  adress a1 = new("antari", "UP", 212301, "India");
  adress a2 = new("antarii", "UPP", 2123011, "Bharat");
  adress a3 = new("antariiii", "UPPP", 21230111, "Hindustan");
  
  student_1 s1;
  student_2 s2;
  student_3 s3;
 
  initial begin
    $display("Student_1");
    s1 = new("Alok",56,ECE,a1,10000);
    s1.print();
    $display("---------------------");
    $display("Student_2");
    s2 = new("Shyamu",57,EE,a2,10000);
    s2.print();
    $display("---------------------");
    $display("Student_3");
    s3 = new("Abhishek",58,CSE,a3,10000);
    s3.print();
  end
endmodule
