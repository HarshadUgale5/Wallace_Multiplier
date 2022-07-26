`include "brent_kung.v"

module testbench;

	reg [15:0] a,b;
	wire [15:0] out;
	wire cout;

	brent_kung test (a,b,out, cout);
	
		integer i,j,err_flag;
	initial begin 
		
		$dumpfile("test.vcd");
		$dumpvars(0, testbench);

		#10 a = 1024; b = 1023;
		#10 $display ("a = %d, b = %d , a*b = %d , out = %d\n", a,b,i*j,out);
		for(i = 0; i < 2**15; i = i + 1)

			for (j = 0; j < 2**15; j = j + 1)
			begin
				 a = i; 
				 b = j;
				#10 $display ("a = %d, b = %d , a+b = %d , out = %d & cout = %d\n", a,b,i+j,out,cout);
				if (!(i+j)==out) begin
					$display("ERROR");
					$stop;
				end	
			end
	end
endmodule

