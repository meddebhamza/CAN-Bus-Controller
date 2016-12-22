library ieee; 
use ieee.std_logic_1164.all; 

entity CAN_SiPo_Reg is  
    port(
	    clk : in STD_LOGIC;
	    reset : in  std_logic;
	    din : in std_logic; 
	    load : in STD_LOGIC;
	    dout : out std_logic_vector(7 downto 0)); 
end CAN_SiPo_Reg;

architecture sipo_arc of CAN_SiPo_Reg is 
    signal tmp: std_logic_vector(7 downto 0); 
begin 
    process (clk,reset) 
    begin  
	if (clk='1' and reset='0') then  
	    tmp <= tmp(6 downto 0)& din;  
	elsif (clk='1' and reset='1') then
	    tmp <= "00000000";
	end if; 
    end process; 
    dout <= tmp when load='1' ; 
end sipo_arc; 
