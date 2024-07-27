library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FlipFlop_TB is
end D_FlipFlop_TB;

architecture Behavioral of D_FlipFlop_TB is
    component D_FlipFlop
        Port ( D : in STD_LOGIC;
               CLK : in STD_LOGIC;
               RESET : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;

    signal D, CLK, RESET, Q : STD_LOGIC := '0';
    constant CLK_PERIOD : time := 10 ns;

begin
    UUT: D_FlipFlop 
        port map (
		              D => D,
		             CLK => CLK,
 		             RESET => RST, 
		            Q => Q
            );

    -- Clock process
    CLK_process: process
    begin
        CLK <= '0';
        wait for CLK_PERIOD/2;
        CLK <= '1';
        wait for CLK_PERIOD/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        RESET <= '1';
        wait for 20 ns;
        RESET <= '0';

        D <= '1';
        wait for 15 ns;
        D <= '0';
        wait for 20 ns;
        D <= '1';
        wait for 25 ns;

        wait;
    end process;
end Behavioral;
