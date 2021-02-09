----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2021 13:40:55
-- Design Name: 
-- Module Name: pgcd - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pgcd is
port(
		CLK      : in  STD_LOGIC;
		RESET    : in  STD_LOGIC;
	
		idata_a  : in  STD_LOGIC_VECTOR (31 downto 0);
		idata_b  : in  STD_LOGIC_VECTOR (31 downto 0);
		idata_en : in  STD_LOGIC;
	
		odata    : out STD_LOGIC_VECTOR (31 downto 0);
		odata_en : out STD_LOGIC
);
end pgcd;

architecture Behavioral of pgcd is

begin


end Behavioral;
