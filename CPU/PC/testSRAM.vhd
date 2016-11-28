----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:55:51 11/28/2016 
-- Design Name: 
-- Module Name:    testSRAM - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testSRAM is
	Port (
		clk : in  STD_LOGIC;
		rst : in  STD_LOGIC;
		
		MEM_Ry : in  STD_LOGIC_VECTOR (15 downto 0);	--MEM阶段送来的Ry的值，可能写回MEM[Addr]
		
		--Control_MEM : in  STD_LOGIC_VECTOR (1 downto 0);	--控制访问IR/DR以及访问DR的读/写
		
		--outData : out  STD_LOGIC_VECTOR (15 downto 0);	--从RAM1那条线读出来的数据作为数据传给寄存器堆
		outinstruction : out  STD_LOGIC_VECTOR (15 downto 0);	--从RAM2读出来的数据作为指令
		
		ram1data : inout  STD_LOGIC_VECTOR (15 downto 0);
		ram2data : inout  STD_LOGIC_VECTOR (15 downto 0);
		ram1addr : out  STD_LOGIC_VECTOR (17 downto 0);
		ram2addr : out  STD_LOGIC_VECTOR (17 downto 0);
		
		ram1oe : out  STD_LOGIC;
		ram1we : out  STD_LOGIC;
		ram1en : out  STD_LOGIC;
		
		ram2oe : out  STD_LOGIC;
		ram2we : out  STD_LOGIC;
		ram2en : out  STD_LOGIC
	);
end testSRAM;

architecture Behavioral of testSRAM is
	component MEM
		Port ( 
			clk	: in	STD_LOGIC;	--时钟信号，访问读写
			rst: in std_logic;
			
			PC : in  STD_LOGIC_VECTOR (15 downto 0);	--指令地址
			MEMAddr : in  STD_LOGIC_VECTOR (15 downto 0);	--访存地址
			
			MEM_Ry : in  STD_LOGIC_VECTOR (15 downto 0);	--MEM阶段送来的Ry的值，可能写回MEM[Addr]
			
			Control_MEM : in  STD_LOGIC_VECTOR (1 downto 0);	--控制访问IR/DR以及访问DR的读/写
			
			outData : out  STD_LOGIC_VECTOR (15 downto 0);	--从RAM1那条线读出来的数据作为数据传给寄存器堆
			outinstruction : out  STD_LOGIC_VECTOR (15 downto 0);	--从RAM2读出来的数据作为指令
			
			ram1data : inout  STD_LOGIC_VECTOR (15 downto 0);
			ram2data : inout  STD_LOGIC_VECTOR (15 downto 0);
			ram1addr : out  STD_LOGIC_VECTOR (17 downto 0);
			ram2addr : out  STD_LOGIC_VECTOR (17 downto 0);
			
			ram1oe : out  STD_LOGIC;
			ram1we : out  STD_LOGIC;
			ram1en : out  STD_LOGIC;
			
			ram2oe : out  STD_LOGIC;
			ram2we : out  STD_LOGIC;
			ram2en : out  STD_LOGIC 
		);
	end component;
	signal myPC : std_logic_vector(15 downto 0) := "0000000000000011";
	signal myMEMAddr : std_logic_vector(15 downto 0) := "0000000000000001";
	signal myCtrl : std_logic_vector(1 downto 0) := "00";
	signal myoutData : std_logic_vector(15 downto 0);
begin
	uut: MEM PORT MAP(clk, rst, myPC, myMEMAddr, MEM_Ry, myCtrl, myoutData, outinstruction,
		ram1data, ram2data, ram1addr, ram2addr, ram1oe, ram1we, ram1en, ram2oe, ram2we, ram2en);

end Behavioral;

