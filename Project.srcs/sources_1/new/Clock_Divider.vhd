library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Clock_Divider is
    Port ( Clk : in STD_LOGIC;
           Clk_LEDs : out STD_LOGIC;
end Clock_Divider;

architecture Behavioral of Clock_Divider is
    signal clk_div : INTEGER := 0;
    signal clk_reg : STD_LOGIC := '0';
begin
    
    -- LEDs Clock
    process(Clk)
    begin
        if rising_edge(Clk) then
            if clk_div = 999999999 then  -- 100 MHz / 2000,000,000 = 0.05 Hz (20 seconds)
                clk_reg <= not clk_reg;
                clk_div <= 0;
            else
                clk_div <= clk_div + 1;
            end if;
        end if;
    end process;

    Clk_LEDs <= clk_reg;
    
end Behavioral;
