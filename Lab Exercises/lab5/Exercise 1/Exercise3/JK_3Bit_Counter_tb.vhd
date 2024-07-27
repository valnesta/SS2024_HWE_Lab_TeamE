library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Async_Counter_3bit_TB is
end Async_Counter_3bit_TB;

architecture Behavioral of Async_Counter_3bit_TB is
    component Async_Counter_3bit
        Port ( CLK : in STD_LOGIC;
               RST : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR(2 downto 0));
    end component;

    signal CLK, RST : STD_LOGIC := '0';
    signal Q : STD_LOGIC_VECTOR(2 downto 0);
    constant CLK_PERIOD : time := 10 ns;

begin
    UUT: Async_Counter_3bit 
      port map (CLK => CLK, 
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
        -- Reset counter
        RST <= '1';
        wait for 20 ns;
        RST <= '0';
        wait for 10 ns;

        --  the counter runs for 16 clock cycles 
        for i in 0 to 15 loop
            wait for CLK_PERIOD;
            report "Counter value: " & integer'image(to_integer(unsigned(Q)));
        end loop;

        -- Reset again
        RST <= '1';
        wait for 20 ns;
        RST <= '0';
        wait for 10 ns;

        -- the counter runs for another 8 clock cycles
        for i in 0 to 7 loop
            wait for CLK_PERIOD;
            report "Counter value: " & integer'image(to_integer(unsigned(Q)));
        end loop;

        wait;
    end process;
end Behavioral;
