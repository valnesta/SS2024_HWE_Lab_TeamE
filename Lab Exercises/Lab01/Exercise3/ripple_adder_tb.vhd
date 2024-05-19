entity ripple_adder_tb is
end ripple_adder_tb;
 

architecture behavior of ripple_adder_tb is 
component ripple_adder
port(A,B:in bit_vector(3 downto 0); Cin : in bit; 
Sum_out: out bit_vector(3 downto 0); Carry_out: out bit);
end component;

signal A_tb,B_tb: bit_vector(3 downto 0);
signal Cin_tb : bit;
signal Sum_out_tb :bit_vector(3 downto 0);
signal Carry_out_tb : bit;
begin

U4: ripple_adder port map(A_tb,B_tb,Cin_tb, Sum_out_tb,Carry_out_tb);
 
Stimulus: process

begin
wait for 100 ns;
A_tb <= "0110";
B_tb <= "1100";
 
wait for 100 ns;
A_tb <= "1111";
B_tb <= "1100";
 
wait for 100 ns;
A_tb <= "0110";
B_tb <= "0111";
 
wait for 100 ns;
A_tb <= "0110";
B_tb <= "1110";
 
wait for 100 ns;
A_tb <= "1111";
B_tb <= "1111";
 
wait;
 
end process;

 
END;
