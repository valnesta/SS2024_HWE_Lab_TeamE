Entity  half_adder is
	port(a,b:in bit; sum,C_out: out bit);
end half_adder;


architecture behaviour of half_adder is

begin 

sum <= a xor b;
C_out <= a and b;

end behaviour;
