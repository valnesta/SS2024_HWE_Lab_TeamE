library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Testbench entity declaration
entity TrafficLightController_tb is
end entity TrafficLightController_tb;

-- Testbench architecture
architecture Behavioral of TrafficLightController_tb is

    -- Component declaration for the Unit Under Test (UUT)
    component TrafficLightController
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
    end component;

    -- Signal declarations for connecting to the UUT
    signal Clk              : STD_LOGIC := '0';
    signal resetn           : STD_LOGIC := '0';
    signal ped_NS_Interrupt : STD_LOGIC := '0';
    signal ped_EW_Interrupt : STD_LOGIC := '0';
    signal North_South      : STD_LOGIC_VECTOR(2 downto 0);
    signal East_West        : STD_LOGIC_VECTOR(2 downto 0);
    signal ped_NS           : STD_LOGIC_VECTOR(1 downto 0);
    signal ped_EW           : STD_LOGIC_VECTOR(1 downto 0);

    -- Clock period definition
    constant Clk_period : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    UUT: TrafficLightController
        Port map (
            Clk              => Clk,
            resetn           => resetn,
            ped_NS_Interrupt => ped_NS_Interrupt,
            ped_EW_Interrupt => ped_EW_Interrupt,
            North_South      => North_South,
            East_West        => East_West,
            ped_NS           => ped_NS,
            ped_EW           => ped_EW
        );

    -- Clock process definition
    Clk_process : process
    begin
        while True loop
            Clk <= '0';
            wait for Clk_period / 2;
            Clk <= '1';
            wait for Clk_period / 2;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Reset the system
        resetn <= '0';
        wait for 20 ns;
        resetn <= '1';

        -- Wait for initial state stabilization
        wait for 100 ns;

        -- Scenario 1: Normal operation
        wait for 320 ns; -- Wait for a few full cycles

        -- Scenario 2: Pedestrian interrupt during NS_Green
        ped_NS_Interrupt <= '1';
        wait for 20 ns;
        ped_NS_Interrupt <= '0';
        wait for 100 ns; -- Wait for interrupt to be handled

        -- Scenario 3: Pedestrian interrupt during EW_Green
        wait for 200 ns; -- Wait until EW_Green state
        ped_EW_Interrupt <= '1';
        wait for 20 ns;
        ped_EW_Interrupt <= '0';
        wait for 100 ns; -- Wait for interrupt to be handled

        -- Scenario 4: Multiple pedestrian interrupts
        ped_NS_Interrupt <= '1';
        wait for 20 ns;
        ped_NS_Interrupt <= '0';
        wait for 50 ns;
        ped_EW_Interrupt <= '1';
        wait for 20 ns;
        ped_EW_Interrupt <= '0';
        wait for 200 ns; -- Wait for both interrupts to be handled

        -- End of simulation
        wait;
    end process;
end architecture Behavioral;
