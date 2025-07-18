library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Main_tb is
-- Testbench has no ports
end Main_tb;

architecture Behavioral of Main_Testbench is

    -- Component declaration for the DUT (Device Under Test)
    component Main
        Port (
            Clk        : in STD_LOGIC;
            Reset      : in STD_LOGIC;
            Data_Line  : inout STD_LOGIC;
            Echo       : in STD_LOGIC;
            Trig       : out STD_LOGIC;
            Alarm      : out STD_LOGIC;
            Red        : out STD_LOGIC;
            Yellow     : out STD_LOGIC;
            Green      : out STD_LOGIC;
            Anodes     : out STD_LOGIC_VECTOR(3 downto 0);
            Segments   : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;

    -- Signals to connect to DUT
    signal Clk        : STD_LOGIC := '0';
    signal Reset      : STD_LOGIC := '0';
    signal Data_Line  : STD_LOGIC := 'Z'; -- Tri-state for bidirectional signal
    signal Echo       : STD_LOGIC := '0';
    signal Trig       : STD_LOGIC;
    signal Alarm      : STD_LOGIC;
    signal Red        : STD_LOGIC;
    signal Yellow     : STD_LOGIC;
    signal Green      : STD_LOGIC;
    signal Anodes     : STD_LOGIC_VECTOR(3 downto 0);
    signal Segments   : STD_LOGIC_VECTOR(6 downto 0);

    -- Clock period constant
    constant CLK_PERIOD : time := 10 ns;

begin

    -- Instantiate the DUT
    DUT: Main
        Port map (
            Clk => Clk,
            Reset => Reset,
            Data_Line => Data_Line,
            Echo => Echo,
            Trig => Trig,
            Alarm => Alarm,
            Red => Red,
            Yellow => Yellow,
            Green => Green,
            Anodes => Anodes,
            Segments => Segments
        );

    -- Clock generation
    Clk_process: process
    begin
        while true loop
            Clk <= '0';
            wait for CLK_PERIOD / 2;
            Clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    -- Stimulus process
    Stimulus_process: process
    begin
        -- Reset the system
        Reset <= '1';
        wait for 20 ns;
        Reset <= '0';
        
        -- Simulate Data_Line activity for Temp_Sensor
        Data_Line <= '0';
        wait for 18 ms;
        Data_Line <= '1';
        wait for 40 us;
        
        -- Simulate Echo signal for Ultrasonic_Sensor
        wait for 2 ms;
        Echo <= '1';
        wait for 58 us; -- Simulate distance
        Echo <= '0';

        -- Continue with additional test cases as needed
        wait for 100 ms;
        
        -- End simulation
        wait;
    end process;

end Behavioral;
