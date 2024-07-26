library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock_divider is
    Port (
        clk_in1  : in  STD_LOGIC;  -- 100 MHz clock input
        resetn     : in  STD_LOGIC;  -- Reset signal
        clk_out1 : out STD_LOGIC   -- 25 MHz clock output
    );
end entity clock_divider;

architecture Behavioral of clock_divider is
    signal clk_div : integer := 0;
    signal clk_div_reg : STD_LOGIC := '0';
    constant DIVISOR : integer := 4;  -- To divide 100 MHz by 4 to get 25 MHz
begin
    process(clk_in, rst)
    begin
        if rst = '1' then
            clk_div <= 0;
            clk_div_reg <= '0';
        elsif rising_edge(clk_in) then
            if clk_div = DIVISOR - 1 then
                clk_div <= 0;
                clk_div_reg <= NOT clk_div_reg; -- Toggle the output clock
            else
                clk_div <= clk_div + 1;
            end if;
        end if;
    end process;

    clk_out <= clk_div_reg;
end architecture Behavioral;
