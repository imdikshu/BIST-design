module MISR_4bit_tb;
    reg clock,reset;
    wire [3:0] Q;
    reg [1:0] dataIn;
    
    MISR_4bit dut(
        .dataIn(dataIn),
        .reset(reset),
        .clock(clock),
        .Q(Q));
        
    initial
        clock = 1'b0;  
   
    always
        #5 clock = ~clock;
        
    initial begin
            reset = 1'b1;  //reset is asserted
            
        #10 reset = 1'b0; dataIn = 2'b10; //RESET IS DEASSERTED
        #10 dataIn = 2'b01;
        #10 dataIn = 2'b01;
        #10 dataIn = 2'b11;
        #10 dataIn = 2'b01;
        #10 dataIn = 2'b10;
        #10 dataIn = 2'b10;
        
        #20 $finish;
    end
endmodule
