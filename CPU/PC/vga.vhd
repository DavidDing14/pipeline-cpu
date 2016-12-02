library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vga is
    Port(
        -- common port
        CLK: in std_logic; 
        RST: in std_logic;
        -- data 
          r0_i          : in  STD_LOGIC_VECTOR (15 downto 0);
          r1_i          : in  STD_LOGIC_VECTOR (15 downto 0);   
          r2_i          : in  STD_LOGIC_VECTOR (15 downto 0);
          r3_i          : in  STD_LOGIC_VECTOR (15 downto 0);   
          r4_i          : in  STD_LOGIC_VECTOR (15 downto 0);
         r5_i          : in  STD_LOGIC_VECTOR (15 downto 0);    
          r6_i          : in  STD_LOGIC_VECTOR (15 downto 0);
          r7_i          : in  STD_LOGIC_VECTOR (15 downto 0);   
          T_i           : in  STD_LOGIC_VECTOR (15 downto 0);
          IH_i          : in  STD_LOGIC_VECTOR (15 downto 0);
          SP_i          : in  STD_LOGIC_VECTOR (15 downto 0);
          PC_i           : in  STD_LOGIC_VECTOR (15 downto 0);
        -- vga port
        R: out std_logic_vector(2 downto 0) := "000";
        G: out std_logic_vector(2 downto 0) := "000";
        B: out std_logic_vector(2 downto 0) := "000";
        Hs: out std_logic := '0';
        Vs: out std_logic := '0'        
    );
end vga;

