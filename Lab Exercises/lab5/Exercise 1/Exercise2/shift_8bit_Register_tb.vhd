library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftRegister_8bit_TB is
end ShiftRegister_8bit_TB;

architecture Behavioral of ShiftRegister_8bit_TB is
    component ShiftRegister_8bit
        Port ( D : in STD_LOGIC;
               CLK : in STD_LOGIC;
               RST : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR(7 downto 0));
    end component;

    signal D : STD_LOGIC := '0';
    signal Q : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal CLK, RST : STD_LOGIC := '0';
    constant CLK_PERIOD : time := 10 ns;

begin
    UUT: ShiftRegister_8bit 
          port map (
                    D => D, 
                    CLK => CLK, 
                    RST => RST, 
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
        -- Reset the shift register
        RST <= '1';
        wait for 20 ns;
        RST <= '0';
        wait for 10 ns;

        -- Test case 1: Shift in 10101010
        for i in 0 to 7 loop
            D <= not D;
            wait for 10 ns;
        end loop;

        -- Test case 2: Shift in 11110000
        for i in 0 to 3 loop
            D <= '1';
            wait for 10 ns;
        end loop;
        for i in 0 to 3 loop
            D <= '0';
            wait for 10 ns;
        end loop;

        -- Test reset again
        RST <= '1';
        wait for 20 ns;
        RST <= '0';
        wait for 10 ns;

        -- Test case 3: Shift in 00001111
        for i in 0 to 3 loop
            D <= '0';
            wait for 10 ns;
        end loop;
        for i in 0 to 3 loop
            D <= '1';
            wait for 10 ns;
        end loop;

        wait;
    end process;
end Behavioral;
