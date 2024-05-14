entity BCD_to_Seg is 
  port( bcd : in bit_vector(3 downto 0); 
        Segment : out bit_vector(7 downto 1));

end BCD_to_Seg;


architecture behavioral of BCD_to_Seg is
  begin 
    process(bcd)
    begin
        case bcd is 
		when "0000" => Segment  <= "0111111";
		when "0001" => Segment  <= "0000110";
		when "0010" => Segment  <= "1011011";
		when "0011" => Segment  <= "1001111";
		when "0100" => Segment  <= "1100110";
		when "0101" => Segment  <= "1101101";
		when "0110" => Segment  <= "1111101";
		when "0111" => Segment  <= "0000111";
		when "1000" => Segment  <= "1111111";
		when "1001" => Segment  <= "1101111";
		when others => Segment <= "1111111";
      end case;
  end process;
end behavioral;

