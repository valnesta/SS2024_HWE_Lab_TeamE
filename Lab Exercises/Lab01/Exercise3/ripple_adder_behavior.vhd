entity ripple_adder is
    port(
        A, B: in std_logic_vector(3 downto 0);
        Cin: in std_logic;
        Sum_out: out std_logic_vector(3 downto 0);
        Carry_out: out std_logic
    );
end ripple_adder;

architecture behavior of ripple_adder is
    signal c: std_logic_vector(3 downto 1); -- Internal carry signals

    component full_adder
        port(
            A, B, Cin: in std_logic;
            Sum, Cout: out std_logic
        );
    end component;
begin
    FA0: full_adder port map (
        A => A(0),
        B => B(0),
        Cin => Cin,
        Sum => Sum_out(0),
        Cout => c(1)
    );

    FA1: full_adder port map (
        A => A(1),
        B => B(1),
        Cin => c(1),
        Sum => Sum_out(1),
        Cout => c(2)
    );

    FA2: full_adder port map (
        A => A(2),
        B => B(2),
        Cin => c(2),
        Sum => Sum_out(2),
        Cout => c(3)
    );

    FA3: full_adder port map (
        A => A(3),
        B => B(3),
        Cin => c(3),
        Sum => Sum_out(3),
        Cout => Carry_out
    );
end behavior;
