library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder_to_Display is
    Port (
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        Cin : in std_logic;
        Segments : out std_logic_vector(6 downto 0);
        CarryOut : out std_logic
    );
end Adder_to_Display;

architecture Behavioral of Adder_to_Display is
    signal Sum_out : std_logic_vector(3 downto 0);
    signal carry_internal : std_logic;

    component Ripple_Adder
        port(
            A, B: in std_logic_vector(3 downto 0);
            Cin: in std_logic;
            Sum_out: out std_logic_vector(3 downto 0);
            Carry_out: out std_logic
        );
    end component;

    component Seven_Segment_display
        Port (
            Adder_input : in std_logic_vector(3 downto 0);
            segments : out std_logic_vector(6 downto 0)
        );
    end component;

begin
    -- Instantiate ripple adder
    Ripple_Adder_inst : Ripple_Adder
        port map (
            A => A,
            B => B,
            Cin => Cin,
            Sum_out => Sum_out,
            Carry_out => carry_internal
        );

    -- Instantiate seven-segment decoder
    Seven_Segment_display_inst : Seven_Segment_display
        port map (
            Adder_input => Sum_out,
            segments => Segments
        );

    -- Assign carry out
    CarryOut <= carry_internal;
end Behavioral;
