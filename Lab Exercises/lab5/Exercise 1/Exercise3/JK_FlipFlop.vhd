library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_FlipFlop is
    Port ( J : in STD_LOGIC;
           K : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Q : out STD_LOGIC;
           nQ : out STD_LOGIC);
end JK_FlipFlop;

architecture Behavioral of JK_FlipFlop is
    signal Q_internal : STD_LOGIC := '0';
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            if (J = '0' and K = '0') then
                Q_internal <= Q_internal;
            elsif (J = '0' and K = '1') then
                Q_internal <= '0';
            elsif (J = '1' and K = '0') then
                Q_internal <= '1';
            else  -- J = '1' and K = '1'
                Q_internal <= not Q_internal;
            end if;
        end if;
    end process;

    Q <= Q_internal;
    nQ <= not Q_internal;
end Behavioral;
