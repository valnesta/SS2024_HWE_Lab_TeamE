library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_8bit is
    Port ( D : in STD_LOGIC_VECTOR(7 downto 0);
           CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(7 downto 0));
end Register_8bit;

architecture Structural of Register_8bit is
    component D_FlipFlop
        Port ( D : in STD_LOGIC;
               CLK : in STD_LOGIC;
               RESET : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;
begin
    GEN_REG: for i in 0 to 7 generate
        DFF: D_FlipFlop 
           port map (
                D => D(i),
                CLK => CLK,
                RESET => RESET,
                Q => Q(i)
              );
    end generate GEN_REG;
end Structural;

