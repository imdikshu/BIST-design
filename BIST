module BIST(clock,reset,w,x,y,data_out,dataIn ,MisrDataOut ,testmode, fault_detected);

    input clock,reset,testmode; //testmode = modeSelector to switch between normal and test mode
    input  w,x,y;              // a,b and cin 
    
    output [2:0] data_out;     // lfsr output
    output [1:0] dataIn;       // Misr input
    output [3:0] MisrDataOut;      // Misr output
    output reg fault_detected;  //flag indicating fault detected in DUT
    
    wire  a,b,cin;
    wire finish;
    parameter golden_signature = 4'b0011; //predefined correct o/p of the MISR when the DUT is fault-free, set to 4'b0011.
    
    //if testmode = 1 --> testmode active i.e..{a,b,cin} = data_out[2:0] , else its normal mode i.e.. {a,b,cin} = inputs
    assign {a,b,cin} = (testmode == 1)? (data_out[2:0]) : ({w,x,y}); 
    
    ML_lfsr I1(data_out, finish, reset, clock); //generated test patterns{data_out} for full adder
    full_adder I2(a,b,cin,dataIn);    //dataIn is {sum,cout} of full adder
    MISR_4bit I3(dataIn, reset, clock, MisrDataOut); // Compacts the outputs of the full adder into a 4-bit signature (misrdataOut).
    
    always @(posedge clock) begin
        if(testmode == 0)	//when bist mode is off, faults can't be detected
            fault_detected = 0;
        else begin
            if(finish == 1) begin //indicating end of test sequence
                if(golden_signature == MisrDataOut) 
                    fault_detected = 0;
                else
                    fault_detected = 1;
            end
        end
    end
    
endmodule
