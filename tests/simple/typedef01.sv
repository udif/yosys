module uut_typedef;
	wire w;
	wire x[3:0][3:0];
	wire [3:0]y;
	// This would fail due to unsupported multidimentional packed arrays
	//wire [3:0][3:0]z;
	typedef wire w_t;
	
	// This wil be enabled once we progress further
	//w_t a;
endmodule
