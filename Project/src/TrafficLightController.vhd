library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TrafficLightController is
    Port (
        Clk                 : in  STD_LOGIC;
        resetn              : in  STD_LOGIC;
        ped_NS_Interrupt    : in  STD_LOGIC;
        ped_EW_Interrupt    : in  STD_LOGIC;
        North_South         : out STD_LOGIC_VECTOR(2 downto 0);
        East_West           : out STD_LOGIC_VECTOR(2 downto 0);
        ped_NS              : out STD_LOGIC_VECTOR(1 downto 0);
        ped_EW              : out STD_LOGIC_VECTOR(1 downto 0)
    );
end entity TrafficLightController;

architecture Behavioral of TrafficLightController is
    signal divided_clock: STD_LOGIC;

    
    component clock_divider
        Port ( 
            clk_out1 : out STD_LOGIC;
            resetn   : in  STD_LOGIC;
            clk_in1  : in  STD_LOGIC
        );
    end component;

    -- Component declaration for the state machine
    component state_machine
        Port (
            Clk              : in  STD_LOGIC;
            resetn           : in  STD_LOGIC;
            ped_NS_Interrupt : in  STD_LOGIC;
            ped_EW_Interrupt : in  STD_LOGIC;
            north_South      : out STD_LOGIC_VECTOR(2 downto 0);
            east_West        : out STD_LOGIC_VECTOR(2 downto 0);
            ped_NS           : out STD_LOGIC_VECTOR(1 downto 0);
            ped_EW           : out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

begin
    -- Instantiate the clock divider
    ClockDividerInst: clock_divider
        port map (
            clk_out1  => divided_clock,
            resetn   => resetn,
            clk_in1 => Clk
        );

    -- Instantiate the state machine
    StateMaschineInst: state_machine
        Port map (
            Clk              => divided_clock,
            resetn           => resetn,
            ped_NS_Interrupt => ped_NS_Interrupt,
            ped_EW_Interrupt => ped_EW_Interrupt,
            North_South      => north_South,
            East_West        => east_West,
            ped_NS           => ped_NS,
            ped_EW           => ped_EW
        );
end architecture Behavioral;
