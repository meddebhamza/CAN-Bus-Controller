
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

ENTITY can_acceptance_filter IS
   PORT (
      clk                     : IN std_logic;   
      rst                     : IN std_logic;   
      id                      : IN std_logic_vector(10 DOWNTO 0);
      acceptance_code_0       : IN std_logic_vector(7 DOWNTO 0);   
      acceptance_mask_0       : IN std_logic_vector(7 DOWNTO 0);   
      rx_Buffer_full          : IN std_logic;   
      rx_id_lim               : IN std_logic;
      id_ok                   : OUT std_logic);   
END ENTITY can_acceptance_filter;

ARCHITECTURE RTL OF can_acceptance_filter IS

function conv_std_logic(b : boolean) return std_ulogic is
begin
  if b then return('1'); else return('0'); end if;
end;

   SIGNAL match                 :  std_logic;   
   SIGNAL id_MATCH              :  std_logic;   

BEGIN
   id_ok <= id_MATCH;

   -- Working in basic mode. ID match for standard format (11-bit ID).
   match <= (((((((CONV_STD_LOGIC(id(3) = acceptance_code_0(0)) OR acceptance_mask_0(0)) AND (CONV_STD_LOGIC(id(4) = acceptance_code_0(1)) OR acceptance_mask_0(1))) AND (CONV_STD_LOGIC(id(5) = acceptance_code_0(2)) OR acceptance_mask_0(2))) AND (CONV_STD_LOGIC(id(6) = acceptance_code_0(3)) OR acceptance_mask_0(3))) AND (CONV_STD_LOGIC(id(7) = acceptance_code_0(4)) OR acceptance_mask_0(4))) AND (CONV_STD_LOGIC(id(8) = acceptance_code_0(5)) OR acceptance_mask_0(5))) AND (CONV_STD_LOGIC(id(9) = acceptance_code_0(6)) OR acceptance_mask_0(6))) AND (CONV_STD_LOGIC(id(10) = acceptance_code_0(7)) OR acceptance_mask_0(7)) AND  rx_Buffer_full ;
    
    


   -- ID ok signal generation
   
   PROCESS (clk, rst)
   BEGIN
      IF (rst = '1') THEN
         id_MATCH <= '0';    
      ELSIF (clk'EVENT AND clk = '1') THEN
         IF (rx_id_lim = '1' ) THEN
            -- sample_point is already included in go_rx_RTR_lim
               id_MATCH <= match ;       
            END IF;
         END IF;

   END PROCESS;

END ARCHITECTURE RTL;