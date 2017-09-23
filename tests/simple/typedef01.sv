module uut_typedef;
	wire w1;
	wire w2[1:0][2:0];
	wire [3:0]w3;
	wire [4:0]w4[5:0];
	wire [6:0]w5[7:0][8:0];
	// This would fail due to unsupported multidimentional packed arrays
	//wire [3:0][3:0]z;
	typedef wire w1_t;
	typedef wire w2_t[1:0][2:0];
	typedef wire [3:0]w3_t;
	typedef wire [4:0]w4_t[5:0];
	typedef wire [6:0]w5_t[7:0][8:0];
	
	// This wil be enabled once we progress further
	//w_t a;
endmodule
