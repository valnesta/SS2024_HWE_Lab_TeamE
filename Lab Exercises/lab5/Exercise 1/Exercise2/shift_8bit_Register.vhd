library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftRegister_8bit is
    Port ( D : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(7 downto 0));
end ShiftRegister_8bit;

architecture Structural of ShiftRegister_8bit is
    component D_FlipFlop
        Port ( D : in STD_LOGIC;
               CLK : in STD_LOGIC;
               RST : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;

    signal internal_q : STD_LOGIC_VECTOR(7 downto 0);
begin
    DFF0: D_FlipFlop port map (
        D => D,
        CLK => CLK,
        RST => RST,
        Q => internal_q(0)
    );

    GEN_SHIFT: for i in 1 to 7 generate
        DFFi: D_FlipFlop port map (
            D => internal_q(i-1),
            CLK => CLK,
            RST => RST,
            Q => internal_q(i)
        );
    end generate GEN_SHIFT;

    Q <= internal_q;
end Structural;
