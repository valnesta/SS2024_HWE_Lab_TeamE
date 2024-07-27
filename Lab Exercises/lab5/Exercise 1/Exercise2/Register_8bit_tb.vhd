library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_8bit_TB is
end Register_8bit_TB;

architecture Behavioral of Register_8bit_TB is
    component Register_8bit
        Port ( D : in STD_LOGIC_VECTOR(7 downto 0);
               CLK : in STD_LOGIC;
               RESET : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR(7 downto 0));
    end component;

    signal D, Q : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal CLK, RESET : STD_LOGIC := '0';
    constant CLK_PERIOD : time := 10 ns;

begin
    UUT: Register_8bit port map (D => D, CLK => CLK, RESET => RESET, Q => Q);

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
        -- Reset the register
        RESET <= '1';
        wait for 20 ns;
        RESET <= '0';
        wait for 10 ns;

        -- Test case 1: Load 10101010
        D <= "10101010";
        wait for 20 ns;

        -- Test case 2: Load 11001100
        D <= "11001100";
        wait for 20 ns;

        -- Test case 3: Load 00110011
        D <= "00110011";
        wait for 20 ns;

        -- Test reset again
        RESET <= '1';
        wait for 20 ns;
        RESET <= '0';

        -- Test case 4: Load 11111111
        D <= "11111111";
        wait for 20 ns;

        wait;
    end process;
end Behavioral;
