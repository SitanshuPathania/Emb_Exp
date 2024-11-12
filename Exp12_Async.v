module AsyncCounter(clk, reset, Q);
  input clk,reset;
  output reg[3:0] Q;
  
  always @(posedge clk or posedge reset)
    begin
      if(reset)
        Q<=4'b0000;
      else
        Q<=Q+1;
    end
endmodule


module tb_AsyncCounter();
  reg clk;
  reg reset;
  wire [3:0] Q;
  
  AsyncCounter counter(clk, reset, Q);
  
  initial begin
    clk=0;
    forever #10 clk=~clk;
  end
  
  initial begin
    $display("T\tclk\treset\t|\tQ");
    $monitor("%0t\t%d\t%d\t|\t%4b",$time, clk, reset, Q);
    
    reset=1;
    #20 reset=0;
    
    #100
    $finish;
  end
endmodule
