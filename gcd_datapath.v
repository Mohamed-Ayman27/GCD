module gcd_datapath (
    input clk,
    input [7:0] A,
    input [7:0] B,
    output reg[7:0] Result,
    input AsubB_dp,
    input BsubA_dp,
    input AssignRes_dp,
    output reg AgtB_dp,
    output reg BgtA_dp,
    output reg AeqB_dp
);
reg [7:0] A_dp,B_dp;

assign A_dp = A;
assign B_dp = B;

always @(posedge clk) begin
    BgtA_dp = 0;
    AgtB_dp = 0;
    AeqB_dp = 0;

    if( A_dp != B_dp)begin
        if( A_dp > B_dp )begin
            AgtB_dp = 1;
            BgtA_dp = 0;
        end
        else if(A_dp < B_dp) begin
            AgtB_dp = 0;
            BgtA_dp = 1;
        end
    end
    else if(A_dp == B_dp) begin
            AeqB_dp = 1;
    end
end

always @(*) begin
    if(AsubB_dp)begin
        A_dp = A_dp - B_dp;
    end
    else if (BsubA_dp) begin
        B_dp = B_dp - A_dp;
    end
    else if( AssignRes_dp ) begin
	if( A_dp == B_dp )begin
	   Result = A_dp;
	   $display("The GCD( %d , %d ) = %d" , A , B , Result );
	end
    end
end
endmodule