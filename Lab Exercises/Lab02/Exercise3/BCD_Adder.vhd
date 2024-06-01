library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Ripple_Adder is
    Port (  A, B: in std_logic_vector(3 downto 0);
        Cin: in std_logic;
        Sum_out: out std_logic_vector(3 downto 0);
        Carry_out: out std_logic);
end Ripple_Adder;

architecture Behavioral of Ripple_Adder is
  signal c: std_logic_vector(3 downto 0); 
    component FullAdder
        port(
            A , B , Cin : in std_logic;
            Sum_out, CarryOut: out std_logic
        );
    end component;

begin

    FA0: FullAdder port map (
        A => A(0),
        B => B(0),
        Cin => Cin,
        Sum_out => Sum_out(0),
        CarryOut => c(1)
    );

    FA1: FullAdder port map (
        A => A(1),
        B => B(1),
        Cin => c(1),
        Sum_out => Sum_out(1),
        CarryOut => c(2)
    );

    FA2: FullAdder port map (
        A => A(2),
        B => B(2),
        Cin => c(2),
        Sum_out => Sum_out(2),
        CarryOut => c(3)
    );

    FA3: FullAdder port map (
        A => A(3),
        B => B(3),
        Cin => c(3),
        Sum_out => Sum_out(3),
        CarryOut => Carry_out
     );

end Behavioral;