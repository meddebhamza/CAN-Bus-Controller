--// TX Registers
--
--
--8bit / TXCTRL: ? ABTF MLOA TXERR TXREQ  ? ? ?
--
--8bit / TXSIDH : SID10 SID9 SID8 SID7 SID6 SID5 SID4 SID3
--8bit / TXSIDL : SID2 SID1 SID0 ? ? ? ? ? 
--
--8bit / TXDLC : ? RTR ? ? DLC3 DLC2 DLC1 DLC0
--
--8bit / TXD1 : TXD17 TXD16 TXD15 TXD14 TXD13 TXD12 TXD11 TXD10 
--8bit / TXD2 : TXD27 TXD26 TXD25 TXD24 TXD23 TXD22 TXD21 TXD20 
--8bit / TXD3 : TXD37 TXD36 TXD35 TXD34 TXD33 TXD32 TXD31 TXD30 
--8bit / TXD4 : TXD47 TXD46 TXD45 TXD44 TXD43 TXD42 TXD41 TXD40 
--8bit / TXD5 : TXD57 TXD56 TXD55 TXD54 TXD53 TXD52 TXD51 TXD50 
--8bit / TXD6 : TXD67 TXD66 TXD65 TXD64 TXD63 TXD62 TXD61 TXD60 
--8bit / TXD7 : TXD77 TXD76 TXD75 TXD74 TXD73 TXD72 TXD71 TXD70 
--8bit / TXD8 : TXD87 TXD86 TXD85 TXD84 TXD83 TXD82 TXD81 TXD80 
--
--
--
--
--// RX Registers
--
--
--8bit / RXCTRL : ? RXM ? ? RXRTR ? RXBFULL ? 
--
--8bit / RXFSID : fid0 .. fid7
--
--8bit / RXMSID : mid0 .. mid7 
--
--8bit / RXSIDH : SID10 SID9 SID8 SID7 SID6 SID5 SID4 SID3
--8bit / RXSIDL : SID2 SID1 SID0 ? ? ? ? ? 
--
--
--8bit / RXDLC : ? ? ? ? DLC3 DLC2 DLC1 DLC0
--
--8bit / RXD1 : RXD17 RXD16 RXD15 RXD14 RXD13 RXD12 RXD11 RXD10 
--8bit / RXD2 : RXD27 RXD26 RXD25 RXD24 RXD23 RXD22 RXD21 RXD20 
--8bit / RXD3 : RXD37 RXD36 RXD35 RXD34 RXD33 RXD32 RXD31 RXD30 
--8bit / RXD4 : RXD47 RXD46 RXD45 RXD44 RXD43 RXD42 RXD41 RXD40 
--8bit / RXD5 : RXD57 RXD56 RXD55 RXD54 RXD53 RXD52 RXD51 RXD50 
--8bit / RXD6 : RXD67 RXD66 RXD65 RXD64 RXD63 RXD62 RXD61 RXD60 
--8bit / RXD7 : RXD77 RXD76 RXD75 RXD74 RXD73 RXD72 RXD71 RXD70 
--8bit / RXD8 : RXD87 RXD86 RXD85 RXD84 RXD83 RXD82 RXD81 RXD80 
--
--
--
--
--
--//CAN Control Register
--
--8bit / CANCTRL :  REQOP0 ? ? ABAT OSM ? ? ? 
--8bit / CANSTAT :  OPMOD0 BusBusy TXing RXing ? ? ?  
--
--
--
--
--//Bit Time Configuration Registers
--
--8bit / CNF1 : SJW1 SJW0 BRP5 BRP4 BRP3 BRP2 BRP1 BRP0
--
--
--8bit / CNF2 : PHSEG13  PHSEG12 PHSEG11 PHSEG10 ? PHSEG22 PHSEG21 PHSEG20
--
--
--
--
--// Errors Registers
--
--8bit / TEC : TEC7 TEC6 TEC5 TEC4 TEC3 TEC2 TEC1 TEC0
--
--8bit / REC : REC7 REC6 REC5 REC4 REC3 REC2 REC1 REC0



LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

ENTITY can_registers IS
  PORT ( 
  
    -- OUTPUT FOR WRITE -- 
    
  TXCTRL_out   : out std_logic_vector(7 downto 0 );
  TXSID_out    : out std_logic_vector(10 downto 0 );
  TXDLC_out    : out std_logic_vector(7 downto 0 );
  TXDatah_out   : out std_logic_vector(31 downto 0 );
  TXDatal_out   : out std_logic_vector(31 downto 0 );
  
  
  RXCTRL_out  : out std_logic_vector(7 downto 0 );
  RXFSID_out  : out std_logic_vector(7 downto 0 );
  RXMSID_out   : out std_logic_vector(7 downto 0 );
  RXSID_out    : out std_logic_vector(10 downto 0 );
  RXDLC_out    : out std_logic_vector(7 downto 0 );
  RXDatah_out   : out std_logic_vector(31 downto 0 );
  RXDatal_out   : out std_logic_vector(31 downto 0 );
  
  
  CANCTRL_out  : out std_logic_vector(7 downto 0 );
  CANSTAT_out  : out std_logic_vector(7 downto 0 );
  
  BTC_out : out std_logic_vector(15 downto 0 );
  
  TEC_out : out std_logic_vector(7 downto 0 );
  REC_out : out std_logic_vector(7 downto 0 );
  
  -- INPUT FOR WRITE --
   
  TXCTRL_in   : in std_logic_vector(7 downto 0 );
  TXSID_in    : in std_logic_vector(10 downto 0 );
  TXDLC_in    : in std_logic_vector(7 downto 0 );
  TXDatah_in   : in std_logic_vector(31 downto 0 );
  TXDatal_in   : in std_logic_vector(31 downto 0 );
  
  RXCTRL_in  : in std_logic_vector(7 downto 0 );
  RXFSID_in  : in std_logic_vector(7 downto 0 );
  RXMSID_in   : in std_logic_vector(7 downto 0 );
  RXSID_in    : in std_logic_vector(10 downto 0 );
  RXDLC_in    : in std_logic_vector(7 downto 0 );
  RXDatah_in   : in std_logic_vector(31 downto 0 );
  RXDatal_in   : in std_logic_vector(31 downto 0 );
  
  
  CANCTRL_in  : in std_logic_vector(7 downto 0 );
  CANSTAT_in  : in std_logic_vector(7 downto 0 );
  
  BTC_in : in std_logic_vector(15 downto 0 );
  
  TEC_in : in std_logic_vector(7 downto 0 );
  REC_in : in std_logic_vector(7 downto 0 );
  
  
  -- INPUT FOR Write Enable  --
  
  TXCTRL_we   : in std_logic;
  TXSID_we    : in std_logic;
  TXDLC_we    : in std_logic;
  TXDatah_we   : in std_logic;
  TXDatal_we   : in std_logic;
  
  
  RXCTRL_we    : in std_logic;
  RXFSID_we    : in std_logic;
  RXMSID_we    : in std_logic;
  RXSID_we     : in std_logic;
  RXDLC_we     : in std_logic;
  RXDatah_we   : in std_logic;
  RXDatal_we   : in std_logic;
  
  CANCTRL_we   : in std_logic;
  CANSTAT_we   : in std_logic;
  
  BTC_we : in std_logic;
  
  TEC_we : in std_logic;
  REC_we : in std_logic;
  
  -- INPUT FOR CLK & Rst --
  
  clk : in std_logic ;
  RST : IN STD_LOGIC);
END  can_registers;


ARCHITECTURE RTL OF can_registers IS
    constant size_8 : integer:=8;
    constant size_11 : integer:=11;
    constant size_32 : integer:=32;
    constant size_16 : integer:=16;
     
  component can_register is
   GENERIC (
      WIDTH                          :  integer := 8);    --  default parameter of the register width
   PORT (
      data_in                 : IN std_logic_vector(WIDTH - 1 DOWNTO 0);   
      data_out                : OUT std_logic_vector(WIDTH - 1 DOWNTO 0);   
      we                      : IN std_logic;  
      clk                     : IN std_logic;
      rst_async               : IN std_logic);
         
