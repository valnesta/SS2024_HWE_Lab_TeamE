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

    wait;
  end process stimulus_process;
end behavior;











--A_tb <= "0000", "0001" after 100 ns, "0010" after 200 ns;

--a_tb <= '0';	b_tb <= '0'; wait for 100 ns;
--a_tb <= '0';	b_tb <= '1'; wait for 100 ns;
--a_tb <= '1';	b_tb <= '0'; wait for 100 ns;
--a_tb <= '1';	b_tb <= '1'; wait for 100 ns;
