LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;

entity CAN_Bit_Timing_Logic_test is
end CAN_Bit_Timing_Logic_test ;

architecture  arch_CAN_Bit_Timing_Logic_test of CAN_Bit_Timing_Logic_test is 

component CAN_Bit_Timing_Logic
   PORT (
       -- IN CLK PRESCLEER -- 
     
      clk                         : IN std_logic; 
      TQ_clk                      : IN std_logic;
       -- IN CONTROLLER INTERFACE --   
      RESET                       : IN std_logic;
       -- OUT/IN TRANCEIBVER CAN BUS -- 
      RxCan                       : IN std_logic;   
      TxCan                       : out std_logic;
      -- Bit Timing Conf --
      time_reg                : IN std_logic_vector(15 DOWNTO 0);
      -- OUT/IN BSM -- 
      sample_point            : OUT std_logic;     
      busmon                  : OUT std_logic;   
      hard_sync_enable        : in std_logic;
      bit_err                 : out std_logic; 
      bus_drive               : in std_logic
      );
end component ;
        
signal      clk :  std_logic; 
signal      TQ_clk                      :  std_logic;
 signal      RESET                       :  std_logic;
  signal     RxCan                       : std_logic;   
signal       TxCan                       :  std_logic;             --  2*    6** 3** 3*  
 signal      time_reg                :  std_logic_vector(15 DOWNTO 0):="0100100000100010";
 signal      sample_point            :  std_logic;     
 signal      busmon                  :  std_logic;   
  signal     hard_sync_enable        :  std_logic:='0';
   signal    bit_err                 :  std_logic;   
 signal    bus_drive                 :  std_logic:='1'; 
constant clk_period: time :=100 ps;

signal test_packet: std_logic_vector( 7 downto 0):="01011100";
begin
  TQ_clk<=clk;
  btl_instance: CAN_Bit_Timing_Logic port map( clk=>clk, TQ_clk=>TQ_clk, RESET=>RESET, RxCan=>RxCan, TxCan=>TxCan, time_reg=>time_reg,
						 sample_point=>sample_point, busmon=>busmon, hard_sync_enable=>hard_sync_enable,
						 bus_drive=>bus_drive,bit_err=>bit_err);
    --generating the clock signal 
    clk_process :process
    begin
	clk <= '0';
	wait for clk_period/2;  
	clk <= '1';
	wait for clk_period/2;
    end process;

       testing_process:process
	begin
	RESET<='1';
	wait for 5*clk_period;
	--test reception
	RESET<='0';
	hard_sync_enable<='0';
	for i in 0 to 7 loop
		RxCan<=test_packet(7-i);
		wait for 10*clk_period;	
	end loop;

	RESET<='1';
	wait for clk_period;
	RESET<='0';
	wait for clk_period;
	--test transmission
	for j in 0 to 7 loop
		RxCan<=test_packet(7-j);
		bus_drive<=test_packet(7-j);
		wait for 10*clk_period;
	end loop;
	--test a transmission error
	for j in 0 to 7 loop
		RxCan<=not test_packet(7-j);
		bus_drive<=test_packet(7-j);
		wait for 10*clk_period;
	end loop;
	end process;
end architecture;