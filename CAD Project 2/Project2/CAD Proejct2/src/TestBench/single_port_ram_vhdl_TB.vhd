library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Single_port_RAM_TB is
end Single_port_RAM_TB;

architecture Behavioral of Single_port_RAM_TB is
  -- Constants
  constant CLOCK_PERIOD: time := 10 ns;
  
  -- Signals
  signal RAM_ADDR: std_logic_vector(6 downto 0);
  signal RAM_DATA_IN: std_logic_vector(7 downto 0);
  signal RAM_WR: std_logic;
  signal RAM_CLOCK: std_logic;
  signal RAM_DATA_OUT: std_logic_vector(7 downto 0);
  
  -- Clock process	   
  begin
  process
  begin
    while now < 1000 ns loop  -- Simulate for 1000 ns
      RAM_CLOCK <= '0';
      wait for CLOCK_PERIOD / 2;
      RAM_CLOCK <= '1';
      wait for CLOCK_PERIOD / 2;
    end loop;
    wait;
  end process;
  
  -- Stimulus process
  process
  begin
    wait for CLOCK_PERIOD * 2;  -- Wait for initial stabilization
    
    -- Write data to RAM
    RAM_WR <= '1';
    RAM_ADDR <= "0000001";  -- Address 1
    RAM_DATA_IN <= "10101010";  -- Data to be written
    wait for CLOCK_PERIOD;
    RAM_WR <= '0';  -- Disable write
    
    -- Enable timer for 5 clock cycles
    wait for CLOCK_PERIOD;
    RAM_ADDR <= "0000001";  -- Address 1
    RAM_DATA_IN <= "11001100";  -- Data to be written
    RAM_WR <= '1';
    wait for CLOCK_PERIOD;
    RAM_WR <= '0';  -- Disable write
    wait for 4 * CLOCK_PERIOD;
    RAM_ADDR <= "0000001";  -- Address 1
    RAM_DATA_IN <= "11110000";  -- Data to be written
    RAM_WR <= '1';
    wait for CLOCK_PERIOD;
    RAM_WR <= '0';  -- Disable write
    
    -- Read data from RAM
    RAM_ADDR <= "0000001";  -- Address 1
    wait for CLOCK_PERIOD;
    
    -- Enable timer for 3 clock cycles
    RAM_ADDR <= "0000010";  -- Address 2
    RAM_DATA_IN <= "01010101";  -- Data to be written
    RAM_WR <= '1';
    wait for CLOCK_PERIOD;
    RAM_WR <= '0';  -- Disable write
    wait for 2 * CLOCK_PERIOD;
    RAM_ADDR <= "0000010";  -- Address 2
    RAM_DATA_IN <= "00110011";  -- Data to be written
    RAM_WR <= '1';
    wait for CLOCK_PERIOD;
    RAM_WR <= '0';  -- Disable write
    wait for 2 * CLOCK_PERIOD;
    RAM_ADDR <= "0000010";  -- Address 2
    RAM_DATA_IN <= "00001111";  -- Data to be written
    RAM_WR <= '1';
    wait for CLOCK_PERIOD;
    RAM_WR <= '0';  -- Disable write
    
    -- Read data from RAM
    RAM_ADDR <= "0000010";  -- Address 2
    wait for CLOCK_PERIOD;
    
    wait;
  end process;

begin
  -- Instantiate the single-port RAM
  dut: entity work.Single_port_RAM_VHDL
    port map(
      RAM_ADDR => RAM_ADDR,
      RAM_DATA_IN => RAM_DATA_IN,
      RAM_WR => RAM_WR,
      RAM_CLOCK => RAM_CLOCK,
      RAM_DATA_OUT => RAM_DATA_OUT
    );

  -- Add assertions for expected behavior if necessary

end Behavioral;
