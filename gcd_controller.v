module gcd_controller(
    input clk,
    input reset,
    input start,
    input AgtB,
    input BgtA,
    input AeqB,
    output reg AsubB,
    output reg BsubA,
    output reg AssignRes,
    output reg Start_EN
);
parameter State_Width = 3;
//State Assignment
//Don't know the problem with ModelSim but only works by defining states as wires
wire [State_Width-1 : 0]  While1 = 3'b000;
wire [State_Width-1 : 0]  Wait_Start = 3'b001;
wire [State_Width-1 : 0]  IF_AEqB = 3'b010;
wire [State_Width-1 : 0]  IF_AgtB = 3'b011;
wire [State_Width-1 : 0]  IF_BgtA = 3'b100;
wire [State_Width-1 : 0]  Res_Assign = 3'b101;

reg [State_Width-1 : 0] curr_state , next_state;
//Sequential Logic of Controller 

integer i = 0;
always @(posedge clk , posedge reset) begin
    if(reset)begin
        curr_state <= Wait_Start;
    end
    else begin
        curr_state <= next_state;
	i = i+1;
    end
end

//Combinational Logic of Controller 
always @(*) begin
    AsubB = 0;
    BsubA = 0;
    Start_EN = 0;

    case (curr_state)
    
        Wait_Start:begin // First State where the program waits for Start Signal
            if(start)begin
                Start_EN = 1;
                next_state = IF_AEqB;
            end
            else begin
                next_state = Wait_Start;
            end
        end
        

        IF_AEqB:begin // Comparison between A & B to get GCD 
            if(AeqB)begin
                AssignRes = 1;
 		        BsubA = 0;
                AsubB = 0;
		        $display("\nFound After %d Clock Cycles",i);
                next_state = Wait_Start;
            end
            else begin
                if (AgtB) begin
                    next_state = IF_AgtB;
                end
                else if(BgtA) begin
                    next_state = IF_BgtA;
		end
            end
        end


        IF_AgtB:begin // If a > b will send a signal to perform A = A-B
                    BsubA = 0;
                    AsubB = 1;
		    AssignRes = 0;
                    next_state = IF_AEqB;
        end
        IF_BgtA:begin // If a < b will send a signal to perform B = B - A
                    BsubA = 1;
                    AsubB = 0;
	            AssignRes = 0;
                    next_state = IF_AEqB;
        end



    endcase
end
    
endmodule