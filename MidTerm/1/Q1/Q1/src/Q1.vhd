	library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.math_real.all;
use IEEE.NUMERIC_STD.all;
use ieee.numeric_std.all;

entity Counter is
    port (
        Clear : in  STD_logic;    -- Active-High Asynchronous Clear
        Preset : in  std_logic;   -- Active-Low Synchronous Preset
        Count : in  std_logic;    -- Active-High Synchronous Count
        Clock : in  std_logic;    -- Clock signal
        CounterValue : out std_logic_vector(11 downto 0) -- Output counter value
    );
end Counter;

architecture Behavioral of Counter is
    signal counter : std_logic_vector(11 downto 0);
    constant StdNumberMod10 : std_logic_vector(3 downto 0) := "0100"; -- Std number mod 10
begin
    process (Clock)
    begin
        if rising_edge(Clock) then
            if Clear = '1' then
                counter <= (others => '0'); -- Clear the counter to 0
        --elsif rising_edge(Clock) then
            if Preset = '0' then
                counter <= "000001000000"; 	  --- My student num mod 100 is 64
			
        elsif Count = '1' and Count'event then
                counter <= std_logic_vector(unsigned(counter) + unsigned(StdNumberMod10)); -- Increment the counter by StdNumberMod10
            end if;
        end if;
	end if;
    end process;

    CounterValue <= counter; -- Assign the counter value to the output
end Behavioral;
