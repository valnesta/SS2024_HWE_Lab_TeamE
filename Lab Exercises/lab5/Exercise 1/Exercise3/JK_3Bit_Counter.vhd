library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Async_Counter_3bit is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(2 downto 0));
end Async_Counter_3bit;

architecture Structural of Async_Counter_3bit is
    component JK_FlipFlop
        Port ( J : in STD_LOGIC;
               K : in STD_LOGIC;
               CLK : in STD_LOGIC;
               Q : out STD_LOGIC;
               nQ : out STD_LOGIC);
    end component;

    signal Q_internal : STD_LOGIC_VECTOR(2 downto 0);
    signal nQ_internal : STD_LOGIC_VECTOR(2 downto 0);
begin
    -- First JK-FF (LSB)
    JK_FF0: JK_FlipFlop port map (
        J => '1',
        K => '1',
        CLK => CLK,
        Q => Q_internal(0),
        nQ => nQ_internal(0)
    );

    -- Second JK-FF
    JK_FF1: JK_FlipFlop port map (
        J => '1',
        K => '1',
        CLK => nQ_internal(0),
        Q => Q_internal(1),
        nQ => nQ_internal(1)
    );

    -- Third JK-FF (MSB)
    JK_FF2: JK_FlipFlop port map (
        J => '1',
        K => '1',
        CLK => nQ_internal(1),
        Q => Q_internal(2),
        nQ => nQ_internal(2)
    );

    -- Reset logic
    process(RST)
    begin
        if RST = '1' then
            Q_internal <= "000";
        end if;
    end process;

    Q <= Q_internal;
end Structural;
