library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Seven_Segment_display is
    Port (
        Adder_input : in std_logic_vector(3 downto 0);
        Segments : out std_logic_vector(6 downto 0) -- 7 segments (a to g)
    );
end Seven_Segment_display;

architecture Behavioral of Seven_Segment_display is
begin
    process(Adder_input)
    begin
        case Adder_input is
            when "0000" => segments <= "0111111"; -- 0
            when "0001" => segments <= "0000110"; -- 1
            when "0010" => segments <= "1011011"; -- 2
            when "0011" => segments <= "1001111"; -- 3
            when "0100" => segments <= "1100110"; -- 4
            when "0101" => segments <= "1101101"; -- 5
            when "0110" => segments <= "1111101"; -- 6
            when "0111" => segments <= "0000111"; -- 7
            when "1000" => segments <= "1111111"; -- 8
            when "1001" => segments <= "1101111"; -- 9
            when "1010" => segments <= "1110111"; -- A
            when "1011" => segments <= "1111100"; -- b
            when "1100" => segments <= "0111001"; -- C
            when "1101" => segments <= "1011110"; -- d
            when "1110" => segments <= "1111001"; -- E
            when "1111" => segments <= "1110001"; -- F
            when others => segments <= "0000000"; -- Default blank
        end case;
    end process;
end Behavioral;