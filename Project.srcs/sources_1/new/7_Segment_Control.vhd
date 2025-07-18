library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Segment_Control is
    Port ( 
        Clk      : in STD_LOGIC;
        Dig0     : in STD_LOGIC_VECTOR(3 downto 0);
        Dig1     : in STD_LOGIC_VECTOR(3 downto 0);
        Dig2     : in STD_LOGIC_VECTOR(3 downto 0);
        Dig3     : in STD_LOGIC_VECTOR(3 downto 0);
        Anodes   : out STD_LOGIC_VECTOR(3 downto 0);
        Segments : out STD_LOGIC_VECTOR(6 downto 0);
    );
end Segment_Control;

architecture behavioral of 7_Segment_Control is
    signal digit_select : INTEGER range 0 to 3 := 0;
    constant refresh_rate : INTEGER := 5000;
    signal refresh_counter : INTEGER := 0;

    function digit_to_segments (digit : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
        variable digit_int : INTEGER; 
    begin
        digit_int := to_integer(unsigned(digit));
        case digit_int is
            when 0 => return Not "0111111";
            when 1 => return Not "0000110";
            when 2 => return Not "1011011";
            when 3 => return Not "1001111";
            when 4 => return Not "1100110";
            when 5 => return Not "1101101";
            when 6 => return Not "1111101";
            when 7 => return Not "0000111";
            when 8 => return Not "1111111";
            when 9 => return Not "1101111";
            when others => return Not "0000000";
        end case;
    end digit_to_segments;

begin
    process(Clk)
    begin
        if rising_edge(Clk) then
            if refresh_counter = refresh_rate then
                refresh_counter <= 0;
                digit_select <= (digit_select + 1) mod 4;
            else
                refresh_counter <= refresh_counter + 1;
            end if;
        end if;
    end process;

    process(digit_select)
    begin
        case digit_select is
            when 0 =>
                Anodes <= "1110";
                Segments <= digit_to_segments(Dis0);
            when 1 =>
                Anodes <= "1101";
                Segments <= digit_to_segments(Dis1);
            when 2 =>
                Anodes <= "1011";
                Segments <= digit_to_segments(Dis2);
            when 3 =>
                Anodes <= "0111";
                Segments <= digit_to_segments(Dis3);
            when others =>
                Anodes <= "1111";
                Segments <= "0000000";
        end case;
    end process;
end behavioral;