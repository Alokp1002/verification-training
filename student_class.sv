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
  
 /* function new();//default
    this.village=village;
    this.state=state;
    this.pincode=pincode;
    this.country=country;
  endfunction*/
  
  function void setvillage(string village);
    this.village=village;
  endfunction
  
  function void setstate(string state);
    this.state=state;
  endfunction
  
  function void setpincode(int pincode);
    this.pincode=pincode;
  endfunction
  
  function void setcountry(string country);
    this.country=country;
  endfunction
  
  function string getvillage();
    return this.village;
  endfunction
  
  function string getstate();
    return this.state;
  endfunction
  
  function int getpincode();
    return this.pincode;
  endfunction
  
  function string getcountry();
    return this.country;
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
  
  function new(string name,int rollno, stream s, adress addr);
    this.name=name;
    this.rollno=rollno;
    this.s=s;
    this.addr=addr;
  endfunction
  
 /* function new();//default
    this.name=name;
    this.rollno=rollno;
    this.s=s;
    this.addr=addr;
  endfunction*/
  
  function void setname(string name); 
    this.name =name;    
  endfunction
  
  function void setrollno(int rollno);   
    this.rollno = rollno;    
  endfunction
  
  function void setstream(stream s);   
    this.s = s;    
  endfunction
  
  function void setadress(adress addr);   
    this.addr = addr;    
  endfunction
  
  function string getname();  
    return this.name;  
  endfunction
  
  function int getrollno();  
    return this.name;  
  endfunction
  
  function stream getstream();  
    return this.s;  
  endfunction
  
  function adress getadress();  
    return this.addr;  
  endfunction

  function void print();    
    $display("Name = %s",this.name);
    $display("Roll Number = %0d",this.rollno);
    $display("Stream = %s",this.s);
    addr.print();   
  endfunction 
endclass

module top_tb(); 
  stream s = ECE;
  adress a1 = new("antari", "UP", 212301, "India");
  student s1 = new("Alok",56,s,a1);
 
  //adress a2=new();
  //student s2=new();//default constructor;
  
  initial begin
	s1.print();
    //s2.print();
    s1.setname("shyamu");
    s1.setrollno(99);
    s1.setstream(CSE);
    a1.setvillage("Vaishali nagar");
    s1.setadress(a1);
    a1.setstate("MP");
    a1.setcountry("Bharat");
    a1.setpincode(273321);
    $display("reslt by set function");
     s1.print();
  end
endmodule