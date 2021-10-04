`timescale 1ns/10ps
`define CLCYE_TIME 10.0
module Testbench();
    
    //reg a, b, c, d;
    reg [3:0]a;
    wire S;
    reg  clk;
    
    serialadder name(.clk(clk), .a(a[3]), .b(a[2]), .c(a[1]), .d(a[0]), .S(S));
    
    always #(`CLCYE_TIME*0.5) clk = ~clk;

    initial clk = 1'b1;
     
    initial begin
        a = 4'b0;
        repeat (2 ** 4) begin    //重複 2 ^ 4 以下這個動作
            @(posedge CLK)
                test;         //先照抄
            @(nededge CLK)
                a = a + 1'b1;
        end
    end
    $finish
    
    task test;
    begin
        $display("a = %d, b = %d, c = %d, d = %d, S = %d\n", a, b, c, d, S);
    end
    endtask
    
endmodule
