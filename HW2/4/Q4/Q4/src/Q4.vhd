library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Q4 is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        clock_set : in STD_LOGIC;
        alarm_set : in STD_LOGIC;
        alarm_stop : in STD_LOGIC;
        input_time : in STD_LOGIC_VECTOR(13 downto 0);
        on_alarm : out STD_LOGIC := '0'
    );
end Q4;

architecture Behavioral of Q4 is
begin
    process(clk)
    variable ct : unsigned(13 downto 0) := (others => '0');
    variable alarm_time : unsigned(13 downto 0) := (others => 'U');
    variable second : integer range 0 to 59 := 0;
    begin							 										 
		
		if rising_edge(clk) then
            -- second := second + 1;
            if second = 59 then
                second := 0;
			else
				second := second + 1;
            end if;
			if second = 0 then
                if ct(3 downto 0) = "1001" then
                    ct(3 downto 0) := "0000";
                    if ct(7 downto 4) = "0101" then
                        ct(7 downto 4) := "0000";
                        if ct(11 downto 8) = "1001" then
                            ct(11 downto 8) := "0000";
                            ct(13 downto 12) := ct(13 downto 12) + 1;
                        elsif (ct(11 downto 8) = "0011" and ct(13 downto 12) = "10") then
                            ct(11 downto 8) := "0000";
                            ct(13 downto 12) := "00";
                        else
                            ct(11 downto 8) := ct(11 downto 8) + 1;
                        end if;
                    else
                        ct(7 downto 4) := ct(7 downto 4) + 1;
                    end if;
                else
                    ct(3 downto 0) := ct(3 downto 0) + 1;
                end if;
            end if;
        end if;		
		if reset = '1' then
            ct := (others => '0');
			second := 0;
        end if;

        if clock_set = '1' then
            ct := unsigned(input_time);
			second := 0;
        elsif alarm_set = '1' then
            alarm_time := unsigned(input_time);
        end if;

        if ct = alarm_time then
            on_alarm <= '1' after 1ns;
        elsif alarm_stop = '1' then
            on_alarm <= '0' after 1ns;
        end if;

    end process;
	

end Behavioral;