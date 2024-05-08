entity half_adder_tb is

end half_adder_tb;


architecture behaviour of half_adder_tb is
component half_adder
	port(a,b:in bit; sum, C_out : out bit);
	end component;

signal a_tb, b_tb,sum_tb,C_out_tb:bit;
begin
U3: half_adder port map(a_tb, b_tb,sum_tb,C_out_tb);

stimulus: process

begin

a_tb <= '0';	b_tb <= '0'; wait for 100 ns;
a_tb <= '0';	b_tb <= '1'; wait for 100 ns;
a_tb <= '1';	b_tb <= '0'; wait for 100 ns;
a_tb <= '1';	b_tb <= '1'; wait for 100 ns;

wait;
end process;
end behaviour;
