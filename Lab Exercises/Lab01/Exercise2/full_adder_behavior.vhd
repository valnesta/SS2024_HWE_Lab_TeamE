Entity full_adder is
	port(A,B, Cin:in bit; Sum ,Cout: out bit);
end full_adder;

architecture behavior of full_adder is
component half_adder
	port(a,b:in bit; sum,c: out bit);
end component;

begin

Sum <= A xor B xor Cin;
Cout <= (A and B) or ((A xor B) and Cin);

end behavior;
