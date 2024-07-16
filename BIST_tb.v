module BIST_tb;
	// Inputs
	reg clock;
	reg reset;
	reg w,x,y;
	reg testmode;

	// Outputs
	wire [2:0] data_out;
	wire [1:0] dataIn;
	wire [3:0] MisrDataOut;

	
	BIST uut (clock,reset,w,x,y,data_out,dataIn ,MisrDataOut, testmode, fault_detected);

	initial begin
		clock = 0;
		reset = 1;
		w = 1; x = 1; y=1;
		testmode = 0;
	end
		
    always #5 clock = !clock;
		
    initial begin
        #10 reset =1'b0;
        testmode =1'b1;
    end
    
    always #120 $finish;
endmodule
