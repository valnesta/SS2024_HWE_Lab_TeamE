entity BCD_to_Seg_tb is

end BCD_to_Seg_tb;

architecture behavioral of BCD_to_Seg_tb is
component BCD_to_Seg
     port( bcd : in bit_vector(3 downto 0);
           Segment : out bit_vector(7 downto 1));
end component;

signal bcd_tb: bit_vector(3 downto 0) := "0000";
signal Segment_tb: bit_vector(6 downto 0);

begin

UUT: BCD_to_Seg
        port map (
            bcd => bcd_tb,
            Segment => Segment_tb
        );
      stimulus_process : process
       begin
        wait for 10 ns;
        bcd_tb <= "0000"; -- 0
        wait for 10 ns;
        bcd_tb <= "0001"; -- 1
        wait for 10 ns;
        bcd_tb <= "0010"; -- 2
        wait for 10 ns;
        bcd_tb <= "0011"; -- 3
        wait for 10 ns;
        bcd_tb <= "0100"; -- 4
        wait for 10 ns;
        bcd_tb <= "0101"; -- 5
        wait for 10 ns;
        bcd_tb <= "0110"; -- 6
        wait for 10 ns;
        bcd_tb <= "0111"; -- 7
        wait for 10 ns;
        bcd_tb <= "1000"; -- 8
        wait for 10 ns;
        bcd_tb <= "1001"; -- 9
        wait;
    end process;
end behavioral;
