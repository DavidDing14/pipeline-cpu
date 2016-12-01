----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:26:00 11/22/2016 
-- Design Name: 
-- Module Name:    MemoryUnit - Behavioral 
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

entity MemoryUnit is
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
end MemoryUnit;

architecture Behavioral of MemoryUnit is
	shared variable RegIns: std_logic_vector(15 downto 0):="0000000000000000";
	shared variable RegData: std_logic_vector(15 downto 0):="0000000000000000";
	--signal state : std_logic_vector(1 downto 0) := "00";
	signal state : integer range 0 to 5 := 0;
	signal rflag : std_logic := '0';		--是什么？黑科技般的存在
begin
	
	--ram1专门作串口
	ram1_en <= '1';
	ram1_oe <= '1';
	ram1_we <= '1';
	ram1_addr(17 downto 0) <= (others => '0');
	--ram2读写内存
	ram2_en <= '0';
	ram2_addr(17 downto 16) <= "00";
	
	process(clk, rst)
	begin
		if rst = '0' then
			
			ram2_oe <= '1';
			ram2_we <= '1';
			wrn <= '1';
			rdn <= '1';
			rflag <= '0';
			
			ram1_addr <= (others => '0'); --可不要？？
			ram2_addr <= (others => '0'); --可不要？？
			
			RegIns := "0000000000000000";
			RegData := "0000000000000000";
			
			state <= 0;
			
		elsif clk'event and clk = '1' then 
			
			case state is 
				when 0 =>
					state <= 1;
					
				when 1 =>		--准备读指令
					ram2_data <= (others => 'Z');
					ram2_addr(15 downto 0) <= PC;
					wrn <= '1';
					rdn <= '1';
					ram2_oe <= '0';
					state <= 2;
					
				when 2 =>		--读出指令，准备读/写 串口/内存
					ram2_oe <= '1';
					RegIns := ram2_data;
					if (Control_MEM = "11") then	--如果要写
						rflag <= '0';
						if (ramAddr = x"BF00") then 	--准备写串口
							ram1_data(7 downto 0) <= dataIn(7 downto 0);
							wrn <= '0';
						else							--准备写内存
							ram2_addr(15 downto 0) <= ramAddr;
							ram2_data <= dataIn;
							ram2_we <= '0';
						end if;
					elsif (Control_MEM = "01") then	--如果要读
						if (ramAddr = x"BF01") then 	--准备读串口状态
							RegData(15 downto 2) := (others => '0');
							RegData(1) := data_ready;
							RegData(0) := tsre and tbre;
							if (rflag = '0') then
								ram1_data <= (others => 'Z');
								rflag <= '1';
							end if;
						elsif (ramAddr = x"BF00") then	--准备读串口数据
							rflag <= '0';
							rdn <= '0';
						else							--准备读内存
							ram2_data <= (others => 'Z');
							ram2_addr(15 downto 0) <= ramAddr;
							ram2_oe <= '0';
						end if;
					end if;	
					state <= 3;
					
				when 3 =>		--读/写 串口/内存
					if(Control_MEM = "11") then		--写
						if (ramAddr = x"BF00") then		--写串口
							wrn <= '1';
						else							--写内存
							ram2_we <= '1';
						end if;
					elsif(Control_MEM = "01") then	--读
						if (ramAddr = x"BF01") then		--读串口状态（已读出）
							null;
						elsif (ramAddr = x"BF00") then 	--读串口数据
							rdn <= '1';
							RegData(15 downto 8) := (others => '0');
							RegData(7 downto 0) := ram1_data(7 downto 0);
						else							--读内存
							ram2_oe <= '1';
							RegData := ram2_data;
						end if;
					end if;
					state <= 4;
				when 4 =>
					state <= 5;
					
				when 5 =>		--准备读指令
					ram2_data <= (others => 'Z');
					ram2_addr(15 downto 0) <= PC;
					wrn <= '1';
					rdn <= '1';
					ram2_oe <= '0';
					state <= 0;	
				when others =>
					state <= 0;
					
			end case;
		end if;
		dataOut<=RegData;
		insOut<=RegIns;
	end process;
end Behavioral;

