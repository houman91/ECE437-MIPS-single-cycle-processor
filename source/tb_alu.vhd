-- $Id: $
-- File name:   tb_alu.vhd
-- Created:     1/12/2013
-- Author:      Vineeth Harikumar
-- Lab Section: Wednesday 7:30-10:20
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model
use ieee.numeric_std.all;
entity tb_alu is
end tb_alu;

architecture TEST of tb_alu is

  function INT_TO_STD_LOGIC( X: INTEGER; NumBits: INTEGER )
     return STD_LOGIC_VECTOR is
    variable RES : STD_LOGIC_VECTOR(NumBits-1 downto 0);
    variable tmp : INTEGER;
  begin
    tmp := X;
    for i in 0 to NumBits-1 loop
      if (tmp mod 2)=1 then
        res(i) := '1';
      else
        res(i) := '0';
      end if;
      tmp := tmp/2;
    end loop;
    return res;
  end;

  component alu
    PORT(
         opcode : IN STD_LOGIC_VECTOR (2 downto 0);
         A : IN STD_LOGIC_VECTOR (31 downto 0);
         B : IN STD_LOGIC_VECTOR (31 downto 0);
         aluout : OUT STD_LOGIC_VECTOR (31 downto 0);
         negative : OUT STD_LOGIC;
         overflow : OUT STD_LOGIC;
         zero : OUT STD_LOGIC
    );
  end component;

-- Insert signals Declarations here
  signal opcode : STD_LOGIC_VECTOR (2 downto 0);
  signal A : STD_LOGIC_VECTOR (31 downto 0);
  signal B : STD_LOGIC_VECTOR (31 downto 0);
  signal aluout : STD_LOGIC_VECTOR (31 downto 0);
  signal negative : STD_LOGIC;
  signal overflow : STD_LOGIC;
  signal zero : STD_LOGIC;

-- signal <name> : <type>;

begin
  DUT: alu port map(
                opcode => opcode,
                A => A,
                B => B,
                aluout => aluout,
                negative => negative,
                overflow => overflow,
                zero => zero
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    
   -- for k in 1 to 1000 loop
    --  for j in 1 to 1000 loop
     --   A <= std_logic_vector(to_unsigned(k,32));
      --  B <= std_logic_vector(to_unsigned(j,32));
     --  wait for 20 ns;
        
   --   end loop;
   -- end loop;
    opcode <= "000";
    A <= x"FFFFFFEC";
    B <= x"FFFFFFFE";
    wait for 100 ns;
    
    opcode <= "010";
    A <= x"0001FFFF";
    B <= x"7FFDFFFF";
    wait for 100 ns;
    
    opcode <= "000";
    A <= x"FFFFFFEC";
    B <= x"0000000F";
    wait for 100 ns;
    
    opcode <= "001";
    A <= x"FFFFFFEC";
    B <= x"0000000F";
    wait for 100 ns;
    
    opcode <= "001";
    A <= x"FFFFFFEF";
    B <= x"FFFFFF8F";
    wait for 100 ns;
    
    opcode <= "001";
    A <= x"FFFFFFFF";
    B <= x"00000003";
    wait for 100 ns;

    opcode <= "010";  
    A <= x"7FFFFFFF";
    B <= x"7FFFFFFF";
    wait for 100 ns;

    opcode <= "010";  
    A <= x"000FFFFF";
    B <= x"000FFFFF";
    wait for 100 ns;

    opcode <= "010";  
    A <= x"00FFFFFF";
    B <= x"00FFFFFF";
    wait for 100 ns;

    opcode <= "010";  
    A <= x"ABCDE987";
    B <= x"789ABCDE";
    wait for 100 ns;

    opcode <= "010";  
    A <= x"FFFFFFFF";
    B <= x"00000001";
    wait for 100 ns;

    opcode <= "010";  
    A <= x"7FFF0000";
    B <= x"7FFFFFFF";
    wait for 100 ns;


    opcode <= "011";
    A <= x"7FFFFFF7";
    B <= x"7FFFFFF7";
    wait for 100 ns;

    opcode <= "100";
    A <= x"00000000";
    B <= x"FFFFFFFF";
    wait for 100 ns;

    opcode <= "101";
    A <= x"FFFFFFFF";
    B <= x"F0F0F0F0";
    wait for 100 ns;

    opcode <= "110";
    A <= x"F0F0F0F0";
    B <= x"0F0F0F0F";
    wait for 100 ns;

    opcode <= "111";
    A <= x"FFFF0000";
    B <= x"FFFF0000";
    wait for 100 ns;

    A <= x"0000FFFF";
    B <= x"FFFF0000";
    wait for 100 ns;

    A <= x"FFFFFFFF";
    B <= x"0000FFFF";
    wait for 100 ns;

    A <= x"FFFFFFFF";
    B <= x"FFFF0000";
    wait for 100 ns;

    A <= x"00000000";
    B <= x"11111111";
    wait for 100 ns;

  end process;
end TEST;