end component; 

    
  BEGIN

       
  

  TXCTRL   : can_register generic map(WIDTH => size_8 ) port map(data_in=>TXCTRL_in,data_out=>TXCTRL_out,we =>TXCTRL_we,clk=> clk,rst_async=> RST);

  TXSID    : can_register generic map(WIDTH => size_11 ) port map(data_in=>TXSID_in,data_out=>TXSID_out,we =>TXSID_we,clk=> clk,rst_async=> RST);

  TXDLC    : can_register generic map(WIDTH => size_8 ) port map(data_in=>TXDLC_in,data_out=>TXDLC_out,we =>TXDLC_we,clk=> clk,rst_async=> RST);

  TXDatah   : can_register generic map(WIDTH => size_32 ) port map(data_in=>TXDatah_in,data_out=>TXDatah_out,we =>TXDatah_we,clk=> clk,rst_async=> RST);

  TXDatal   : can_register generic map(WIDTH => size_32 ) port map(data_in=>TXDatal_in,data_out=>TXDatal_out,we =>TXDatal_we,clk=> clk,rst_async=> RST);

  
  RXCTRL  : can_register generic map(WIDTH => size_8 ) port map(data_in=>RXCTRL_in,data_out=>RXCTRL_out,we =>RXCTRL_we,clk=> clk,rst_async=> RST);

  RXFSID  : can_register generic map(WIDTH => size_8 ) port map(data_in=>RXFSID_in,data_out=>RXFSID_out,we =>RXFSID_we,clk=> clk,rst_async=> RST);

  RXMSID   : can_register generic map(WIDTH => size_8 ) port map(data_in=>RXMSID_in,data_out=>RXMSID_out,we =>RXMSID_we,clk=> clk,rst_async=> RST);

  RXSID    : can_register generic map(WIDTH => size_11 ) port map(data_in=>RXSID_in,data_out=>RXSID_out,we =>RXSID_we,clk=> clk,rst_async=> RST);

  RXDLC    : can_register generic map(WIDTH => size_8 ) port map(data_in=>RXDLC_in,data_out=>RXDLC_out,we =>RXDLC_we,clk=> clk,rst_async=> RST);

  RXDatah   : can_register generic map(WIDTH => size_32 ) port map(data_in=>RXDatah_in,data_out=>RXDatah_out,we =>RXDatah_we,clk=> clk,rst_async=> RST);

  RXDatal   : can_register generic map(WIDTH => size_32 ) port map(data_in=>RXDatal_in,data_out=>RXDatal_out,we =>RXDatal_we,clk=> clk,rst_async=> RST);

  
  
  CANCTRL  : can_register generic map(WIDTH => size_8 ) port map(data_in=>CANCTRL_in,data_out=>CANCTRL_out,we =>CANCTRL_we,clk=> clk,rst_async=> RST);

  CANSTAT  : can_register generic map(WIDTH => size_8 ) port map(data_in=>CANSTAT_in,data_out=>CANSTAT_out,we =>CANSTAT_we,clk=> clk,rst_async=> RST);

  
  BTC : can_register generic map(WIDTH => size_16 ) port map(data_in=>BTC_in,data_out=>BTC_out,we =>BTC_we,clk=> clk,rst_async=> RST);

  
  TEC : can_register generic map(WIDTH => size_8 ) port map(data_in=>TEC_in,data_out=>TEC_out,we =>TEC_we,clk=> clk,rst_async=> RST);

  REC : can_register generic map(WIDTH => size_8 ) port map(data_in=>REC_in,data_out=>REC_out,we =>REC_we,clk=> clk,rst_async=> RST);





END ARCHITECTURE RTL;




