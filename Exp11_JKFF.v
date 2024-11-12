module JK_FlipFlop(J,K,clk,Q);
  input J;
  input K;
  input clk;
  output reg Q;
  
  always @(posedge clk)
    begin
      case ({J,K})
        2'b00: Q<=Q;
        2'b01: Q<=0;
        2'b10: Q<=1;
        2'b11: Q<=~Q;
      endcase
    end
endmodule


module tb_JKFF();
  reg J;
  reg K;
  reg clk;
  wire Q;
  
  JK_FlipFlop dut(J,K,clk,Q);
  
  initial begin
    clk=0;
    forever #10 clk=~clk;
  end
  
  initial begin
    $display("T\tclk\tJ\tK\t|\tQ");
    $monitor("%0t\t%d\t%d\t%d\t|\t%d", $time, clk, J, K, Q);
  end
  
  initial begin
    J=0;K=0;
    #20 J=0; K=1;
    #20 J=1; K=0;
    #20 J=1; K=1;
    #20 J=0; K=0;
    #20 J=1; K=1;
    $finish;
  end
endmodule
