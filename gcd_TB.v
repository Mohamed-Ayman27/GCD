module gcd_TB();
    reg clk;
    assign clk = 1;

    always #(50) clk = ~clk;

    reg reset;
    reg start;
    reg [7:0] A;
    reg [7:0] B;
    wire [7:0] Result;

    gcd_top DUT (
        .clk(clk),
        .reset(reset),
        .start(start),
        .A(A),
        .B(B),
        .Result(Result)
    );

    function [7:0] GetMin(input[7:0] A_TB , input[7:0] B_TB);
        begin
            if(A_TB > B_TB)
                GetMin = B_TB;
            else
                GetMin = A_TB;
        end
        
    endfunction

    task WaitForFinish(input[7:0] A_TB , input[7:0] B_TB);
        begin
            A = A_TB;
            B = B_TB;
        end
    endtask

    initial begin
        reset = 1;
        start = 1;
        #100
   	reset = 0;
	start = 1;

        WaitForFinish(8'd64,8'd8);

#1500
        WaitForFinish(8'd32,8'd4);

        
    end


endmodule
