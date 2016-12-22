LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY can_register IS
   GENERIC (
      WIDTH                          :  integer := 8);    --  default parameter of the register width
   PORT (
      data_in                 : IN std_logic_vector(WIDTH - 1 DOWNTO 0);   
      data_out                : OUT std_logic_vector(WIDTH - 1 DOWNTO 0);   
      we                      : IN std_logic;  
      clk                     : IN std_logic;
      rst_async               : IN std_logic);    
         
END ENTITY can_register;

ARCHITECTURE RTL OF can_register IS

   SIGNAL data_out_xhdl1           :  std_logic_vector(WIDTH - 1 DOWNTO 0);   

BEGIN
   data_out <= data_out_xhdl1;

   PROCESS (clk,rst_async)
   BEGIN
      
      IF (clk'EVENT AND clk = '1') THEN
         IF (we = '1' AND   (NOT rst_async ='1')) THEN 
            -- write
            data_out_xhdl1 <= data_in;
         END IF;
      ELSIF (rst_async = '1') then 
            data_out_xhdl1 <= (others => '0');
      END IF;
   END PROCESS;

END ARCHITECTURE RTL;