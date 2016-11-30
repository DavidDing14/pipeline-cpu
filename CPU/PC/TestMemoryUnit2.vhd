----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:14:46 11/29/2016 
-- Design Name: 
-- Module Name:    TestMemoryUnit2 - Behavioral 
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

entity TestMemoryUnit2 is
	port(
		--时钟
		clk : in std_logic;
		rst : in std_logic;
		
		--RAM1（串口）
		data_ready : in std_logic;		--数据准备信号，='1'表示串口的数据已准备好（读串口成功，可显示读到的data）
		tbre : in std_logic;				--发送数据标志
		tsre : in std_logic;				--数据发送完毕标志，tsre and tbre = '1'时写串口完毕
		wrn : out std_logic;				--写串口，初始化为'1'，先置为'0'并把RAM1data赋好，再置为'1'写串口
		rdn : out std_logic;				--读串口，初始化为'1'并将RAM1data赋为"ZZ..Z"，
												--若data_ready='1'，则把rdn置为'0'即可读串口（读出数据在RAM1data上）
		
		--RAM2（IM+DM）
		--Control_MEM : in std_logic_vector(1 downto 0);
		
		--dataIn : in std_logic_vector(15 downto 0);		--写内存时，要写入DM或IM的数据
		
		--ramAddr : in std_logic_vector(15 downto 0);		--读DM/写DM/写IM时，地址输入
		--PC : in std_logic_vector(15 downto 0);			--读IM时，地址输入
		--dataOut : out std_logic_vector(15 downto 0);	--读DM时，读出来的数据/读出的串口状态
		insOut : out std_logic_vector(15 downto 0);		--读IM时，出来的指令
		
		ram1_addr : out std_logic_vector(17 downto 0); 	--RAM1地址总线
		ram2_addr : out std_logic_vector(17 downto 0); 	--RAM2地址总线
		ram1_data : inout std_logic_vector(15 downto 0);--RAM1数据总线
		ram2_data : inout std_logic_vector(15 downto 0);--RAM2数据总线
		
		ram1_en : out std_logic;		--RAM1使能，='1'禁止，永远等于'1'
		ram1_oe : out std_logic;		--RAM1读使能，='1'禁止，永远等于'1'
		ram1_we : out std_logic;		--RAM1写使能，='1'禁止，永远等于'1'
		
		ram2_en : out std_logic;		--RAM2使能，='1'禁止，永远等于'0'
		ram2_oe : out std_logic;		--RAM2读使能，='1'禁止
		ram2_we : out std_logic			--RAM2写使能，='1'禁止
		
		
	);
end TestMemoryUnit2;

architecture Behavioral of TestMemoryUnit2 is
component MemoryUnit
	port(
		--时钟
		clk : in std_logic;
		rst : in std_logic;
		
		--RAM1（串口）
		data_ready : in std_logic;		--数据准备信号，='1'表示串口的数据已准备好（读串口成功，可显示读到的data）
		tbre : in std_logic;				--发送数据标志
		tsre : in std_logic;				--数据发送完毕标志，tsre and tbre = '1'时写串口完毕
		wrn : out std_logic;				--写串口，初始化为'1'，先置为'0'并把RAM1data赋好，再置为'1'写串口
		rdn : out std_logic;				--读串口，初始化为'1'并将RAM1data赋为"ZZ..Z"，
												--若data_ready='1'，则把rdn置为'0'即可读串口（读出数据在RAM1data上）
		
		--RAM2（IM+DM）
		Control_MEM : in std_logic_vector(1 downto 0);
		
		dataIn : in std_logic_vector(15 downto 0);		--写内存时，要写入DM或IM的数据
		
		ramAddr : in std_logic_vector(15 downto 0);		--读DM/写DM/写IM时，地址输入
		PC : in std_logic_vector(15 downto 0);			--读IM时，地址输入
		dataOut : out std_logic_vector(15 downto 0);	--读DM时，读出来的数据/读出的串口状态
		insOut : out std_logic_vector(15 downto 0);		--读IM时，出来的指令
		
		ram1_addr : out std_logic_vector(17 downto 0); 	--RAM1地址总线
		ram2_addr : out std_logic_vector(17 downto 0); 	--RAM2地址总线
		ram1_data : inout std_logic_vector(15 downto 0);--RAM1数据总线
		ram2_data : inout std_logic_vector(15 downto 0);--RAM2数据总线
		
		ram1_en : out std_logic;		--RAM1使能，='1'禁止，永远等于'1'
		ram1_oe : out std_logic;		--RAM1读使能，='1'禁止，永远等于'1'
		ram1_we : out std_logic;		--RAM1写使能，='1'禁止，永远等于'1'
		
		ram2_en : out std_logic;		--RAM2使能，='1'禁止，永远等于'0'
		ram2_oe : out std_logic;		--RAM2读使能，='1'禁止
		ram2_we : out std_logic			--RAM2写使能，='1'禁止
	);
end component;

signal mydataOut : std_logic_vector(15 downto 0);
signal myControl : std_logic_vector(1 downto 0) := "01";
signal mydataIn : std_logic_vector(15 downto 0) := "1010101010101010";
signal myramAddr : std_logic_vector(15 downto 0) := "0000010001111011";
signal myPC : std_logic_vector(15 downto 0) := "0000000001111010";
begin
	uut : MemoryUnit PORT MAP(clk, rst, data_ready, tbre, tsre, wrn, rdn, 
	myControl, mydataIn, myramAddr, myPC, mydataOut, insOut, 
	ram1_addr, ram2_addr, ram1_data, ram2_data, ram1_en, ram1_oe, ram1_we, ram2_en, ram2_oe, ram2_we);

end Behavioral;