architecture Behavioral of vga is
    signal clk_signal: std_logic; -- div 50M to 25M
    signal vector_x : std_logic_vector(9 downto 0);     
    signal vector_y : std_logic_vector(8 downto 0);     
    signal r_signal : std_logic_vector(2 downto 0);
    signal g_signal : std_logic_vector(2 downto 0);
    signal b_signal : std_logic_vector(2 downto 0);
    signal hs_signal : std_logic;
    signal vs_signal : std_logic; 
    -- signal r0 :std_logic_vector(15 downto 0) := "1010101010101010";
    -- signal r1 :std_logic_vector(15 downto 0) := "1111111111110000";
    -- signal r2 :std_logic_vector(15 downto 0) := "0000111111110000";
    -- signal r3 :std_logic_vector(15 downto 0) := "0000111111110010";
    -- signal r4 :std_logic_vector(15 downto 0) := "1000111111110000";
    -- signal r5 :std_logic_vector(15 downto 0) := "0100111111110000";
    -- signal r6 :std_logic_vector(15 downto 0) := "0010111111110000";
    -- signal r7 :std_logic_vector(15 downto 0) := "0001111111110000";
    type matrix IS array (15 downto 0) of std_logic_vector (15 downto 0);
    signal zero : matrix := (
        "0000000000000000",
        "0000000000000000",
        "0000001111000000",
        "0000010000100000",
        "0000010000100000",
        "0000010001100000",
        "0000010010100000",
        "0000010100100000",
        "0000011000100000",
        "0000010000100000",
        "0000010000100000",
        "0000001111000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000"
    );
    
    signal one : matrix := (
         "0000000000000000",
         "0000000000000000",
         "0000000110000000",
         "0000001010000000",
         "0000000010000000",
         "0000000010000000",
         "0000000010000000",
         "0000000010000000",
         "0000000010000000",
         "0000000010000000",
         "0000001111100000",
         "0000000000000000",
         "0000000000000000",
         "0000000000000000",
         "0000000000000000",
         "0000000000000000"
    );
    signal symbolr : matrix := (
      "0000000000000000",
      "0000000000000000",
      "0000000011111100",
      "0000000010000010",
      "0000000010000010",
      "0000000010000010",
      "0000000011111100",
      "0000000010100000",
      "0000000010010000",
      "0000000010001000",
      "0000000010000100",
      "0000000010000010",
      "0000000000000000",
      "0000000000000000",
      "0000000000000000",
      "0000000000000000"
    );
    signal two : matrix := (
        "0000000000000000",
        "0000000000000000",
        "0000011111100000",
        "0000000000100000",
        "0000000000100000",
        "0000000000100000",
        "0000011111100000",
        "0000010000000000",
        "0000010000000000",
        "0000010000000000",
        "0000011111100000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000"
    );
    signal three : matrix := (
        "0000000000000000",
        "0000000000000000",
        "0000011111100000",
        "0000000000100000",
        "0000000000100000",
        "0000000000100000",
        "0000011111100000",
        "0000000000100000",
        "0000000000100000",
        "0000000000100000",
        "0000011111100000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000"
    );
    signal four : matrix := (
        "0000000000000000",
        "0000000000000000",
        "0000010000100000",
        "0000010000100000",
        "0000010000100000",
        "0000010000100000",
        "0000011111100000",
        "0000000000100000",
        "0000000000100000",
        "0000000000100000",
        "0000000000100000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000"
    );
    signal five : matrix := (
        "0000000000000000",
        "0000000000000000",
        "0000011111100000",
        "0000010000000000",
        "0000010000000000",
        "0000010000000000",
        "0000011111100000",
        "0000000000100000",
        "0000000000100000",
        "0000000000100000",
        "0000011111100000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000"
    );
    signal six : matrix := (
        "0000000000000000",
        "0000000000000000",
        "0000011111100000",
        "0000010000000000",
        "0000010000000000",
        "0000010000000000",
        "0000011111100000",
        "0000010000100000",
        "0000010000100000",
        "0000010000100000",
        "0000011111100000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000"
    );
    signal seven : matrix := (
        "0000000000000000",
        "0000000000000000",
        "0000011111100000",
        "0000000000100000",
        "0000000000100000",
        "0000000000100000",
        "0000000000100000",
        "0000000000100000",
        "0000000000100000",
        "0000000000100000",
        "0000000000100000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000"
    );
    signal symboli : matrix := (
        "0000000000000000",
        "0000000000000000",
        "0000000011110000",
        "0000000001100000",
        "0000000001100000",
        "0000000001100000",
        "0000000001100000",
        "0000000001100000",
        "0000000001100000",
        "0000000001100000",
        "0000000011110000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000"
    );
    signal symbolh : matrix := (
        "0000000000000000",
        "0000000000000000",
        "0000010000100000",
        "0000010000100000",
        "0000010000100000",
        "0000010000100000",
        "0000011111100000",
        "0000010000100000",
        "0000010000100000",
        "0000010000100000",
        "0000010000100000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000"
    );
    signal symbolt : matrix := (
        "0000000000000000",
        "0000000000000000",
        "0000001111111000",
        "0000000001000000",
        "0000000001000000",
        "0000000001000000",
        "0000000001000000",
        "0000000001000000",
        "0000000001000000",
        "0000000001000000",
        "0000000001000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000"
    );
    signal symbols : matrix := (
        "0000000000000000",
        "0000000000000000",
        "0000000011110000",
        "0000000110011000",
        "0000000100001000",
        "0000000010000000",
        "0000000001000000",
        "0000000000100000",
        "0000000000010000",
        "0000000100011000",
        "0000000110001000",
        "0000000011110000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000"
    );
    signal symbolp : matrix := (
        "0000000000000000",
        "0000000000000000",
        "0000011111000000",
        "0000010000100000",
        "0000010000100000",
        "0000010000100000",
        "0000011111000000",
        "0000010000000000",
        "0000010000000000",
        "0000010000000000",
        "0000010000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000"
    );
    signal symbolp2 : matrix := (
        "0000000000000000",
        "0000000000000000",
        "0000000111110000",
        "0000000100001000",
        "0000000100001000",
        "0000000100001000",
        "0000000111110000",
        "0000000100000000",
        "0000000100000000",
        "0000000100000000",
        "0000000100000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000"
    );
    signal symbolc : matrix := (
        "0000000000000000",
        "0000000000000000",
        "0000001111000000",
        "0000010000100000",
        "0000100000000000",
        "0000100000000000",
        "0000100000000000",
        "0000100000000000",
        "0000100000000000",
        "0000010000100000",
        "0000001111000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "0000000000000000"
    );
    
    begin
    process(CLK)
    begin
        if(CLK'event and CLK = '1') then
            clk_signal <= not clk_signal;
        end if;
    end process;


    process(clk_signal, RST) -- 行区间像素数 (800)
    begin
        if RST = '0' then
            vector_x <= (others => '0');
        elsif clk_signal'event and clk_signal = '1' then
            if vector_x = 799 then
                vector_x <= (others => '0');
            else
                vector_x <= vector_x + 1;
            end if;
        end if;
    end process;

    process(clk_signal, RST) -- 场区间行数 (525)
    begin
        if RST = '0' then
            vector_y <= (others => '0');
        elsif clk_signal'event and clk_signal = '1' then
            if vector_x = 799 then
                if vector_y = 524 then
                    vector_y <= (others => '0');
                else
                    vector_y <= vector_y + 1;
                end if;
            end if;
        end if;
    end process;

    process(clk_signal, RST) -- 行同步信号（640+消隐区：16空+96低+48空）
    begin
        if RST='0' then
            hs_signal <= '1';
        elsif clk_signal'event and clk_signal='1' then
            if vector_x >= 656 and vector_x < 752 then
                hs_signal <= '0';
            else
                hs_signal <= '1';
            end if;
        end if;
    end process;

    process(clk_signal, RST) -- 场同步信号（480+消隐区：10空+2低+33空）
    begin
        if RST = '0' then
            vs_signal <= '1';
        elsif clk_signal'event and clk_signal = '1' then
            if vector_y >= 490 and vector_y < 492 then
                vs_signal <= '0';
            else
                vs_signal <= '1';
            end if;
        end if;
    end process;

    process(clk_signal, RST)
    begin
        if RST = '0' then
            hs <= '0';
            vs <= '0';
        elsif clk_signal'event and clk_signal = '1' then
            hs <= hs_signal;
            vs <= vs_signal;
        end if;
    end process;

    process(RST, clk_signal, vector_x, vector_y) -- X, Y 坐标控制
    begin
        if RST = '0' then
            r_signal <= "000";
            g_signal <= "000";
            b_signal <= "000";
        elsif clk_signal'event and clk_signal = '1' then
            if vector_x > 639 or vector_y > 479 then
                r_signal <= "000";
                g_signal <= "000";
                b_signal <= "000";
                elsif vector_x > 144 and vector_x < 160 then
                    if vector_y > 15 and vector_y < 145 then
                        if(symbolr((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                      
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    elsif vector_y > 144 and vector_y < 161 then
                        if(symboli((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                      
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    elsif vector_y > 160 and vector_y < 177 then
                        if(symbols((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                      
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    elsif vector_y > 176 and vector_y < 193 then
                        if(symbolt((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                      
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    elsif vector_y > 192 and vector_y < 208 then
                        if(symbolp2((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                     
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    else
                        r_signal <= "000";
                        g_signal <= "000";
                        b_signal <= "000";
                    end if;
                elsif vector_x > 160 and vector_x < 176 then
                    if vector_y > 15 and vector_y < 32 then
                        if(zero((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                     
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    elsif vector_y > 32 and vector_y < 49 then
                        if(one((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                      
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    elsif vector_y > 48 and vector_y < 65 then
                        if(two((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                      
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    elsif vector_y > 64 and vector_y < 81 then
                        if(three((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                        
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    elsif vector_y > 80 and vector_y < 97 then
                        if(four((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                     
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    elsif vector_y > 96 and vector_y < 113 then
                        if(five((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                     
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    elsif vector_y > 112 and vector_y < 129 then
                        if(six((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                      
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    elsif vector_y > 128 and vector_y < 145 then
                        if(seven((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                        
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    elsif vector_y > 144 and vector_y < 161 then
                        if(symbolh((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                      
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    elsif vector_y > 160 and vector_y < 177 then
                        if(symbolp((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                      
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    elsif vector_y > 192 and vector_y < 209 then
                        if(symbolc((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                      
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    else
                        r_signal <= "000";
                        g_signal <= "000";
                        b_signal <= "000";
                    end if;
                elsif vector_y > 15 and vector_y < 32 and vector_x > 192 and vector_x < 448 then
                    if(r0_i(15 - ((conv_integer(vector_x)-192)/16)) = '0') then
                        if(zero((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                     
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    else
                        if(one((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                      
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    end if;
                elsif vector_y > 32 and vector_y < 49 and vector_x > 192 and vector_x < 448 then
                    if(r1_i(15 - ((conv_integer(vector_x)-192)/16)) = '0') then
                        if(zero((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                     
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    else
                        if(one((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                      
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    end if; 
                elsif vector_y > 48 and vector_y < 65 and vector_x > 192 and vector_x < 448 then
                    if(r2_i(15 - ((conv_integer(vector_x)-192)/16)) = '0') then
                        if(zero((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                     
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    else
                        if(one((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                      
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    end if; 
                elsif vector_y > 64 and vector_y < 81 and vector_x > 192 and vector_x < 448 then
                    if(r3_i(15 - ((conv_integer(vector_x)-192)/16)) = '0') then
                        if(zero((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                     
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    else
                        if(one((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                      
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    end if; 
                elsif vector_y > 80 and vector_y < 97 and vector_x > 192 and vector_x < 448 then
                    if(r4_i(15 - ((conv_integer(vector_x)-192)/16))= '0') then
                        if(zero((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                     
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    else
                        if(one((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                      
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    end if;
                elsif vector_y > 96 and vector_y < 113 and vector_x > 192 and vector_x < 448 then
                    if(r5_i(15 - ((conv_integer(vector_x)-192)/16)) = '0') then
                        if(zero((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                     
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    else
                        if(one((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                      
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    end if; 
                elsif vector_y > 112 and vector_y < 129 and vector_x > 192 and vector_x < 448 then
                    if(r6_i(15 - ((conv_integer(vector_x)-192)/16)) = '0') then
                        if(zero((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                     
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    else
                        if(one((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                      
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    end if;
                elsif vector_y > 128 and vector_y < 145 and vector_x > 192 and vector_x < 448 then
                    if(r7_i(15 - ((conv_integer(vector_x)-192)/16)) = '0') then
                        if(zero((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                     
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    else
                        if(one((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                      
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    end if; 
                elsif vector_y > 144 and vector_y < 161 and vector_x > 192 and vector_x < 448 then
                 if(IH_i(15 - ((conv_integer(vector_x)-192)/16)) = '0') then
                        if(zero((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                     
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    else
                        if(one((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                      
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    end if; 
                elsif vector_y > 160 and vector_y < 177 and vector_x > 192 and vector_x < 448 then
                    if(SP_i(15 - ((conv_integer(vector_x)-192)/16)) = '0') then
                        if(zero((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                     
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    else
                        if(one((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                      
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    end if;
                elsif vector_y > 176 and vector_y < 192 and vector_x > 192 and vector_x < 448 then
                    if(T_i(15 - ((conv_integer(vector_x)-192)/16)) = '0') then
                        if(zero((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                     
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    else
                        if(one((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                      
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    end if; 
                    elsif vector_y > 192 and vector_y < 209 and vector_x > 192 and vector_x < 448 then
                    if(PC_i(15 - ((conv_integer(vector_x)-192)/16)) = '0') then
                        if(zero((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                     
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    else
                        if(one((15-conv_integer(vector_y)) mod 16)((15-conv_integer(vector_x)) mod 16) = '1') then                      
                            r_signal <= "000";
                            g_signal <= "111";
                            b_signal <= "000";
                        else 
                            r_signal <= "000";
                            g_signal <= "000";
                            b_signal <= "000";
                        end if;
                    end if; 
                else 
                    r_signal <= "000";
                    g_signal <= "000";
                    b_signal <= "000";
                end if;
            end if;
    end process;

    process(hs_signal, vs_signal, r_signal, g_signal, b_signal) -- 色彩输出
    begin
        if hs_signal = '1' and vs_signal = '1' then
            R <= r_signal;
            G <= g_signal;
            B <= b_signal;
        else
            R <= (others => '0');
            G <= (others => '0');
            B <= (others => '0');
        end if;
    end process;

end Behavioral;