`include "wallace_multiplier.v"

module testbench;

	reg [15:0] a,b;
	wire [31:0] out;

	wallace_multiplier test (a,b,out);
	
		integer i,j,err_flag;
	initial begin 
		
		$dumpfile("test.vcd");
		$dumpvars(0, testbench);


		for(i = 0; i < 10; i = i + 1)

			for (j = 0; j < 10; j = j + 1)
			begin
				$display ("a = %d, b = %d , a*b = %d , out = %d\n", a,b,a*b,out);
				if(out == a*b)
					err_flag = 0;
				else
					err_flag = 1;
				
				#10 a = i; 
				    b = j;
			end
			
		$display("Tested %d combinations : Error = %d\n",(i+1)*(j+1),err_flag);

		//#20 a = 11; b = 33;
		//#40 a = 24; b = 13;
	end

	initial begin

		#30 $display( "a = %d\t, b = %d\n \t\tProduct : Expected = %d, Calculated = %d",a,b,(a*b),out);
		#60 $display( "a = %d\t, b = %d\n \t\tProduct : Expected = %d, Calculated = %d",a,b,(a*b),out);

	end
endmodule

