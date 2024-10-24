library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity complement_4b is
 Port (
    IN1: in std_logic_vector(3 downto 0);
    OUT1: out std_logic_vector(3 downto 0)
 );
end complement_4b;

architecture struct of complement_4b is
    signal XOROUT: std_logic_vector(3 downto 0);
    signal cout: std_logic;
begin
    XORGATE: entity work.xorgate_4b(struct)
        port map("1111", IN1, XOROUT);
    
    adder: entity work.adder_4b(struct)
        port map("0000", XOROUT, '1', OUT1, cout);
end ;