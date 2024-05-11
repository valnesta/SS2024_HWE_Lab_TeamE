entity B_to_BCD is
port(b_num : in bit_vector(3 downto 0);  out_bcd: out bit_vector(4 downto 0));
end B_to_BCD;


architecture behavior of B_to_BCD is
begin
	out_bcd(4) <= (b_num(3) and b_num(2)) or (b_num(3) and b_num(1));
	out_bcd(3) <= (b_num(3) and  not b_num(2)) and (not b_num(1));
	out_bcd(2) <= (not b_num(3) and b_num(2)) or (b_num(2) and b_num(1));
	out_bcd(1) <= (b_num(3) and b_num(2) and (not b_num(1))) or (not (b_num(3)) and b_num(1));
	out_bcd(0) <= b_num(0);
end behavior;
