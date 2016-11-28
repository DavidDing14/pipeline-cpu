----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:15:37 11/27/2016 
-- Design Name: 
-- Module Name:    MEM - Behavioral 
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

entity MEM is
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
end MEM;

architecture Behavioral of MEM is
shared variable Reginstruction: std_logic_vector(15 downto 0):="0000000000000000";
shared variable RegData: std_logic_vector(15 downto 0):="0000000000000000";
signal state : integer range 0 to 3 := 0;
begin
	ram1en<='0';
	ram2en<='0';
	
	ram1addr(17 downto 16)<="00";
	ram2addr(17 downto 16)<="00";
	
	process(clk, rst)
	begin
		if rst='0' then
			state <= 0;
			ram1oe <= '1';
			ram1we <= '1';
			ram1addr <= (others => '0');
			
			ram2oe <= '1';
			ram2we <= '1';
			ram2addr <= (others => '0');
			
			Reginstruction := "0000000000000000";
			RegData := "0000000000000000";
		elsif clk'event and clk='1' then
			case state is
				when 0 =>
					state <= 1;
				when 1 => -- 读指令
					ram2data <= (others => 'Z');
					ram2addr(15 downto 0) <= PC;
					ram2oe <= '0';
					state <= 2;
				when 2 =>
					ram2oe <= '1';
					Reginstruction := ram2data;
					if (Control_MEM = "11") then	--准备写内存
						ram1addr(15 downto 0) <= MEMAddr;
						ram1data <= MEM_Ry;
						ram1we <= '0';
					elsif (Control_MEM = "01") then	--准备读内存
						ram1data <= (others => 'Z');
						ram1addr(15 downto 0) <= MEMAddr;
						ram1oe <= '0';
					end if;
					state <= 3;
				when 3 =>
					if(Control_MEM = "11") then--写内存
						ram1we <= '1';
					elsif(Control_MEM = "01") then	--读内存
						ram1oe <= '1';
						RegData := ram1data;
					end if;
					state <= 0;
				when others =>
					state <= 0;
			end case;
		end if;
		outData<=RegData;
		outinstruction<=Reginstruction;
	end process;

end Behavioral;

