library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sync_Up_Counter_3bit is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(2 downto 0)
         );
end Sync_Up_Counter_3bit;

architecture Structural of Sync_Up_Counter_3bit is
    component JK_FlipFlop
        Port ( J : in STD_LOGIC;
               K : in STD_LOGIC;
               CLK : in STD_LOGIC;
               Q : out STD_LOGIC;
               nQ : out STD_LOGIC
             );
    end component;

    signal Q_internal : STD_LOGIC_VECTOR(2 downto 0);
    signal nQ_internal : STD_LOGIC_VECTOR(2 downto 0);
    signal J, K : STD_LOGIC_VECTOR(2 downto 0);

begin
    -- JK inputs for the first flip-flop (LSB)
    J(0) <= '1';
    K(0) <= '1';

    -- JK inputs for the second flip-flop
    J(1) <= Q_internal(0);
    K(1) <= Q_internal(0);

    -- JK inputs for the third flip-flop (MSB)
    J(2) <= Q_internal(0) and Q_internal(1);
    K(2) <= Q_internal(0) and Q_internal(1);

    -- Instantiate the three JK flip-flops
    JK_FF0: JK_FlipFlop
      port map (
        J => J(0),
        K => K(0),
        CLK => CLK,
        Q => Q_internal(0),
        nQ => nQ_internal(0)
    );

    JK_FF1: JK_FlipFlop
      port map (
        J => J(1),
        K => K(1),
        CLK => CLK,
        Q => Q_internal(1),
        nQ => nQ_internal(1)
    );

    JK_FF2: JK_FlipFlop
      port map (
        J => J(2),
        K => K(2),
        CLK => CLK,
        Q => Q_internal(2),
        nQ => nQ_internal(2)
    );

    -- Reset logic
    process(CLK, RST)
    begin
        if RST = '1' then
            Q_internal <= "000";
        elsif rising_edge(CLK) then
            -- The flip-flops will update here
        end if;
    end process;

    Q <= Q_internal;
end Structural;
