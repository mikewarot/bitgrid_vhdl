library ieee;
use ieee.std_logic_1164.all;

entity BitGridTb is

  signal inputs   : std_logic_vector(3 downto 0) := (others => '0');
  signal outputs  : std_logic_vector(3 downto 0) := (others => '0');
  signal clock    : std_logic := '0';
  signal LUT1     : std_logic_vector(15 downto 0) := (others => '0');

end entity;

architecture sim of BitGridTb is

begin

  -- Shift register
  process(clock)
  begin
    if rising_edge(clock) then
      for i in 3 downto 0 loop
        outputs(i) <= inputs(i);
      end loop;
    end if;
  end process;

  process is  -- generate a clock to feed in
  begin
	clock <= '1';
    wait for 10 ns;
	clock <= '0';
    wait for 10 ns;
  end process;
  
  process is -- overall execution
  begin
    wait for 93 ns;
	inputs <= "0101";
	wait for 900 ns;
	inputs <= "1010";
	wait for 7 ns;
  end process;

end architecture;