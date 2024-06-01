library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FullAdder is
    Port ( A, B, Cin : in STD_LOGIC;
           Sum_out, CarryOut : out STD_LOGIC);
end FullAdder;

architecture Behavioral of FullAdder is

begin
Sum_out <= A xor B xor Cin;
CarryOut <= (A and B) or ((A xor B) and Cin);

end Behavioral;