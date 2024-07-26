library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity state_machine is
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
end entity state_machine;

architecture Behavioral of state_machine is
    type state_type is (NS_Green, NS_Yellow, EW_Green, EW_Yellow, NS_Ped_Wait, EW_Ped_Wait);
    signal current_state, next_state : state_type;
    signal ped_NS_Request, ped_EW_Request : STD_LOGIC := '0';

begin
    -- State transition process
    process(Clk, resetn)
    begin
        if resetn = '0' then
            current_state <= NS_Green;
            ped_NS_Request <= '0';
            ped_EW_Request <= '0';
        elsif rising_edge(Clk) then
            current_state <= next_state;
            if ped_NS_Interrupt = '1' then
                ped_NS_Request <= '1';
            end if;
            if ped_EW_Interrupt = '1' then
                ped_EW_Request <= '1';
            end if;
        end if;
    end process;

    -- Next state logic and output logic
    process(current_state, ped_NS_Request, ped_EW_Request)
    begin
        
        North_South <= "100";  -- Red
        East_West <= "100";    -- Red
        ped_NS <= "10";        -- Red
        ped_EW <= "10";        -- Red
        next_state <= current_state;

        case current_state is
            when NS_Green =>
                North_South <= "001";  -- Green
                ped_NS <= "01";        -- Green
                if ped_NS_Request = '1' then
                    next_state <= NS_Yellow;
                elsif ped_EW_Request = '1' then
                    next_state <= NS_Yellow;
                end if;
                
            when NS_Yellow =>
                North_South <= "010";  -- Yellow
                ped_NS <= "10";        -- Red
                next_state <= EW_Green;

            when EW_Green =>
                East_West <= "001";  -- Green
                ped_EW <= "01";      -- Green
                if ped_EW_Request = '1' then
                    next_state <= EW_Yellow;
                elsif ped_NS_Request = '1' then
                    next_state <= EW_Yellow;
                end if;
                
            when EW_Yellow =>
                East_West <= "010";  -- Yellow
                ped_EW <= "10";      -- Red
                next_state <= NS_Green;

            when NS_Ped_Wait =>
                if ped_NS_Request = '0' then
                    next_state <= NS_Yellow;
                end if;
                
            when EW_Ped_Wait =>
                if ped_EW_Request = '0' then
                    next_state <= EW_Yellow;
                end if;
                
            when others =>
                next_state <= NS_Green;
        end case;
    end process;
end architecture Behavioral;

