library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Adder_display_tb is
--  Port ( );
end Adder_display_tb;

architecture Behavioral of Adder_display_tb is

 signal A, B : std_logic_vector(3 downto 0);
    signal Cin : std_logic;
    signal Segments : std_logic_vector(6 downto 0);
    signal CarryOut : std_logic;

    component Adder_to_Display
        Port (
            A : in std_logic_vector(3 downto 0);
            B : in std_logic_vector(3 downto 0);
            Cin : in std_logic;
            Segments : out std_logic_vector(6 downto 0);
            CarryOut : out std_logic
        );
    end component;

begin
    uut: Adder_to_Display port map (
        A => A,
        B => B,
        Cin => Cin,
        Segments => Segments,
        CarryOut => CarryOut
    );

    stim_proc: process
    begin
        -- Initialize signals
        A <= "0001"; B <= "0010"; Cin <= '0'; wait for 10 ns; -- Expected sum: 3
        A <= "0101"; B <= "0011"; Cin <= '1'; wait for 10 ns; -- Expected sum: 9
        A <= "1010"; B <= "0101"; Cin <= '0'; wait for 10 ns; -- Expected sum: 15 (F)
        A <= "0111"; B <= "0111"; Cin <= '0'; wait for 10 ns; -- Expected sum: 14 (E)
        wait;
    end process;

end behavioral;