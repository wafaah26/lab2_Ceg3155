library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Divider is
 Port (
    OperandA, operandB: in std_logic_vector(3 downto 0);
    Greset, CLK: in std_logic;
    REMQUO: out std_logic_vector(7 downto 0)
 );
end Divider;

architecture struct of Divider is
    signal loadA, loadB, loadR, loadQ, loadC, LSHR, LSHA, LSHQ, RSel, decC: std_logic;
    signal Cout, C: std_logic;
    signal invertedCLK: std_logic;
begin
    invertedCLK <= not(CLK);

    datapath: entity work.DividerDatapath(struct)
        port map(CLK, OperandA, OperandB, loadA, loadB, loadR, loadQ, loadC, LSHR, LSHA, LSHQ, RSel, decC, Cout, C, REMQUO);
    
    controllogic: entity work.DividerControl(struct)
        port map(Greset, invertedCLK, Cout, C, loadA, loadB, loadR, loadQ, loadC, LSHR, LSHA, LSHQ, RSel, decC);
    
end ;