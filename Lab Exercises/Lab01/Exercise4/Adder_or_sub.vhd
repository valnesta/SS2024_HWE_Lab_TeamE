library IEEE;
use IEEE.std_logic_1164.all;

entity addsub is
    port (
        A, B : in bit_vector(4 downto 0); 
        opcode: in bit; 
        Cin: in bit;
        Cout: out bit;
        output: out bit_vector(3 downto 0)
    );
end addsub;

architecture behavior of addsub is
    signal sum: bit_vector(4 downto 0);
begin
    process (A, B, opcode, Cin)
        variable result: bit_vector(4 downto 0);
        variable carry: bit_vector(4 downto 0);
        variable i: integer;
        variable B_inverted: bit_vector(4 downto 0);
    begin
        -- to Initialize carry
        carry := (others => '0');
        carry(0) := Cin;

        if opcode = '1' then
            -- Invert B for subtraction (B + 1's complement + Cin)
            for i in 0 to 4 loop
                B_inverted(i) := not B(i);
            end loop;
        else
            B_inverted := B;
        end if;

        -- this is to Perform bit-wise addition/subtraction with carry
        for i in 0 to 4 loop
            result(i) := A(i) xor B_inverted(i) xor carry(i);
            if i < 4 then
                carry(i + 1) := (A(i) and B_inverted(i)) or (A(i) and carry(i)) or (B_inverted(i) and carry(i));
            end if;
        end loop;

        sum <= result;
    end process;

    output <= sum(3 downto 0);
    Cout <= sum(4);
end behavior;

