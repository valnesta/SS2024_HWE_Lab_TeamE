library IEEE;
use IEEE.std_logic_1164.all;

entity addsub_tb is

end addsub_tb;

architecture behavior of addsub_tb is

    -- Component declaration for the Unit Under Test (UUT)
    component addsub
        port (
            A, B : in bit_vector(4 downto 0);
            opcode: in bit;
            Cin: in bit;
            Cout: out bit;
            output: out bit_vector(3 downto 0)
        );
    end component;

    -- Signals to connect to UUT
    signal A, B : bit_vector(4 downto 0);
    signal opcode : bit;
    signal Cin : bit;
    signal Cout : bit;
    signal output : bit_vector(3 downto 0);

begin
    -- Instantiation 
    uut: addsub
        port map (
            A => A,
            B => B,
            opcode => opcode,
            Cin => Cin,
            Cout => Cout,
            output => output
        );

    -- Test process
    stim_proc: process
    begin
        -- Test addition (when opcode = '0')
        A <= "00001"; B <= "00010"; Cin <= '0'; opcode <= '0'; wait for 100 ns;  -- output: "0011", Cout: '0'
        A <= "00101"; B <= "00110"; Cin <= '1'; opcode <= '0'; wait for 100 ns;  -- output: "1100", Cout: '0'
        A <= "01111"; B <= "00001"; Cin <= '1'; opcode <= '0'; wait for 100 ns;  -- output: "10001", Cout: '1'
        
        -- Test subtraction (when opcode = '1')
        A <= "00011"; B <= "00001"; Cin <= '0'; opcode <= '1'; wait for 100 ns;  -- output: "0010", Cout: '0'
        A <= "01000"; B <= "00110"; Cin <= '1'; opcode <= '1'; wait for 100 ns;  -- output: "10001", Cout: '1'
        A <= "00001"; B <= "00010"; Cin <= '1'; opcode <= '1'; wait for 100 ns;  -- output: "11100", Cout: '1'

        wait;
    end process;

end behavior;

