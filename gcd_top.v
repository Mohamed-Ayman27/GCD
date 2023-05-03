module gcd_top (
    input clk,
    input reset,
    input start,
    input [7:0] A,
    input [7:0] B,
    output [7:0] Result
);
wire cont_AsubB,cont_BsubA,cont_AssignRes,cont_startEn;
wire AgtB_dp,BgtA_dp,AeqB_dp;

gcd_controller Controller(
    .clk(clk),
    .reset(reset),
    .start(start),
    .AgtB(AgtB_dp),
    .BgtA(BgtA_dp),
    .AeqB(AeqB_dp),
    .AsubB(cont_AsubB),
    .BsubA(cont_BsubA),
    .AssignRes(cont_AssignRes)
);

gcd_datapath Data_Path(
    .clk(clk),
    .A(A),
    .B(B),
    .Result(Result),
    .AsubB_dp(cont_AsubB),
    .BsubA_dp(cont_BsubA),
    .AssignRes_dp(cont_AssignRes),
    .AgtB_dp(AgtB_dp),
    .BgtA_dp(BgtA_dp),
    .AeqB_dp(AeqB_dp)
);
    
endmodule