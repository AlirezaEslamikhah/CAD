library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Single_port_RAM_VHDL is
  port(
    RAM_ADDR: in std_logic_vector(6 downto 0);     -- Address to write/read RAM
    RAM_DATA_IN: in std_logic_vector(7 downto 0);  -- Data to write into RAM
    RAM_WR: in std_logic;                          -- Write enable 
    RAM_CLOCK: in std_logic;                        -- Clock input for RAM
    RAM_DATA_OUT: out std_logic_vector(7 downto 0) -- Data output of RAM
  );
end Single_port_RAM_VHDL;

architecture Behavioral of Single_port_RAM_VHDL is
  type RAM_ARRAY is array (0 to 127) of std_logic_vector (7 downto 0);
  signal RAM: RAM_ARRAY := (others => (others => '0'));  -- Initialize RAM with zeros
  
  -- Timer signals
  signal timer_count: unsigned(7 downto 0) := (others => '0');
  signal timer_enable: std_logic := '0';

begin
  process(RAM_CLOCK)
  begin
    if rising_edge(RAM_CLOCK) then
      if timer_enable = '1' then
        if timer_count = 0 then
          RAM <= (others => (others => '0'));  -- Invalidate all data in RAM
          timer_enable <= '0';  -- Disable the timer after expiration
        else
          timer_count <= timer_count - 1;  -- Decrement the timer count
        end if;
      end if;

      if RAM_WR = '1' then
        RAM(to_integer(unsigned(RAM_ADDR))) <= RAM_DATA_IN;
      end if;
    end if;
  end process;

  RAM_DATA_OUT <= RAM(to_integer(unsigned(RAM_ADDR)));

  -- Add a new process to control the timer
  process(RAM_CLOCK)
  begin
    if rising_edge(RAM_CLOCK) then
      if timer_enable = '1' then
        timer_count <= timer_count - 1;  -- Decrement the timer count
      end if;
    end if;
  end process;

end Behavioral;
