entity B_to_bcd_tb is

end entity;

architecture behavior of B_to_bcd_tb is
component B_to_BCD
port(b_num : in bit_vector(3 downto 0);  out_bcd: out bit_vector(4 downto 0));
end component;

signal b_tb: bit_vector(3 downto 0);
signal bcd_tb : bit_vector( 4 downto 0);
begin
uut: B_to_BCD port map (b_num => b_tb, out_bcd   => bcd_tb);
stimulus_process : process
  begin
    b_tb <= "0000";
    wait for 100 ns;

    b_tb <= "0001";
    wait for 100 ns;

    b_tb <= "0010";
    wait for 100 ns;
      
    b_tb <= "0011";
    wait for 100 ns;

    b_tb <= "0100";
    wait for 100 ns;

    b_tb <= "0101";
    wait for 100 ns;

    b_tb <= "0110";
    wait for 100 ns;

    b_tb <= "0111";
    wait for 100 ns;

    b_tb <= "1000";
    wait for 100 ns;

    b_tb <= "1001";
    wait for 100 ns;

    b_tb <= "1010";
    wait for 100 ns;

    b_tb <= "1011";
    wait for 100 ns;

    b_tb <= "1100";
    wait for 100 ns;

    b_tb <= "1101";
    wait for 100 ns;

    b_tb <= "1110";
    wait for 100 ns;
      
    b_tb <= "1111";
    wait for 100 ns;

    wait;
  end process stimulus_process;
end behavior;
