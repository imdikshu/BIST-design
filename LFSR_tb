module LFSR_tb;
    reg clock,reset;  
    wire [0:2] data_out;
    wire [0:2] count;
    
    LFSR lfsr1(data_out, cycle_repeat, reset, clock);
    
    initial //generating clock
        clock = 1'b0;
    always
        #5 clock = ~clock;
        
    initial begin // reseting 
            reset = 1'b1;
        #10 reset = 1'b0;
    end
    
    always #100 $finish;
    
endmodule
