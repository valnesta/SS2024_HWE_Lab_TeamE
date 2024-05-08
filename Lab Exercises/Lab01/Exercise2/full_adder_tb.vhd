entity full_adder_tb is

end full_adder_tb;

architecture behavior of full_adder_tb is
component full_adder
	port( A,B,Cin: in bit; Sum, Cout: out bit);
end component;
signal A_tb, B_tb, Cin_tb,Sum_tb, Cout_tb: bit;

begin
U3: full_adder port map(A_tb, B_tb,Cin_tb,Sum_tb,Cout_tb);
stimulus: process
begin
A_tb <= '0';	B_tb <= '0'; Cin_tb <= '0'; wait for 10 ns;
A_tb <= '0';	B_tb <= '0'; Cin_tb <= '1'; wait for 20 ns;
A_tb <= '0';	B_tb <= '1'; Cin_tb <= '0'; wait for 30 ns;
A_tb <= '0';	B_tb <= '1'; Cin_tb <= '1'; wait for 40 ns;
A_tb <= '1';	B_tb <= '0'; Cin_tb <= '0'; wait for 50 ns;
A_tb <= '1';	B_tb <= '0'; Cin_tb <= '1'; wait for 60 ns;
A_tb <= '1';	B_tb <= '1'; Cin_tb <= '0'; wait for 70 ns;
A_tb <= '1';	B_tb <= '1'; Cin_tb <= '1'; wait for 80 ns;

wait;

end process;

end behavior;


