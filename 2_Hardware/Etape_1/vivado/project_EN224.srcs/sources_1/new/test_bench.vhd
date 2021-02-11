----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.02.2021 18:35:10
-- Design Name: 
-- Module Name: test_bench - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_bench is
--  Port ( );
end test_bench;

architecture tb of test_bench is

    component pgcd
        port (CLK      : in std_logic;
              RESET    : in std_logic;
              idata_a  : in std_logic_vector (31 downto 0);
              idata_b  : in std_logic_vector (31 downto 0);
              idata_en : in std_logic;
              odata    : out std_logic_vector (31 downto 0);
              odata_en : out std_logic);
    end component;

    signal CLK      : std_logic;
    signal RESET    : std_logic;
    signal idata_a  : std_logic_vector (31 downto 0);
    signal idata_b  : std_logic_vector (31 downto 0);
    signal idata_en : std_logic;
    signal odata    : std_logic_vector (31 downto 0);
    signal odata_en : std_logic;

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : pgcd
    port map (CLK      => CLK,
              RESET    => RESET,
              idata_a  => idata_a,
              idata_b  => idata_b,
              idata_en => idata_en,
              odata    => odata,
              odata_en => odata_en);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that CLK is really your main clock signal
    CLK <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        idata_a <= (others => '0');
        idata_b <= (others => '0');
        idata_en <= '0';

        -- Reset generation
        -- EDIT: Check that RESET is really your reset signal
        RESET <= '1';
        wait for 100 ns;
        RESET <= '0';
        wait for 100 ns;

        -- EDIT Add stimuli here
        report "Lancement du test";
        
           -- test 0
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(52079, 32));
        idata_b <= std_logic_vector(to_unsigned(45917, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 1
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(50298, 32));
        idata_b <= std_logic_vector(to_unsigned(10418, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 2
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(49078, 32));
        idata_b <= std_logic_vector(to_unsigned(57935, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 3
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(62219, 32));
        idata_b <= std_logic_vector(to_unsigned(11395, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 4
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(9012, 32));
        idata_b <= std_logic_vector(to_unsigned(5373, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 5
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(51968, 32));
        idata_b <= std_logic_vector(to_unsigned(14276, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 6
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(54718, 32));
        idata_b <= std_logic_vector(to_unsigned(13930, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 7
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(11366, 32));
        idata_b <= std_logic_vector(to_unsigned(29029, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 8
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(53317, 32));
        idata_b <= std_logic_vector(to_unsigned(2127, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 9
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(19980, 32));
        idata_b <= std_logic_vector(to_unsigned(9315, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 135, 32) SEVERITY ERROR;
        
        -- test 10
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(4774, 32));
        idata_b <= std_logic_vector(to_unsigned(8036, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 14, 32) SEVERITY ERROR;
        
        -- test 11
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(34305, 32));
        idata_b <= std_logic_vector(to_unsigned(11726, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 12
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(51961, 32));
        idata_b <= std_logic_vector(to_unsigned(62141, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 13
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(21039, 32));
        idata_b <= std_logic_vector(to_unsigned(2347, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 14
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(5008, 32));
        idata_b <= std_logic_vector(to_unsigned(59941, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 15
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(12323, 32));
        idata_b <= std_logic_vector(to_unsigned(57087, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 16
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(40322, 32));
        idata_b <= std_logic_vector(to_unsigned(62621, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 17
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(1969, 32));
        idata_b <= std_logic_vector(to_unsigned(23864, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 18
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(55020, 32));
        idata_b <= std_logic_vector(to_unsigned(64189, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 19
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(35259, 32));
        idata_b <= std_logic_vector(to_unsigned(64033, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 20
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(4026, 32));
        idata_b <= std_logic_vector(to_unsigned(21692, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 22, 32) SEVERITY ERROR;
        
        -- test 21
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(12773, 32));
        idata_b <= std_logic_vector(to_unsigned(58744, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 22
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(35622, 32));
        idata_b <= std_logic_vector(to_unsigned(24139, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 23
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(22237, 32));
        idata_b <= std_logic_vector(to_unsigned(23404, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 24
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(26267, 32));
        idata_b <= std_logic_vector(to_unsigned(42218, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 25
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(32719, 32));
        idata_b <= std_logic_vector(to_unsigned(31041, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 26
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(50254, 32));
        idata_b <= std_logic_vector(to_unsigned(1488, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 27
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(42768, 32));
        idata_b <= std_logic_vector(to_unsigned(36680, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 8, 32) SEVERITY ERROR;
        
        -- test 28
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(63629, 32));
        idata_b <= std_logic_vector(to_unsigned(63807, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 29
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(39027, 32));
        idata_b <= std_logic_vector(to_unsigned(3101, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 30
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(58212, 32));
        idata_b <= std_logic_vector(to_unsigned(51350, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 31
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(60189, 32));
        idata_b <= std_logic_vector(to_unsigned(32999, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 32
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(48435, 32));
        idata_b <= std_logic_vector(to_unsigned(62158, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 33
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(56863, 32));
        idata_b <= std_logic_vector(to_unsigned(37920, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 34
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(60811, 32));
        idata_b <= std_logic_vector(to_unsigned(26587, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 35
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(36417, 32));
        idata_b <= std_logic_vector(to_unsigned(64837, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 36
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(48279, 32));
        idata_b <= std_logic_vector(to_unsigned(49190, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 37
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(58046, 32));
        idata_b <= std_logic_vector(to_unsigned(18365, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 38
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(7793, 32));
        idata_b <= std_logic_vector(to_unsigned(14747, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 39
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(41769, 32));
        idata_b <= std_logic_vector(to_unsigned(34060, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 13, 32) SEVERITY ERROR;
        
        -- test 40
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(56965, 32));
        idata_b <= std_logic_vector(to_unsigned(8952, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 41
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(65102, 32));
        idata_b <= std_logic_vector(to_unsigned(41684, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 42
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(10441, 32));
        idata_b <= std_logic_vector(to_unsigned(42334, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 43
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(12828, 32));
        idata_b <= std_logic_vector(to_unsigned(8534, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 44
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(40605, 32));
        idata_b <= std_logic_vector(to_unsigned(51855, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 15, 32) SEVERITY ERROR;
        
        -- test 45
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(11636, 32));
        idata_b <= std_logic_vector(to_unsigned(33281, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 46
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(37669, 32));
        idata_b <= std_logic_vector(to_unsigned(6289, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 47
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(744, 32));
        idata_b <= std_logic_vector(to_unsigned(20568, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 24, 32) SEVERITY ERROR;
        
        -- test 48
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(2911, 32));
        idata_b <= std_logic_vector(to_unsigned(57608, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 49
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(58488, 32));
        idata_b <= std_logic_vector(to_unsigned(63723, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 50
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(18659, 32));
        idata_b <= std_logic_vector(to_unsigned(29369, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 51
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(63024, 32));
        idata_b <= std_logic_vector(to_unsigned(1402, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 52
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(13023, 32));
        idata_b <= std_logic_vector(to_unsigned(55534, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 53
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(19767, 32));
        idata_b <= std_logic_vector(to_unsigned(20817, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 54
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(4746, 32));
        idata_b <= std_logic_vector(to_unsigned(61537, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 7, 32) SEVERITY ERROR;
        
        -- test 55
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(54877, 32));
        idata_b <= std_logic_vector(to_unsigned(61711, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 56
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(4953, 32));
        idata_b <= std_logic_vector(to_unsigned(54443, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 57
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(37859, 32));
        idata_b <= std_logic_vector(to_unsigned(15394, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 58
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(31241, 32));
        idata_b <= std_logic_vector(to_unsigned(50687, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 7, 32) SEVERITY ERROR;
        
        -- test 59
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(23929, 32));
        idata_b <= std_logic_vector(to_unsigned(6310, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 60
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(37006, 32));
        idata_b <= std_logic_vector(to_unsigned(35565, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 61
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(39592, 32));
        idata_b <= std_logic_vector(to_unsigned(9139, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 62
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(41854, 32));
        idata_b <= std_logic_vector(to_unsigned(40336, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 63
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(29708, 32));
        idata_b <= std_logic_vector(to_unsigned(44765, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 7, 32) SEVERITY ERROR;
        
        -- test 64
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(32408, 32));
        idata_b <= std_logic_vector(to_unsigned(22660, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 65
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(42952, 32));
        idata_b <= std_logic_vector(to_unsigned(51067, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 66
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(52030, 32));
        idata_b <= std_logic_vector(to_unsigned(40441, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 67
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(52469, 32));
        idata_b <= std_logic_vector(to_unsigned(65053, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 68
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(30439, 32));
        idata_b <= std_logic_vector(to_unsigned(6701, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 69
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(20334, 32));
        idata_b <= std_logic_vector(to_unsigned(35185, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 70
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(2702, 32));
        idata_b <= std_logic_vector(to_unsigned(9676, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 71
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(31361, 32));
        idata_b <= std_logic_vector(to_unsigned(7655, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 72
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(64119, 32));
        idata_b <= std_logic_vector(to_unsigned(3684, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 73
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(23050, 32));
        idata_b <= std_logic_vector(to_unsigned(29825, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 25, 32) SEVERITY ERROR;
        
        -- test 74
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(54372, 32));
        idata_b <= std_logic_vector(to_unsigned(46979, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 75
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(36135, 32));
        idata_b <= std_logic_vector(to_unsigned(25842, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 219, 32) SEVERITY ERROR;
        
        -- test 76
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(17008, 32));
        idata_b <= std_logic_vector(to_unsigned(10191, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 77
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(34982, 32));
        idata_b <= std_logic_vector(to_unsigned(58862, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 78
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(50528, 32));
        idata_b <= std_logic_vector(to_unsigned(64690, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 79
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(38091, 32));
        idata_b <= std_logic_vector(to_unsigned(17400, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 80
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(21814, 32));
        idata_b <= std_logic_vector(to_unsigned(15508, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 81
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(2932, 32));
        idata_b <= std_logic_vector(to_unsigned(8308, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 82
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(55949, 32));
        idata_b <= std_logic_vector(to_unsigned(55401, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 83
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(7826, 32));
        idata_b <= std_logic_vector(to_unsigned(20852, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 26, 32) SEVERITY ERROR;
        
        -- test 84
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(62102, 32));
        idata_b <= std_logic_vector(to_unsigned(28160, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 85
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(56038, 32));
        idata_b <= std_logic_vector(to_unsigned(64804, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 86
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(37836, 32));
        idata_b <= std_logic_vector(to_unsigned(21863, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 87
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(6924, 32));
        idata_b <= std_logic_vector(to_unsigned(36420, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 12, 32) SEVERITY ERROR;
        
        -- test 88
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(25547, 32));
        idata_b <= std_logic_vector(to_unsigned(29974, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 89
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(709, 32));
        idata_b <= std_logic_vector(to_unsigned(14383, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 90
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(11417, 32));
        idata_b <= std_logic_vector(to_unsigned(36844, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 91
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(40226, 32));
        idata_b <= std_logic_vector(to_unsigned(28425, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 92
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(47036, 32));
        idata_b <= std_logic_vector(to_unsigned(9672, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 93
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(21751, 32));
        idata_b <= std_logic_vector(to_unsigned(32028, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 94
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(8826, 32));
        idata_b <= std_logic_vector(to_unsigned(59842, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 95
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(49428, 32));
        idata_b <= std_logic_vector(to_unsigned(30640, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 96
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(9814, 32));
        idata_b <= std_logic_vector(to_unsigned(52360, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 14, 32) SEVERITY ERROR;
        
        -- test 97
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(38949, 32));
        idata_b <= std_logic_vector(to_unsigned(227, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 98
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(42226, 32));
        idata_b <= std_logic_vector(to_unsigned(46775, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 99
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(21080, 32));
        idata_b <= std_logic_vector(to_unsigned(38792, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 8, 32) SEVERITY ERROR;
        
        -- test 100
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(9399, 32));
        idata_b <= std_logic_vector(to_unsigned(11582, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 101
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(38061, 32));
        idata_b <= std_logic_vector(to_unsigned(47236, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 102
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(33445, 32));
        idata_b <= std_logic_vector(to_unsigned(44985, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 5, 32) SEVERITY ERROR;
        
        -- test 103
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(18120, 32));
        idata_b <= std_logic_vector(to_unsigned(58992, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 24, 32) SEVERITY ERROR;
        
        -- test 104
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(9423, 32));
        idata_b <= std_logic_vector(to_unsigned(18829, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 105
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(7840, 32));
        idata_b <= std_logic_vector(to_unsigned(20840, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 40, 32) SEVERITY ERROR;
        
        -- test 106
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(55673, 32));
        idata_b <= std_logic_vector(to_unsigned(48066, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 107
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(49265, 32));
        idata_b <= std_logic_vector(to_unsigned(37173, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 108
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(57738, 32));
        idata_b <= std_logic_vector(to_unsigned(5480, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 109
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(3665, 32));
        idata_b <= std_logic_vector(to_unsigned(1028, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 110
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(65322, 32));
        idata_b <= std_logic_vector(to_unsigned(53094, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 6, 32) SEVERITY ERROR;
        
        -- test 111
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(31668, 32));
        idata_b <= std_logic_vector(to_unsigned(9601, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 112
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(39918, 32));
        idata_b <= std_logic_vector(to_unsigned(5081, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 113
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(9828, 32));
        idata_b <= std_logic_vector(to_unsigned(16608, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 12, 32) SEVERITY ERROR;
        
        -- test 114
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(51856, 32));
        idata_b <= std_logic_vector(to_unsigned(30908, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 115
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(55401, 32));
        idata_b <= std_logic_vector(to_unsigned(61256, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 116
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(42490, 32));
        idata_b <= std_logic_vector(to_unsigned(27926, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 117
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(42956, 32));
        idata_b <= std_logic_vector(to_unsigned(10399, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 118
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(7375, 32));
        idata_b <= std_logic_vector(to_unsigned(61076, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 119
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(3856, 32));
        idata_b <= std_logic_vector(to_unsigned(16798, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 120
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(14369, 32));
        idata_b <= std_logic_vector(to_unsigned(11696, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 121
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(37638, 32));
        idata_b <= std_logic_vector(to_unsigned(4506, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 6, 32) SEVERITY ERROR;
        
        -- test 122
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(59762, 32));
        idata_b <= std_logic_vector(to_unsigned(21367, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 123
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(41680, 32));
        idata_b <= std_logic_vector(to_unsigned(51964, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 124
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(26847, 32));
        idata_b <= std_logic_vector(to_unsigned(45345, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 125
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(52992, 32));
        idata_b <= std_logic_vector(to_unsigned(26633, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 126
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(32903, 32));
        idata_b <= std_logic_vector(to_unsigned(19124, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 127
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(36234, 32));
        idata_b <= std_logic_vector(to_unsigned(7286, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 128
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(24206, 32));
        idata_b <= std_logic_vector(to_unsigned(46063, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 129
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(23894, 32));
        idata_b <= std_logic_vector(to_unsigned(10526, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 130
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(11435, 32));
        idata_b <= std_logic_vector(to_unsigned(13759, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 131
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(6246, 32));
        idata_b <= std_logic_vector(to_unsigned(53926, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 132
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(41685, 32));
        idata_b <= std_logic_vector(to_unsigned(49202, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 133
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(64325, 32));
        idata_b <= std_logic_vector(to_unsigned(49060, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 5, 32) SEVERITY ERROR;
        
        -- test 134
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(44742, 32));
        idata_b <= std_logic_vector(to_unsigned(2645, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 135
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(322, 32));
        idata_b <= std_logic_vector(to_unsigned(59111, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 136
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(14341, 32));
        idata_b <= std_logic_vector(to_unsigned(37960, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 137
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(63618, 32));
        idata_b <= std_logic_vector(to_unsigned(8567, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 138
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(59327, 32));
        idata_b <= std_logic_vector(to_unsigned(39762, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 139
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(60531, 32));
        idata_b <= std_logic_vector(to_unsigned(20638, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 140
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(19571, 32));
        idata_b <= std_logic_vector(to_unsigned(47987, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 141
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(47272, 32));
        idata_b <= std_logic_vector(to_unsigned(52475, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 142
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(1576, 32));
        idata_b <= std_logic_vector(to_unsigned(17970, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 143
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(59761, 32));
        idata_b <= std_logic_vector(to_unsigned(25782, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 144
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(64033, 32));
        idata_b <= std_logic_vector(to_unsigned(18119, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 145
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(36308, 32));
        idata_b <= std_logic_vector(to_unsigned(9933, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 146
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(31879, 32));
        idata_b <= std_logic_vector(to_unsigned(42555, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 147
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(63859, 32));
        idata_b <= std_logic_vector(to_unsigned(8028, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 148
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(26221, 32));
        idata_b <= std_logic_vector(to_unsigned(62648, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 149
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(57089, 32));
        idata_b <= std_logic_vector(to_unsigned(5428, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 150
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(65294, 32));
        idata_b <= std_logic_vector(to_unsigned(57411, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 151
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(64539, 32));
        idata_b <= std_logic_vector(to_unsigned(14099, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 152
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(29836, 32));
        idata_b <= std_logic_vector(to_unsigned(62621, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 153
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(22667, 32));
        idata_b <= std_logic_vector(to_unsigned(23627, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 154
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(36847, 32));
        idata_b <= std_logic_vector(to_unsigned(17662, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 155
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(44266, 32));
        idata_b <= std_logic_vector(to_unsigned(56419, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 156
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(114, 32));
        idata_b <= std_logic_vector(to_unsigned(26002, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 157
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(43358, 32));
        idata_b <= std_logic_vector(to_unsigned(1690, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 158
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(43972, 32));
        idata_b <= std_logic_vector(to_unsigned(37583, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 159
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(27472, 32));
        idata_b <= std_logic_vector(to_unsigned(42470, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 160
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(55702, 32));
        idata_b <= std_logic_vector(to_unsigned(63780, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 161
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(52403, 32));
        idata_b <= std_logic_vector(to_unsigned(22045, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 162
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(40799, 32));
        idata_b <= std_logic_vector(to_unsigned(50726, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 163
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(30074, 32));
        idata_b <= std_logic_vector(to_unsigned(1485, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 11, 32) SEVERITY ERROR;
        
        -- test 164
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(47838, 32));
        idata_b <= std_logic_vector(to_unsigned(21627, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 165
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(6913, 32));
        idata_b <= std_logic_vector(to_unsigned(47596, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 166
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(13502, 32));
        idata_b <= std_logic_vector(to_unsigned(5916, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 167
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(61696, 32));
        idata_b <= std_logic_vector(to_unsigned(43338, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 168
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(3002, 32));
        idata_b <= std_logic_vector(to_unsigned(18827, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 169
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(1430, 32));
        idata_b <= std_logic_vector(to_unsigned(39849, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 170
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(36489, 32));
        idata_b <= std_logic_vector(to_unsigned(45696, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 171
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(30732, 32));
        idata_b <= std_logic_vector(to_unsigned(36603, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 172
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(6162, 32));
        idata_b <= std_logic_vector(to_unsigned(8554, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 26, 32) SEVERITY ERROR;
        
        -- test 173
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(38293, 32));
        idata_b <= std_logic_vector(to_unsigned(50134, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 174
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(46137, 32));
        idata_b <= std_logic_vector(to_unsigned(229, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 175
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(27068, 32));
        idata_b <= std_logic_vector(to_unsigned(36304, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 176
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(64010, 32));
        idata_b <= std_logic_vector(to_unsigned(13935, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 5, 32) SEVERITY ERROR;
        
        -- test 177
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(58349, 32));
        idata_b <= std_logic_vector(to_unsigned(39273, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 19, 32) SEVERITY ERROR;
        
        -- test 178
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(64661, 32));
        idata_b <= std_logic_vector(to_unsigned(22887, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 179
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(40758, 32));
        idata_b <= std_logic_vector(to_unsigned(46964, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 180
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(44514, 32));
        idata_b <= std_logic_vector(to_unsigned(47671, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 181
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(29024, 32));
        idata_b <= std_logic_vector(to_unsigned(58017, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 182
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(53588, 32));
        idata_b <= std_logic_vector(to_unsigned(25184, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 183
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(35819, 32));
        idata_b <= std_logic_vector(to_unsigned(56590, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 184
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(44011, 32));
        idata_b <= std_logic_vector(to_unsigned(37249, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 185
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(30903, 32));
        idata_b <= std_logic_vector(to_unsigned(14965, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 186
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(17409, 32));
        idata_b <= std_logic_vector(to_unsigned(61636, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 187
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(51568, 32));
        idata_b <= std_logic_vector(to_unsigned(23571, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 188
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(4654, 32));
        idata_b <= std_logic_vector(to_unsigned(24326, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 189
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(8170, 32));
        idata_b <= std_logic_vector(to_unsigned(50792, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 190
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(24555, 32));
        idata_b <= std_logic_vector(to_unsigned(35238, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 191
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(21560, 32));
        idata_b <= std_logic_vector(to_unsigned(23029, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 192
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(49174, 32));
        idata_b <= std_logic_vector(to_unsigned(14373, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 193
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(62303, 32));
        idata_b <= std_logic_vector(to_unsigned(48299, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 194
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(37261, 32));
        idata_b <= std_logic_vector(to_unsigned(37525, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 195
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(29727, 32));
        idata_b <= std_logic_vector(to_unsigned(16239, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 196
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(19661, 32));
        idata_b <= std_logic_vector(to_unsigned(58752, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 197
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(8720, 32));
        idata_b <= std_logic_vector(to_unsigned(7713, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 198
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(18400, 32));
        idata_b <= std_logic_vector(to_unsigned(44540, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 20, 32) SEVERITY ERROR;
        
        -- test 199
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(64303, 32));
        idata_b <= std_logic_vector(to_unsigned(62412, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 200
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(16253, 32));
        idata_b <= std_logic_vector(to_unsigned(29670, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 201
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(11841, 32));
        idata_b <= std_logic_vector(to_unsigned(33663, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 202
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(25770, 32));
        idata_b <= std_logic_vector(to_unsigned(63409, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 203
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(57234, 32));
        idata_b <= std_logic_vector(to_unsigned(30425, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 204
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(22199, 32));
        idata_b <= std_logic_vector(to_unsigned(65404, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 205
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(15681, 32));
        idata_b <= std_logic_vector(to_unsigned(46755, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 206
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(35107, 32));
        idata_b <= std_logic_vector(to_unsigned(37241, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 207
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(4248, 32));
        idata_b <= std_logic_vector(to_unsigned(18745, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 208
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(51614, 32));
        idata_b <= std_logic_vector(to_unsigned(1015, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 209
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(1508, 32));
        idata_b <= std_logic_vector(to_unsigned(23339, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 210
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(38541, 32));
        idata_b <= std_logic_vector(to_unsigned(31236, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 211
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(39579, 32));
        idata_b <= std_logic_vector(to_unsigned(58202, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 212
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(24452, 32));
        idata_b <= std_logic_vector(to_unsigned(48299, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 213
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(379, 32));
        idata_b <= std_logic_vector(to_unsigned(42852, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 214
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(27303, 32));
        idata_b <= std_logic_vector(to_unsigned(64682, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 215
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(39728, 32));
        idata_b <= std_logic_vector(to_unsigned(43557, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 216
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(28816, 32));
        idata_b <= std_logic_vector(to_unsigned(51569, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 217
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(11684, 32));
        idata_b <= std_logic_vector(to_unsigned(54587, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 218
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(49443, 32));
        idata_b <= std_logic_vector(to_unsigned(3382, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 219
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(19476, 32));
        idata_b <= std_logic_vector(to_unsigned(6106, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 220
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(3251, 32));
        idata_b <= std_logic_vector(to_unsigned(35157, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 221
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(52861, 32));
        idata_b <= std_logic_vector(to_unsigned(38358, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 222
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(6862, 32));
        idata_b <= std_logic_vector(to_unsigned(57110, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 223
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(57103, 32));
        idata_b <= std_logic_vector(to_unsigned(58476, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 224
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(58125, 32));
        idata_b <= std_logic_vector(to_unsigned(58611, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 225
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(16280, 32));
        idata_b <= std_logic_vector(to_unsigned(31130, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 110, 32) SEVERITY ERROR;
        
        -- test 226
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(24311, 32));
        idata_b <= std_logic_vector(to_unsigned(55859, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 227
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(23796, 32));
        idata_b <= std_logic_vector(to_unsigned(48763, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 228
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(38622, 32));
        idata_b <= std_logic_vector(to_unsigned(24175, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 229
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(26080, 32));
        idata_b <= std_logic_vector(to_unsigned(390, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 10, 32) SEVERITY ERROR;
        
        -- test 230
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(23321, 32));
        idata_b <= std_logic_vector(to_unsigned(272, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 231
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(43947, 32));
        idata_b <= std_logic_vector(to_unsigned(52138, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 232
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(51842, 32));
        idata_b <= std_logic_vector(to_unsigned(55631, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 233
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(41189, 32));
        idata_b <= std_logic_vector(to_unsigned(35749, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 234
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(59013, 32));
        idata_b <= std_logic_vector(to_unsigned(60665, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 235
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(41855, 32));
        idata_b <= std_logic_vector(to_unsigned(62264, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 236
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(30286, 32));
        idata_b <= std_logic_vector(to_unsigned(29181, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 237
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(35086, 32));
        idata_b <= std_logic_vector(to_unsigned(37148, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 238
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(20755, 32));
        idata_b <= std_logic_vector(to_unsigned(26653, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 239
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(30088, 32));
        idata_b <= std_logic_vector(to_unsigned(13344, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 8, 32) SEVERITY ERROR;
        
        -- test 240
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(19729, 32));
        idata_b <= std_logic_vector(to_unsigned(46368, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 241
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(44475, 32));
        idata_b <= std_logic_vector(to_unsigned(44040, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 15, 32) SEVERITY ERROR;
        
        -- test 242
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(36691, 32));
        idata_b <= std_logic_vector(to_unsigned(2735, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 243
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(27268, 32));
        idata_b <= std_logic_vector(to_unsigned(9778, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 244
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(26911, 32));
        idata_b <= std_logic_vector(to_unsigned(53348, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 245
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(10168, 32));
        idata_b <= std_logic_vector(to_unsigned(50232, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 8, 32) SEVERITY ERROR;
        
        -- test 246
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(53620, 32));
        idata_b <= std_logic_vector(to_unsigned(54115, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 5, 32) SEVERITY ERROR;
        
        -- test 247
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(36834, 32));
        idata_b <= std_logic_vector(to_unsigned(39926, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 248
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(44210, 32));
        idata_b <= std_logic_vector(to_unsigned(12487, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 249
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(10139, 32));
        idata_b <= std_logic_vector(to_unsigned(37687, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 250
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(7616, 32));
        idata_b <= std_logic_vector(to_unsigned(51995, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 251
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(34416, 32));
        idata_b <= std_logic_vector(to_unsigned(37902, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 6, 32) SEVERITY ERROR;
        
        -- test 252
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(15640, 32));
        idata_b <= std_logic_vector(to_unsigned(3966, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 253
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(9514, 32));
        idata_b <= std_logic_vector(to_unsigned(36395, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 254
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(30620, 32));
        idata_b <= std_logic_vector(to_unsigned(39603, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 255
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(49739, 32));
        idata_b <= std_logic_vector(to_unsigned(50349, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 256
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(20435, 32));
        idata_b <= std_logic_vector(to_unsigned(28678, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 257
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(28853, 32));
        idata_b <= std_logic_vector(to_unsigned(57127, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 258
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(31414, 32));
        idata_b <= std_logic_vector(to_unsigned(56121, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 259
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(1369, 32));
        idata_b <= std_logic_vector(to_unsigned(58325, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 260
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(43933, 32));
        idata_b <= std_logic_vector(to_unsigned(11537, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 261
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(43021, 32));
        idata_b <= std_logic_vector(to_unsigned(32018, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 262
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(116, 32));
        idata_b <= std_logic_vector(to_unsigned(14320, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 263
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(6408, 32));
        idata_b <= std_logic_vector(to_unsigned(44326, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 264
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(26807, 32));
        idata_b <= std_logic_vector(to_unsigned(16548, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 265
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(16477, 32));
        idata_b <= std_logic_vector(to_unsigned(34424, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 266
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(3007, 32));
        idata_b <= std_logic_vector(to_unsigned(50893, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 267
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(6790, 32));
        idata_b <= std_logic_vector(to_unsigned(18647, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 268
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(54860, 32));
        idata_b <= std_logic_vector(to_unsigned(16305, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 5, 32) SEVERITY ERROR;
        
        -- test 269
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(55042, 32));
        idata_b <= std_logic_vector(to_unsigned(19944, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 270
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(55908, 32));
        idata_b <= std_logic_vector(to_unsigned(39245, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 271
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(4757, 32));
        idata_b <= std_logic_vector(to_unsigned(10807, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 272
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(2388, 32));
        idata_b <= std_logic_vector(to_unsigned(33610, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 273
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(2398, 32));
        idata_b <= std_logic_vector(to_unsigned(33802, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 274
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(24196, 32));
        idata_b <= std_logic_vector(to_unsigned(3767, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 275
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(26591, 32));
        idata_b <= std_logic_vector(to_unsigned(2593, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 276
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(15304, 32));
        idata_b <= std_logic_vector(to_unsigned(4076, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 277
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(34611, 32));
        idata_b <= std_logic_vector(to_unsigned(15420, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 278
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(18396, 32));
        idata_b <= std_logic_vector(to_unsigned(41020, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 28, 32) SEVERITY ERROR;
        
        -- test 279
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(59746, 32));
        idata_b <= std_logic_vector(to_unsigned(45204, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 280
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(57568, 32));
        idata_b <= std_logic_vector(to_unsigned(10688, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 32, 32) SEVERITY ERROR;
        
        -- test 281
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(14092, 32));
        idata_b <= std_logic_vector(to_unsigned(60575, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 282
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(61581, 32));
        idata_b <= std_logic_vector(to_unsigned(20882, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 283
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(13686, 32));
        idata_b <= std_logic_vector(to_unsigned(50905, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 284
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(37187, 32));
        idata_b <= std_logic_vector(to_unsigned(3192, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 285
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(5313, 32));
        idata_b <= std_logic_vector(to_unsigned(27559, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 7, 32) SEVERITY ERROR;
        
        -- test 286
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(42437, 32));
        idata_b <= std_logic_vector(to_unsigned(10070, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 287
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(38367, 32));
        idata_b <= std_logic_vector(to_unsigned(44825, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 288
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(43681, 32));
        idata_b <= std_logic_vector(to_unsigned(40765, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 289
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(13091, 32));
        idata_b <= std_logic_vector(to_unsigned(2341, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 290
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(44533, 32));
        idata_b <= std_logic_vector(to_unsigned(39682, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 291
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(4934, 32));
        idata_b <= std_logic_vector(to_unsigned(59837, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 292
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(43759, 32));
        idata_b <= std_logic_vector(to_unsigned(39546, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 293
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(9722, 32));
        idata_b <= std_logic_vector(to_unsigned(62155, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 294
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(15030, 32));
        idata_b <= std_logic_vector(to_unsigned(3932, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 295
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(41823, 32));
        idata_b <= std_logic_vector(to_unsigned(7062, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 296
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(14620, 32));
        idata_b <= std_logic_vector(to_unsigned(55915, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 5, 32) SEVERITY ERROR;
        
        -- test 297
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(2101, 32));
        idata_b <= std_logic_vector(to_unsigned(10666, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 298
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(11262, 32));
        idata_b <= std_logic_vector(to_unsigned(15787, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 299
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(61571, 32));
        idata_b <= std_logic_vector(to_unsigned(48449, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 300
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(18979, 32));
        idata_b <= std_logic_vector(to_unsigned(1349, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 301
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(10473, 32));
        idata_b <= std_logic_vector(to_unsigned(61416, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 302
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(11419, 32));
        idata_b <= std_logic_vector(to_unsigned(48840, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 303
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(40706, 32));
        idata_b <= std_logic_vector(to_unsigned(55100, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 304
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(24069, 32));
        idata_b <= std_logic_vector(to_unsigned(53797, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 305
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(57441, 32));
        idata_b <= std_logic_vector(to_unsigned(3066, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 306
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(27944, 32));
        idata_b <= std_logic_vector(to_unsigned(62376, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 8, 32) SEVERITY ERROR;
        
        -- test 307
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(62904, 32));
        idata_b <= std_logic_vector(to_unsigned(6167, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 308
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(36386, 32));
        idata_b <= std_logic_vector(to_unsigned(7090, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 309
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(2786, 32));
        idata_b <= std_logic_vector(to_unsigned(51416, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 310
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(11022, 32));
        idata_b <= std_logic_vector(to_unsigned(44610, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 6, 32) SEVERITY ERROR;
        
        -- test 311
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(58478, 32));
        idata_b <= std_logic_vector(to_unsigned(25643, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 312
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(34989, 32));
        idata_b <= std_logic_vector(to_unsigned(60579, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 313
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(36309, 32));
        idata_b <= std_logic_vector(to_unsigned(46251, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 314
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(10830, 32));
        idata_b <= std_logic_vector(to_unsigned(32344, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 315
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(29165, 32));
        idata_b <= std_logic_vector(to_unsigned(29809, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 316
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(33693, 32));
        idata_b <= std_logic_vector(to_unsigned(39638, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 317
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(25689, 32));
        idata_b <= std_logic_vector(to_unsigned(45113, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 318
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(22942, 32));
        idata_b <= std_logic_vector(to_unsigned(859, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 319
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(34677, 32));
        idata_b <= std_logic_vector(to_unsigned(47011, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 320
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(54657, 32));
        idata_b <= std_logic_vector(to_unsigned(26583, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 321
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(50078, 32));
        idata_b <= std_logic_vector(to_unsigned(17065, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 322
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(23423, 32));
        idata_b <= std_logic_vector(to_unsigned(47446, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 323
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(23232, 32));
        idata_b <= std_logic_vector(to_unsigned(59809, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 324
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(54536, 32));
        idata_b <= std_logic_vector(to_unsigned(26018, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 325
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(45689, 32));
        idata_b <= std_logic_vector(to_unsigned(22, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 326
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(5092, 32));
        idata_b <= std_logic_vector(to_unsigned(38631, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 327
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(25665, 32));
        idata_b <= std_logic_vector(to_unsigned(40082, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 328
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(33674, 32));
        idata_b <= std_logic_vector(to_unsigned(61974, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 329
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(20797, 32));
        idata_b <= std_logic_vector(to_unsigned(44504, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 330
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(28783, 32));
        idata_b <= std_logic_vector(to_unsigned(49962, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 331
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(8777, 32));
        idata_b <= std_logic_vector(to_unsigned(62476, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 332
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(24064, 32));
        idata_b <= std_logic_vector(to_unsigned(34466, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 333
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(42053, 32));
        idata_b <= std_logic_vector(to_unsigned(47006, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 334
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(35326, 32));
        idata_b <= std_logic_vector(to_unsigned(11195, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 335
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(28482, 32));
        idata_b <= std_logic_vector(to_unsigned(24447, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 336
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(37778, 32));
        idata_b <= std_logic_vector(to_unsigned(13024, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 337
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(41512, 32));
        idata_b <= std_logic_vector(to_unsigned(61201, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 338
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(60470, 32));
        idata_b <= std_logic_vector(to_unsigned(64744, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 339
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(55474, 32));
        idata_b <= std_logic_vector(to_unsigned(49470, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 340
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(25226, 32));
        idata_b <= std_logic_vector(to_unsigned(35627, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 341
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(49492, 32));
        idata_b <= std_logic_vector(to_unsigned(30319, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 342
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(8722, 32));
        idata_b <= std_logic_vector(to_unsigned(9622, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 343
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(4865, 32));
        idata_b <= std_logic_vector(to_unsigned(42396, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 344
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(6060, 32));
        idata_b <= std_logic_vector(to_unsigned(25662, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 6, 32) SEVERITY ERROR;
        
        -- test 345
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(21364, 32));
        idata_b <= std_logic_vector(to_unsigned(34843, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 346
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(10089, 32));
        idata_b <= std_logic_vector(to_unsigned(30141, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 9, 32) SEVERITY ERROR;
        
        -- test 347
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(31784, 32));
        idata_b <= std_logic_vector(to_unsigned(34153, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 348
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(64607, 32));
        idata_b <= std_logic_vector(to_unsigned(8301, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 349
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(15624, 32));
        idata_b <= std_logic_vector(to_unsigned(34397, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 350
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(19496, 32));
        idata_b <= std_logic_vector(to_unsigned(44106, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 351
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(58844, 32));
        idata_b <= std_logic_vector(to_unsigned(57274, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 352
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(57130, 32));
        idata_b <= std_logic_vector(to_unsigned(34820, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 10, 32) SEVERITY ERROR;
        
        -- test 353
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(52939, 32));
        idata_b <= std_logic_vector(to_unsigned(52064, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 354
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(34028, 32));
        idata_b <= std_logic_vector(to_unsigned(42877, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 355
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(35998, 32));
        idata_b <= std_logic_vector(to_unsigned(59255, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 356
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(12968, 32));
        idata_b <= std_logic_vector(to_unsigned(19954, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 357
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(24038, 32));
        idata_b <= std_logic_vector(to_unsigned(21690, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 358
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(29576, 32));
        idata_b <= std_logic_vector(to_unsigned(28903, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 359
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(64086, 32));
        idata_b <= std_logic_vector(to_unsigned(35637, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 360
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(54565, 32));
        idata_b <= std_logic_vector(to_unsigned(19914, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 361
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(4944, 32));
        idata_b <= std_logic_vector(to_unsigned(64654, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 362
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(50055, 32));
        idata_b <= std_logic_vector(to_unsigned(36728, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 363
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(33272, 32));
        idata_b <= std_logic_vector(to_unsigned(49127, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 364
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(45030, 32));
        idata_b <= std_logic_vector(to_unsigned(48896, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 365
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(17988, 32));
        idata_b <= std_logic_vector(to_unsigned(64526, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 366
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(27466, 32));
        idata_b <= std_logic_vector(to_unsigned(11297, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 367
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(56265, 32));
        idata_b <= std_logic_vector(to_unsigned(19060, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 5, 32) SEVERITY ERROR;
        
        -- test 368
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(46117, 32));
        idata_b <= std_logic_vector(to_unsigned(43668, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 369
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(5588, 32));
        idata_b <= std_logic_vector(to_unsigned(14610, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 370
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(21010, 32));
        idata_b <= std_logic_vector(to_unsigned(41586, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 371
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(8329, 32));
        idata_b <= std_logic_vector(to_unsigned(33978, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 372
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(61540, 32));
        idata_b <= std_logic_vector(to_unsigned(32367, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 373
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(55669, 32));
        idata_b <= std_logic_vector(to_unsigned(25581, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 374
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(61270, 32));
        idata_b <= std_logic_vector(to_unsigned(54219, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 11, 32) SEVERITY ERROR;
        
        -- test 375
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(61218, 32));
        idata_b <= std_logic_vector(to_unsigned(50299, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 179, 32) SEVERITY ERROR;
        
        -- test 376
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(8598, 32));
        idata_b <= std_logic_vector(to_unsigned(626, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 377
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(49418, 32));
        idata_b <= std_logic_vector(to_unsigned(58653, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 378
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(37355, 32));
        idata_b <= std_logic_vector(to_unsigned(17154, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 379
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(42244, 32));
        idata_b <= std_logic_vector(to_unsigned(16849, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 380
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(514, 32));
        idata_b <= std_logic_vector(to_unsigned(60233, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 381
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(15839, 32));
        idata_b <= std_logic_vector(to_unsigned(27980, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 382
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(5994, 32));
        idata_b <= std_logic_vector(to_unsigned(6568, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 383
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(47040, 32));
        idata_b <= std_logic_vector(to_unsigned(52111, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 384
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(50237, 32));
        idata_b <= std_logic_vector(to_unsigned(52628, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 385
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(1185, 32));
        idata_b <= std_logic_vector(to_unsigned(5711, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 386
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(28678, 32));
        idata_b <= std_logic_vector(to_unsigned(9514, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 387
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(39689, 32));
        idata_b <= std_logic_vector(to_unsigned(24682, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 43, 32) SEVERITY ERROR;
        
        -- test 388
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(41881, 32));
        idata_b <= std_logic_vector(to_unsigned(29822, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 31, 32) SEVERITY ERROR;
        
        -- test 389
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(50263, 32));
        idata_b <= std_logic_vector(to_unsigned(37615, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 390
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(18506, 32));
        idata_b <= std_logic_vector(to_unsigned(45945, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 391
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(22379, 32));
        idata_b <= std_logic_vector(to_unsigned(27104, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 7, 32) SEVERITY ERROR;
        
        -- test 392
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(46572, 32));
        idata_b <= std_logic_vector(to_unsigned(6261, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 393
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(20221, 32));
        idata_b <= std_logic_vector(to_unsigned(18391, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 394
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(23415, 32));
        idata_b <= std_logic_vector(to_unsigned(62466, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 395
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(35240, 32));
        idata_b <= std_logic_vector(to_unsigned(23929, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 396
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(57163, 32));
        idata_b <= std_logic_vector(to_unsigned(51079, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 397
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(51909, 32));
        idata_b <= std_logic_vector(to_unsigned(63157, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 398
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(57648, 32));
        idata_b <= std_logic_vector(to_unsigned(33413, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 399
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(49732, 32));
        idata_b <= std_logic_vector(to_unsigned(42349, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 400
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(20505, 32));
        idata_b <= std_logic_vector(to_unsigned(50918, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 401
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(48060, 32));
        idata_b <= std_logic_vector(to_unsigned(49183, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 402
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(60432, 32));
        idata_b <= std_logic_vector(to_unsigned(22213, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 403
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(8329, 32));
        idata_b <= std_logic_vector(to_unsigned(36778, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 404
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(52036, 32));
        idata_b <= std_logic_vector(to_unsigned(58593, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 405
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(8857, 32));
        idata_b <= std_logic_vector(to_unsigned(5006, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 406
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(39002, 32));
        idata_b <= std_logic_vector(to_unsigned(31236, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 407
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(32110, 32));
        idata_b <= std_logic_vector(to_unsigned(20038, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 408
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(37497, 32));
        idata_b <= std_logic_vector(to_unsigned(52331, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 409
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(38429, 32));
        idata_b <= std_logic_vector(to_unsigned(60912, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 410
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(49261, 32));
        idata_b <= std_logic_vector(to_unsigned(8133, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 411
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(19305, 32));
        idata_b <= std_logic_vector(to_unsigned(40888, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 412
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(59213, 32));
        idata_b <= std_logic_vector(to_unsigned(5678, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 413
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(38509, 32));
        idata_b <= std_logic_vector(to_unsigned(51325, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 414
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(39091, 32));
        idata_b <= std_logic_vector(to_unsigned(22706, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 415
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(28138, 32));
        idata_b <= std_logic_vector(to_unsigned(59596, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 416
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(8088, 32));
        idata_b <= std_logic_vector(to_unsigned(10662, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 6, 32) SEVERITY ERROR;
        
        -- test 417
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(43243, 32));
        idata_b <= std_logic_vector(to_unsigned(2984, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 418
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(32875, 32));
        idata_b <= std_logic_vector(to_unsigned(51573, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 419
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(39762, 32));
        idata_b <= std_logic_vector(to_unsigned(19375, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 420
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(44630, 32));
        idata_b <= std_logic_vector(to_unsigned(48620, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 10, 32) SEVERITY ERROR;
        
        -- test 421
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(24381, 32));
        idata_b <= std_logic_vector(to_unsigned(18096, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 422
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(14320, 32));
        idata_b <= std_logic_vector(to_unsigned(56491, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 423
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(38135, 32));
        idata_b <= std_logic_vector(to_unsigned(51818, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 424
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(43287, 32));
        idata_b <= std_logic_vector(to_unsigned(11028, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 425
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(47194, 32));
        idata_b <= std_logic_vector(to_unsigned(27012, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 426
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(19162, 32));
        idata_b <= std_logic_vector(to_unsigned(964, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 427
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(2365, 32));
        idata_b <= std_logic_vector(to_unsigned(12839, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 428
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(6642, 32));
        idata_b <= std_logic_vector(to_unsigned(40874, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 429
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(64164, 32));
        idata_b <= std_logic_vector(to_unsigned(45734, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 430
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(63580, 32));
        idata_b <= std_logic_vector(to_unsigned(26766, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 431
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(39794, 32));
        idata_b <= std_logic_vector(to_unsigned(6132, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 432
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(37428, 32));
        idata_b <= std_logic_vector(to_unsigned(17502, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 6, 32) SEVERITY ERROR;
        
        -- test 433
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(9117, 32));
        idata_b <= std_logic_vector(to_unsigned(4767, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 434
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(3539, 32));
        idata_b <= std_logic_vector(to_unsigned(48879, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 435
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(24143, 32));
        idata_b <= std_logic_vector(to_unsigned(48169, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 436
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(31963, 32));
        idata_b <= std_logic_vector(to_unsigned(48524, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 437
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(729, 32));
        idata_b <= std_logic_vector(to_unsigned(46284, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 438
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(39480, 32));
        idata_b <= std_logic_vector(to_unsigned(38864, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 56, 32) SEVERITY ERROR;
        
        -- test 439
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(32566, 32));
        idata_b <= std_logic_vector(to_unsigned(17231, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 440
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(49893, 32));
        idata_b <= std_logic_vector(to_unsigned(14224, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 441
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(44243, 32));
        idata_b <= std_logic_vector(to_unsigned(3519, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 442
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(15188, 32));
        idata_b <= std_logic_vector(to_unsigned(46608, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 443
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(16358, 32));
        idata_b <= std_logic_vector(to_unsigned(21831, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 444
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(21947, 32));
        idata_b <= std_logic_vector(to_unsigned(14986, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 445
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(2029, 32));
        idata_b <= std_logic_vector(to_unsigned(19991, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 446
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(41752, 32));
        idata_b <= std_logic_vector(to_unsigned(41823, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 447
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(26124, 32));
        idata_b <= std_logic_vector(to_unsigned(13644, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 12, 32) SEVERITY ERROR;
        
        -- test 448
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(59325, 32));
        idata_b <= std_logic_vector(to_unsigned(35241, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 449
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(18411, 32));
        idata_b <= std_logic_vector(to_unsigned(62864, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 450
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(18584, 32));
        idata_b <= std_logic_vector(to_unsigned(42554, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 451
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(45497, 32));
        idata_b <= std_logic_vector(to_unsigned(50548, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 452
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(25543, 32));
        idata_b <= std_logic_vector(to_unsigned(46227, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 453
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(31296, 32));
        idata_b <= std_logic_vector(to_unsigned(65023, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 454
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(19555, 32));
        idata_b <= std_logic_vector(to_unsigned(63862, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 455
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(16718, 32));
        idata_b <= std_logic_vector(to_unsigned(3912, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 456
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(12550, 32));
        idata_b <= std_logic_vector(to_unsigned(60961, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 457
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(7431, 32));
        idata_b <= std_logic_vector(to_unsigned(27739, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 458
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(42034, 32));
        idata_b <= std_logic_vector(to_unsigned(23789, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 459
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(49570, 32));
        idata_b <= std_logic_vector(to_unsigned(63981, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 460
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(38775, 32));
        idata_b <= std_logic_vector(to_unsigned(51599, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 461
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(18436, 32));
        idata_b <= std_logic_vector(to_unsigned(14991, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 462
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(27886, 32));
        idata_b <= std_logic_vector(to_unsigned(44560, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 463
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(28635, 32));
        idata_b <= std_logic_vector(to_unsigned(21676, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 464
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(14265, 32));
        idata_b <= std_logic_vector(to_unsigned(47047, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 465
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(19004, 32));
        idata_b <= std_logic_vector(to_unsigned(32850, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 466
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(24065, 32));
        idata_b <= std_logic_vector(to_unsigned(64502, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 467
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(17862, 32));
        idata_b <= std_logic_vector(to_unsigned(49608, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 78, 32) SEVERITY ERROR;
        
        -- test 468
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(45193, 32));
        idata_b <= std_logic_vector(to_unsigned(49158, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 469
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(49095, 32));
        idata_b <= std_logic_vector(to_unsigned(64748, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 470
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(47484, 32));
        idata_b <= std_logic_vector(to_unsigned(277, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 471
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(3125, 32));
        idata_b <= std_logic_vector(to_unsigned(60034, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 472
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(61239, 32));
        idata_b <= std_logic_vector(to_unsigned(10556, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 473
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(22237, 32));
        idata_b <= std_logic_vector(to_unsigned(37737, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 474
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(34346, 32));
        idata_b <= std_logic_vector(to_unsigned(6271, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 475
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(36182, 32));
        idata_b <= std_logic_vector(to_unsigned(7585, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 476
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(57870, 32));
        idata_b <= std_logic_vector(to_unsigned(54618, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 6, 32) SEVERITY ERROR;
        
        -- test 477
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(22577, 32));
        idata_b <= std_logic_vector(to_unsigned(20221, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 478
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(33643, 32));
        idata_b <= std_logic_vector(to_unsigned(51212, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 479
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(41897, 32));
        idata_b <= std_logic_vector(to_unsigned(47908, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 480
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(32723, 32));
        idata_b <= std_logic_vector(to_unsigned(60901, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 481
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(15222, 32));
        idata_b <= std_logic_vector(to_unsigned(56789, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 482
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(59867, 32));
        idata_b <= std_logic_vector(to_unsigned(33084, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 483
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(40861, 32));
        idata_b <= std_logic_vector(to_unsigned(39524, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 484
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(16706, 32));
        idata_b <= std_logic_vector(to_unsigned(24421, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 485
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(38737, 32));
        idata_b <= std_logic_vector(to_unsigned(64190, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 486
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(24698, 32));
        idata_b <= std_logic_vector(to_unsigned(41862, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 487
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(58689, 32));
        idata_b <= std_logic_vector(to_unsigned(20401, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 488
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(52418, 32));
        idata_b <= std_logic_vector(to_unsigned(15390, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 489
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(58138, 32));
        idata_b <= std_logic_vector(to_unsigned(21228, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 490
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(21662, 32));
        idata_b <= std_logic_vector(to_unsigned(28784, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 491
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(28814, 32));
        idata_b <= std_logic_vector(to_unsigned(13996, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 492
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(17867, 32));
        idata_b <= std_logic_vector(to_unsigned(51391, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 17, 32) SEVERITY ERROR;
        
        -- test 493
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(34217, 32));
        idata_b <= std_logic_vector(to_unsigned(51510, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 494
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(37067, 32));
        idata_b <= std_logic_vector(to_unsigned(10578, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 495
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(33882, 32));
        idata_b <= std_logic_vector(to_unsigned(4255, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 496
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(5944, 32));
        idata_b <= std_logic_vector(to_unsigned(49105, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 497
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(61044, 32));
        idata_b <= std_logic_vector(to_unsigned(275, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 498
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(16653, 32));
        idata_b <= std_logic_vector(to_unsigned(36369, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 499
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(39800, 32));
        idata_b <= std_logic_vector(to_unsigned(33360, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 40, 32) SEVERITY ERROR;
        
        -- test 500
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(60790, 32));
        idata_b <= std_logic_vector(to_unsigned(13001, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 501
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(32014, 32));
        idata_b <= std_logic_vector(to_unsigned(19953, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 502
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(54863, 32));
        idata_b <= std_logic_vector(to_unsigned(25167, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 503
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(40354, 32));
        idata_b <= std_logic_vector(to_unsigned(41745, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 504
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(40558, 32));
        idata_b <= std_logic_vector(to_unsigned(32957, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 505
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(62974, 32));
        idata_b <= std_logic_vector(to_unsigned(62220, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 506
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(61741, 32));
        idata_b <= std_logic_vector(to_unsigned(26252, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 507
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(10680, 32));
        idata_b <= std_logic_vector(to_unsigned(14072, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 8, 32) SEVERITY ERROR;
        
        -- test 508
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(12107, 32));
        idata_b <= std_logic_vector(to_unsigned(44898, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 509
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(46, 32));
        idata_b <= std_logic_vector(to_unsigned(49174, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 46, 32) SEVERITY ERROR;
        
        -- test 510
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(55476, 32));
        idata_b <= std_logic_vector(to_unsigned(33929, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 511
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(53429, 32));
        idata_b <= std_logic_vector(to_unsigned(61420, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 512
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(17498, 32));
        idata_b <= std_logic_vector(to_unsigned(48937, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 513
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(61696, 32));
        idata_b <= std_logic_vector(to_unsigned(34151, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 514
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(19771, 32));
        idata_b <= std_logic_vector(to_unsigned(35960, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 515
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(1975, 32));
        idata_b <= std_logic_vector(to_unsigned(15025, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 25, 32) SEVERITY ERROR;
        
        -- test 516
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(48961, 32));
        idata_b <= std_logic_vector(to_unsigned(33990, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 11, 32) SEVERITY ERROR;
        
        -- test 517
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(34978, 32));
        idata_b <= std_logic_vector(to_unsigned(38288, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 518
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(59157, 32));
        idata_b <= std_logic_vector(to_unsigned(9797, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 519
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(14497, 32));
        idata_b <= std_logic_vector(to_unsigned(34179, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 520
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(42754, 32));
        idata_b <= std_logic_vector(to_unsigned(11935, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 521
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(30863, 32));
        idata_b <= std_logic_vector(to_unsigned(38959, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 522
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(38187, 32));
        idata_b <= std_logic_vector(to_unsigned(41544, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 9, 32) SEVERITY ERROR;
        
        -- test 523
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(53032, 32));
        idata_b <= std_logic_vector(to_unsigned(50294, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 524
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(20906, 32));
        idata_b <= std_logic_vector(to_unsigned(53078, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 525
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(33933, 32));
        idata_b <= std_logic_vector(to_unsigned(10846, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 526
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(21471, 32));
        idata_b <= std_logic_vector(to_unsigned(21826, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 527
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(6731, 32));
        idata_b <= std_logic_vector(to_unsigned(38969, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 528
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(5228, 32));
        idata_b <= std_logic_vector(to_unsigned(2891, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 529
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(7585, 32));
        idata_b <= std_logic_vector(to_unsigned(24999, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 530
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(38851, 32));
        idata_b <= std_logic_vector(to_unsigned(9560, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 531
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(40024, 32));
        idata_b <= std_logic_vector(to_unsigned(22276, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 532
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(43550, 32));
        idata_b <= std_logic_vector(to_unsigned(9467, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 533
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(60564, 32));
        idata_b <= std_logic_vector(to_unsigned(37172, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 534
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(19264, 32));
        idata_b <= std_logic_vector(to_unsigned(9525, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 535
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(5815, 32));
        idata_b <= std_logic_vector(to_unsigned(62018, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 536
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(21461, 32));
        idata_b <= std_logic_vector(to_unsigned(36679, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 537
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(35441, 32));
        idata_b <= std_logic_vector(to_unsigned(59648, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 538
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(12687, 32));
        idata_b <= std_logic_vector(to_unsigned(22937, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 539
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(44407, 32));
        idata_b <= std_logic_vector(to_unsigned(33593, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 540
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(10480, 32));
        idata_b <= std_logic_vector(to_unsigned(12804, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 541
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(44439, 32));
        idata_b <= std_logic_vector(to_unsigned(31951, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 542
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(34630, 32));
        idata_b <= std_logic_vector(to_unsigned(51170, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 10, 32) SEVERITY ERROR;
        
        -- test 543
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(5385, 32));
        idata_b <= std_logic_vector(to_unsigned(39858, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 544
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(54061, 32));
        idata_b <= std_logic_vector(to_unsigned(12970, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 545
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(64857, 32));
        idata_b <= std_logic_vector(to_unsigned(27376, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 546
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(22530, 32));
        idata_b <= std_logic_vector(to_unsigned(39346, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 547
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(49652, 32));
        idata_b <= std_logic_vector(to_unsigned(545, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 548
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(48813, 32));
        idata_b <= std_logic_vector(to_unsigned(44680, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 549
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(37717, 32));
        idata_b <= std_logic_vector(to_unsigned(2541, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 550
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(54206, 32));
        idata_b <= std_logic_vector(to_unsigned(43532, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 551
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(64559, 32));
        idata_b <= std_logic_vector(to_unsigned(10131, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 11, 32) SEVERITY ERROR;
        
        -- test 552
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(14675, 32));
        idata_b <= std_logic_vector(to_unsigned(34464, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 553
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(4243, 32));
        idata_b <= std_logic_vector(to_unsigned(27362, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 554
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(57402, 32));
        idata_b <= std_logic_vector(to_unsigned(48650, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 555
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(60955, 32));
        idata_b <= std_logic_vector(to_unsigned(2346, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 556
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(61454, 32));
        idata_b <= std_logic_vector(to_unsigned(39859, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 557
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(34297, 32));
        idata_b <= std_logic_vector(to_unsigned(30549, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 558
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(25493, 32));
        idata_b <= std_logic_vector(to_unsigned(39682, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 559
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(4871, 32));
        idata_b <= std_logic_vector(to_unsigned(14019, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 560
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(52652, 32));
        idata_b <= std_logic_vector(to_unsigned(4193, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 561
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(41395, 32));
        idata_b <= std_logic_vector(to_unsigned(9647, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 562
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(43539, 32));
        idata_b <= std_logic_vector(to_unsigned(25512, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 563
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(10192, 32));
        idata_b <= std_logic_vector(to_unsigned(26816, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 16, 32) SEVERITY ERROR;
        
        -- test 564
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(4656, 32));
        idata_b <= std_logic_vector(to_unsigned(47909, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 565
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(29357, 32));
        idata_b <= std_logic_vector(to_unsigned(58862, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 566
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(25905, 32));
        idata_b <= std_logic_vector(to_unsigned(28380, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 165, 32) SEVERITY ERROR;
        
        -- test 567
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(3457, 32));
        idata_b <= std_logic_vector(to_unsigned(40581, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 568
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(62844, 32));
        idata_b <= std_logic_vector(to_unsigned(7701, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 569
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(2407, 32));
        idata_b <= std_logic_vector(to_unsigned(54710, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 570
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(56351, 32));
        idata_b <= std_logic_vector(to_unsigned(63363, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 571
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(57056, 32));
        idata_b <= std_logic_vector(to_unsigned(52270, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 572
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(37686, 32));
        idata_b <= std_logic_vector(to_unsigned(25818, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 6, 32) SEVERITY ERROR;
        
        -- test 573
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(17283, 32));
        idata_b <= std_logic_vector(to_unsigned(63179, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 574
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(65500, 32));
        idata_b <= std_logic_vector(to_unsigned(22154, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 575
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(11662, 32));
        idata_b <= std_logic_vector(to_unsigned(52617, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 576
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(26347, 32));
        idata_b <= std_logic_vector(to_unsigned(53058, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 577
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(62264, 32));
        idata_b <= std_logic_vector(to_unsigned(4350, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 578
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(13034, 32));
        idata_b <= std_logic_vector(to_unsigned(6920, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 579
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(31166, 32));
        idata_b <= std_logic_vector(to_unsigned(17690, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 580
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(54829, 32));
        idata_b <= std_logic_vector(to_unsigned(60523, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 581
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(11017, 32));
        idata_b <= std_logic_vector(to_unsigned(15198, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 582
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(23367, 32));
        idata_b <= std_logic_vector(to_unsigned(14474, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 583
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(55779, 32));
        idata_b <= std_logic_vector(to_unsigned(20676, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 584
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(22175, 32));
        idata_b <= std_logic_vector(to_unsigned(58187, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 585
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(9850, 32));
        idata_b <= std_logic_vector(to_unsigned(12991, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 586
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(56014, 32));
        idata_b <= std_logic_vector(to_unsigned(1371, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 587
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(65261, 32));
        idata_b <= std_logic_vector(to_unsigned(28164, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 588
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(27189, 32));
        idata_b <= std_logic_vector(to_unsigned(17008, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 589
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(25807, 32));
        idata_b <= std_logic_vector(to_unsigned(27153, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 590
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(39162, 32));
        idata_b <= std_logic_vector(to_unsigned(37470, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 6, 32) SEVERITY ERROR;
        
        -- test 591
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(14234, 32));
        idata_b <= std_logic_vector(to_unsigned(65510, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 592
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(24992, 32));
        idata_b <= std_logic_vector(to_unsigned(10962, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 593
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(4324, 32));
        idata_b <= std_logic_vector(to_unsigned(38026, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 594
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(17882, 32));
        idata_b <= std_logic_vector(to_unsigned(35491, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 595
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(55716, 32));
        idata_b <= std_logic_vector(to_unsigned(7175, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 596
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(30478, 32));
        idata_b <= std_logic_vector(to_unsigned(1197, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 7, 32) SEVERITY ERROR;
        
        -- test 597
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(22374, 32));
        idata_b <= std_logic_vector(to_unsigned(53846, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 598
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(15672, 32));
        idata_b <= std_logic_vector(to_unsigned(12617, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 599
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(8986, 32));
        idata_b <= std_logic_vector(to_unsigned(37847, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 600
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(5268, 32));
        idata_b <= std_logic_vector(to_unsigned(18836, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 601
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(50838, 32));
        idata_b <= std_logic_vector(to_unsigned(61282, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 602
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(20207, 32));
        idata_b <= std_logic_vector(to_unsigned(50563, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 603
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(23910, 32));
        idata_b <= std_logic_vector(to_unsigned(47396, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 604
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(2035, 32));
        idata_b <= std_logic_vector(to_unsigned(49718, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 605
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(9014, 32));
        idata_b <= std_logic_vector(to_unsigned(41198, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 606
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(21652, 32));
        idata_b <= std_logic_vector(to_unsigned(23248, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 607
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(41172, 32));
        idata_b <= std_logic_vector(to_unsigned(46644, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 12, 32) SEVERITY ERROR;
        
        -- test 608
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(34211, 32));
        idata_b <= std_logic_vector(to_unsigned(45496, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 609
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(19134, 32));
        idata_b <= std_logic_vector(to_unsigned(52093, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 610
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(15451, 32));
        idata_b <= std_logic_vector(to_unsigned(9314, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 611
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(59269, 32));
        idata_b <= std_logic_vector(to_unsigned(45930, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 612
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(10512, 32));
        idata_b <= std_logic_vector(to_unsigned(16107, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 613
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(34240, 32));
        idata_b <= std_logic_vector(to_unsigned(26184, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 8, 32) SEVERITY ERROR;
        
        -- test 614
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(28724, 32));
        idata_b <= std_logic_vector(to_unsigned(43226, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 615
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(64031, 32));
        idata_b <= std_logic_vector(to_unsigned(33993, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 616
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(62062, 32));
        idata_b <= std_logic_vector(to_unsigned(49334, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 617
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(29739, 32));
        idata_b <= std_logic_vector(to_unsigned(16734, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 618
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(34361, 32));
        idata_b <= std_logic_vector(to_unsigned(53650, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 619
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(64130, 32));
        idata_b <= std_logic_vector(to_unsigned(36397, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 620
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(37832, 32));
        idata_b <= std_logic_vector(to_unsigned(7608, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 8, 32) SEVERITY ERROR;
        
        -- test 621
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(12059, 32));
        idata_b <= std_logic_vector(to_unsigned(59484, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 622
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(30857, 32));
        idata_b <= std_logic_vector(to_unsigned(53231, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 623
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(40592, 32));
        idata_b <= std_logic_vector(to_unsigned(65068, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 624
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(33191, 32));
        idata_b <= std_logic_vector(to_unsigned(59726, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 625
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(51625, 32));
        idata_b <= std_logic_vector(to_unsigned(48643, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 7, 32) SEVERITY ERROR;
        
        -- test 626
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(3504, 32));
        idata_b <= std_logic_vector(to_unsigned(45358, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 627
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(29037, 32));
        idata_b <= std_logic_vector(to_unsigned(14016, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 628
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(61465, 32));
        idata_b <= std_logic_vector(to_unsigned(63277, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 629
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(40200, 32));
        idata_b <= std_logic_vector(to_unsigned(24654, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 6, 32) SEVERITY ERROR;
        
        -- test 630
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(40967, 32));
        idata_b <= std_logic_vector(to_unsigned(38696, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 631
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(58647, 32));
        idata_b <= std_logic_vector(to_unsigned(37493, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 632
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(22494, 32));
        idata_b <= std_logic_vector(to_unsigned(22850, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 633
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(54227, 32));
        idata_b <= std_logic_vector(to_unsigned(56855, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 634
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(10964, 32));
        idata_b <= std_logic_vector(to_unsigned(52822, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 635
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(27716, 32));
        idata_b <= std_logic_vector(to_unsigned(48796, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 636
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(60430, 32));
        idata_b <= std_logic_vector(to_unsigned(39775, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 5, 32) SEVERITY ERROR;
        
        -- test 637
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(42744, 32));
        idata_b <= std_logic_vector(to_unsigned(25751, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 638
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(27470, 32));
        idata_b <= std_logic_vector(to_unsigned(17800, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 10, 32) SEVERITY ERROR;
        
        -- test 639
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(25283, 32));
        idata_b <= std_logic_vector(to_unsigned(60662, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 640
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(11990, 32));
        idata_b <= std_logic_vector(to_unsigned(11373, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 641
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(43769, 32));
        idata_b <= std_logic_vector(to_unsigned(15495, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 642
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(56731, 32));
        idata_b <= std_logic_vector(to_unsigned(7270, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 643
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(29511, 32));
        idata_b <= std_logic_vector(to_unsigned(52661, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 644
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(5011, 32));
        idata_b <= std_logic_vector(to_unsigned(4176, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 645
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(11779, 32));
        idata_b <= std_logic_vector(to_unsigned(45978, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 646
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(42872, 32));
        idata_b <= std_logic_vector(to_unsigned(4890, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 647
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(17935, 32));
        idata_b <= std_logic_vector(to_unsigned(65366, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 648
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(27740, 32));
        idata_b <= std_logic_vector(to_unsigned(6627, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 649
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(56685, 32));
        idata_b <= std_logic_vector(to_unsigned(38705, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 5, 32) SEVERITY ERROR;
        
        -- test 650
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(59449, 32));
        idata_b <= std_logic_vector(to_unsigned(18866, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 651
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(21965, 32));
        idata_b <= std_logic_vector(to_unsigned(54343, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 652
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(58641, 32));
        idata_b <= std_logic_vector(to_unsigned(64710, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 653
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(14559, 32));
        idata_b <= std_logic_vector(to_unsigned(20576, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 654
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(16974, 32));
        idata_b <= std_logic_vector(to_unsigned(39842, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 655
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(15702, 32));
        idata_b <= std_logic_vector(to_unsigned(28965, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 656
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(51215, 32));
        idata_b <= std_logic_vector(to_unsigned(59471, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 657
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(44460, 32));
        idata_b <= std_logic_vector(to_unsigned(42411, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 658
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(1205, 32));
        idata_b <= std_logic_vector(to_unsigned(8435, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1205, 32) SEVERITY ERROR;
        
        -- test 659
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(29536, 32));
        idata_b <= std_logic_vector(to_unsigned(6216, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 8, 32) SEVERITY ERROR;
        
        -- test 660
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(12611, 32));
        idata_b <= std_logic_vector(to_unsigned(41315, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 661
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(52194, 32));
        idata_b <= std_logic_vector(to_unsigned(55483, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 662
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(46205, 32));
        idata_b <= std_logic_vector(to_unsigned(4593, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 663
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(55313, 32));
        idata_b <= std_logic_vector(to_unsigned(8409, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 664
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(11220, 32));
        idata_b <= std_logic_vector(to_unsigned(46463, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 665
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(47114, 32));
        idata_b <= std_logic_vector(to_unsigned(5133, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 666
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(65329, 32));
        idata_b <= std_logic_vector(to_unsigned(3544, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 667
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(59477, 32));
        idata_b <= std_logic_vector(to_unsigned(58434, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 668
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(2718, 32));
        idata_b <= std_logic_vector(to_unsigned(8500, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 669
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(13474, 32));
        idata_b <= std_logic_vector(to_unsigned(19692, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 670
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(48342, 32));
        idata_b <= std_logic_vector(to_unsigned(29176, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 14, 32) SEVERITY ERROR;
        
        -- test 671
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(48657, 32));
        idata_b <= std_logic_vector(to_unsigned(34022, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 672
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(23111, 32));
        idata_b <= std_logic_vector(to_unsigned(27581, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 673
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(10897, 32));
        idata_b <= std_logic_vector(to_unsigned(24316, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 674
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(36017, 32));
        idata_b <= std_logic_vector(to_unsigned(40433, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 675
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(30532, 32));
        idata_b <= std_logic_vector(to_unsigned(48628, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 676
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(16212, 32));
        idata_b <= std_logic_vector(to_unsigned(17190, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 6, 32) SEVERITY ERROR;
        
        -- test 677
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(38576, 32));
        idata_b <= std_logic_vector(to_unsigned(62417, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 678
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(21784, 32));
        idata_b <= std_logic_vector(to_unsigned(28353, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 679
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(5290, 32));
        idata_b <= std_logic_vector(to_unsigned(33004, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 680
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(9280, 32));
        idata_b <= std_logic_vector(to_unsigned(52405, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 5, 32) SEVERITY ERROR;
        
        -- test 681
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(38138, 32));
        idata_b <= std_logic_vector(to_unsigned(9073, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 682
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(55949, 32));
        idata_b <= std_logic_vector(to_unsigned(32079, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 683
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(1972, 32));
        idata_b <= std_logic_vector(to_unsigned(58667, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 493, 32) SEVERITY ERROR;
        
        -- test 684
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(40579, 32));
        idata_b <= std_logic_vector(to_unsigned(15446, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 685
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(12823, 32));
        idata_b <= std_logic_vector(to_unsigned(23385, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 686
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(44623, 32));
        idata_b <= std_logic_vector(to_unsigned(61481, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 687
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(57407, 32));
        idata_b <= std_logic_vector(to_unsigned(2198, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 7, 32) SEVERITY ERROR;
        
        -- test 688
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(23526, 32));
        idata_b <= std_logic_vector(to_unsigned(2768, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 689
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(26515, 32));
        idata_b <= std_logic_vector(to_unsigned(59543, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 690
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(43201, 32));
        idata_b <= std_logic_vector(to_unsigned(57047, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 691
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(42636, 32));
        idata_b <= std_logic_vector(to_unsigned(59413, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 19, 32) SEVERITY ERROR;
        
        -- test 692
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(8702, 32));
        idata_b <= std_logic_vector(to_unsigned(15676, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 693
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(56294, 32));
        idata_b <= std_logic_vector(to_unsigned(30486, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 694
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(44029, 32));
        idata_b <= std_logic_vector(to_unsigned(61585, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 695
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(63490, 32));
        idata_b <= std_logic_vector(to_unsigned(53310, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 10, 32) SEVERITY ERROR;
        
        -- test 696
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(48454, 32));
        idata_b <= std_logic_vector(to_unsigned(36092, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 14, 32) SEVERITY ERROR;
        
        -- test 697
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(62383, 32));
        idata_b <= std_logic_vector(to_unsigned(38867, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 698
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(2635, 32));
        idata_b <= std_logic_vector(to_unsigned(64355, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 5, 32) SEVERITY ERROR;
        
        -- test 699
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(31998, 32));
        idata_b <= std_logic_vector(to_unsigned(43214, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 700
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(14266, 32));
        idata_b <= std_logic_vector(to_unsigned(44821, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 7, 32) SEVERITY ERROR;
        
        -- test 701
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(1064, 32));
        idata_b <= std_logic_vector(to_unsigned(58889, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 702
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(40766, 32));
        idata_b <= std_logic_vector(to_unsigned(58471, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 703
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(61087, 32));
        idata_b <= std_logic_vector(to_unsigned(64293, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 704
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(61240, 32));
        idata_b <= std_logic_vector(to_unsigned(22066, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 705
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(58300, 32));
        idata_b <= std_logic_vector(to_unsigned(38905, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 5, 32) SEVERITY ERROR;
        
        -- test 706
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(13578, 32));
        idata_b <= std_logic_vector(to_unsigned(35400, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 6, 32) SEVERITY ERROR;
        
        -- test 707
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(32783, 32));
        idata_b <= std_logic_vector(to_unsigned(22280, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 708
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(51076, 32));
        idata_b <= std_logic_vector(to_unsigned(23541, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 709
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(52766, 32));
        idata_b <= std_logic_vector(to_unsigned(29570, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 710
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(19590, 32));
        idata_b <= std_logic_vector(to_unsigned(50720, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 10, 32) SEVERITY ERROR;
        
        -- test 711
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(17344, 32));
        idata_b <= std_logic_vector(to_unsigned(2508, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 712
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(21277, 32));
        idata_b <= std_logic_vector(to_unsigned(14191, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 713
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(41375, 32));
        idata_b <= std_logic_vector(to_unsigned(23912, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 714
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(13011, 32));
        idata_b <= std_logic_vector(to_unsigned(7837, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 715
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(1591, 32));
        idata_b <= std_logic_vector(to_unsigned(27277, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 716
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(52659, 32));
        idata_b <= std_logic_vector(to_unsigned(2655, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 9, 32) SEVERITY ERROR;
        
        -- test 717
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(20630, 32));
        idata_b <= std_logic_vector(to_unsigned(27889, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 718
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(61126, 32));
        idata_b <= std_logic_vector(to_unsigned(16181, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 719
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(26646, 32));
        idata_b <= std_logic_vector(to_unsigned(56830, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 720
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(38248, 32));
        idata_b <= std_logic_vector(to_unsigned(19411, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 7, 32) SEVERITY ERROR;
        
        -- test 721
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(30200, 32));
        idata_b <= std_logic_vector(to_unsigned(51826, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 722
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(54811, 32));
        idata_b <= std_logic_vector(to_unsigned(62983, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 723
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(8570, 32));
        idata_b <= std_logic_vector(to_unsigned(40352, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 724
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(20988, 32));
        idata_b <= std_logic_vector(to_unsigned(61336, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 44, 32) SEVERITY ERROR;
        
        -- test 725
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(4386, 32));
        idata_b <= std_logic_vector(to_unsigned(40579, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 17, 32) SEVERITY ERROR;
        
        -- test 726
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(46520, 32));
        idata_b <= std_logic_vector(to_unsigned(21730, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 10, 32) SEVERITY ERROR;
        
        -- test 727
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(43087, 32));
        idata_b <= std_logic_vector(to_unsigned(2261, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 728
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(35921, 32));
        idata_b <= std_logic_vector(to_unsigned(18927, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 729
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(26174, 32));
        idata_b <= std_logic_vector(to_unsigned(48932, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 730
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(26764, 32));
        idata_b <= std_logic_vector(to_unsigned(27765, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 731
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(10673, 32));
        idata_b <= std_logic_vector(to_unsigned(13887, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 732
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(30420, 32));
        idata_b <= std_logic_vector(to_unsigned(31303, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 733
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(41777, 32));
        idata_b <= std_logic_vector(to_unsigned(26010, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 734
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(47485, 32));
        idata_b <= std_logic_vector(to_unsigned(2887, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 735
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(17305, 32));
        idata_b <= std_logic_vector(to_unsigned(20197, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 736
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(22298, 32));
        idata_b <= std_logic_vector(to_unsigned(47505, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 737
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(6487, 32));
        idata_b <= std_logic_vector(to_unsigned(11574, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 738
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(44952, 32));
        idata_b <= std_logic_vector(to_unsigned(15057, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 739
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(51926, 32));
        idata_b <= std_logic_vector(to_unsigned(404, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 740
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(10857, 32));
        idata_b <= std_logic_vector(to_unsigned(56312, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 741
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(40983, 32));
        idata_b <= std_logic_vector(to_unsigned(57377, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 742
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(12506, 32));
        idata_b <= std_logic_vector(to_unsigned(18535, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 743
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(59639, 32));
        idata_b <= std_logic_vector(to_unsigned(48427, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 744
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(37462, 32));
        idata_b <= std_logic_vector(to_unsigned(20277, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 745
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(31824, 32));
        idata_b <= std_logic_vector(to_unsigned(64226, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 34, 32) SEVERITY ERROR;
        
        -- test 746
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(48042, 32));
        idata_b <= std_logic_vector(to_unsigned(42497, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 747
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(12578, 32));
        idata_b <= std_logic_vector(to_unsigned(12926, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 748
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(8265, 32));
        idata_b <= std_logic_vector(to_unsigned(54355, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 5, 32) SEVERITY ERROR;
        
        -- test 749
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(38936, 32));
        idata_b <= std_logic_vector(to_unsigned(55750, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 750
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(57242, 32));
        idata_b <= std_logic_vector(to_unsigned(56241, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 751
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(10411, 32));
        idata_b <= std_logic_vector(to_unsigned(14005, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 752
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(38210, 32));
        idata_b <= std_logic_vector(to_unsigned(16898, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 753
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(25579, 32));
        idata_b <= std_logic_vector(to_unsigned(17626, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 754
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(31955, 32));
        idata_b <= std_logic_vector(to_unsigned(11969, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 755
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(18031, 32));
        idata_b <= std_logic_vector(to_unsigned(42812, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 756
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(2745, 32));
        idata_b <= std_logic_vector(to_unsigned(59014, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 757
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(34653, 32));
        idata_b <= std_logic_vector(to_unsigned(15251, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 758
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(12013, 32));
        idata_b <= std_logic_vector(to_unsigned(28756, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 759
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(63678, 32));
        idata_b <= std_logic_vector(to_unsigned(49475, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 760
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(49033, 32));
        idata_b <= std_logic_vector(to_unsigned(29966, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 761
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(48166, 32));
        idata_b <= std_logic_vector(to_unsigned(31539, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 762
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(6928, 32));
        idata_b <= std_logic_vector(to_unsigned(60744, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 8, 32) SEVERITY ERROR;
        
        -- test 763
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(44465, 32));
        idata_b <= std_logic_vector(to_unsigned(15193, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 764
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(49563, 32));
        idata_b <= std_logic_vector(to_unsigned(17866, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 765
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(5407, 32));
        idata_b <= std_logic_vector(to_unsigned(41269, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 766
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(8571, 32));
        idata_b <= std_logic_vector(to_unsigned(15818, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 767
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(55274, 32));
        idata_b <= std_logic_vector(to_unsigned(46782, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 768
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(32716, 32));
        idata_b <= std_logic_vector(to_unsigned(15317, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 769
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(64408, 32));
        idata_b <= std_logic_vector(to_unsigned(64671, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 770
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(27286, 32));
        idata_b <= std_logic_vector(to_unsigned(16903, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 771
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(41947, 32));
        idata_b <= std_logic_vector(to_unsigned(30031, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 772
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(10382, 32));
        idata_b <= std_logic_vector(to_unsigned(11064, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 773
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(45282, 32));
        idata_b <= std_logic_vector(to_unsigned(22395, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 774
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(39821, 32));
        idata_b <= std_logic_vector(to_unsigned(43425, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 775
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(6335, 32));
        idata_b <= std_logic_vector(to_unsigned(23318, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 776
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(7855, 32));
        idata_b <= std_logic_vector(to_unsigned(54501, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 777
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(54858, 32));
        idata_b <= std_logic_vector(to_unsigned(14783, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 778
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(49709, 32));
        idata_b <= std_logic_vector(to_unsigned(33787, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 779
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(29976, 32));
        idata_b <= std_logic_vector(to_unsigned(33736, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 8, 32) SEVERITY ERROR;
        
        -- test 780
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(51653, 32));
        idata_b <= std_logic_vector(to_unsigned(35383, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 781
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(9469, 32));
        idata_b <= std_logic_vector(to_unsigned(60225, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 782
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(51201, 32));
        idata_b <= std_logic_vector(to_unsigned(64744, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 783
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(41471, 32));
        idata_b <= std_logic_vector(to_unsigned(18381, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 784
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(14525, 32));
        idata_b <= std_logic_vector(to_unsigned(40343, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 785
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(17516, 32));
        idata_b <= std_logic_vector(to_unsigned(41812, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 786
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(57247, 32));
        idata_b <= std_logic_vector(to_unsigned(59463, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 787
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(6307, 32));
        idata_b <= std_logic_vector(to_unsigned(2093, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 7, 32) SEVERITY ERROR;
        
        -- test 788
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(4992, 32));
        idata_b <= std_logic_vector(to_unsigned(51590, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 789
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(24488, 32));
        idata_b <= std_logic_vector(to_unsigned(44813, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 790
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(29479, 32));
        idata_b <= std_logic_vector(to_unsigned(30823, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 791
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(2595, 32));
        idata_b <= std_logic_vector(to_unsigned(37334, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 792
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(19788, 32));
        idata_b <= std_logic_vector(to_unsigned(57453, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 793
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(52118, 32));
        idata_b <= std_logic_vector(to_unsigned(3961, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 794
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(25705, 32));
        idata_b <= std_logic_vector(to_unsigned(16558, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 795
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(37697, 32));
        idata_b <= std_logic_vector(to_unsigned(11822, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 23, 32) SEVERITY ERROR;
        
        -- test 796
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(51942, 32));
        idata_b <= std_logic_vector(to_unsigned(47167, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 797
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(6511, 32));
        idata_b <= std_logic_vector(to_unsigned(37607, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 798
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(46375, 32));
        idata_b <= std_logic_vector(to_unsigned(47982, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 799
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(55989, 32));
        idata_b <= std_logic_vector(to_unsigned(60900, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 800
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(22790, 32));
        idata_b <= std_logic_vector(to_unsigned(7969, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 801
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(37176, 32));
        idata_b <= std_logic_vector(to_unsigned(14501, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 802
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(1897, 32));
        idata_b <= std_logic_vector(to_unsigned(43484, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 7, 32) SEVERITY ERROR;
        
        -- test 803
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(16594, 32));
        idata_b <= std_logic_vector(to_unsigned(6889, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 804
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(29538, 32));
        idata_b <= std_logic_vector(to_unsigned(41082, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 6, 32) SEVERITY ERROR;
        
        -- test 805
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(51702, 32));
        idata_b <= std_logic_vector(to_unsigned(59017, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 7, 32) SEVERITY ERROR;
        
        -- test 806
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(6370, 32));
        idata_b <= std_logic_vector(to_unsigned(54297, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 807
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(30815, 32));
        idata_b <= std_logic_vector(to_unsigned(26158, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 808
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(46215, 32));
        idata_b <= std_logic_vector(to_unsigned(17397, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 9, 32) SEVERITY ERROR;
        
        -- test 809
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(30120, 32));
        idata_b <= std_logic_vector(to_unsigned(6384, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 24, 32) SEVERITY ERROR;
        
        -- test 810
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(33956, 32));
        idata_b <= std_logic_vector(to_unsigned(2281, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 811
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(18206, 32));
        idata_b <= std_logic_vector(to_unsigned(20362, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 812
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(49448, 32));
        idata_b <= std_logic_vector(to_unsigned(24718, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 813
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(57969, 32));
        idata_b <= std_logic_vector(to_unsigned(30287, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 814
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(7164, 32));
        idata_b <= std_logic_vector(to_unsigned(48422, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 815
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(25652, 32));
        idata_b <= std_logic_vector(to_unsigned(29954, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 816
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(56392, 32));
        idata_b <= std_logic_vector(to_unsigned(62828, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 817
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(44455, 32));
        idata_b <= std_logic_vector(to_unsigned(58289, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 818
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(40776, 32));
        idata_b <= std_logic_vector(to_unsigned(61049, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 819
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(65178, 32));
        idata_b <= std_logic_vector(to_unsigned(4778, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 820
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(36596, 32));
        idata_b <= std_logic_vector(to_unsigned(51344, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 821
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(63795, 32));
        idata_b <= std_logic_vector(to_unsigned(42966, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 822
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(40105, 32));
        idata_b <= std_logic_vector(to_unsigned(29075, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 5, 32) SEVERITY ERROR;
        
        -- test 823
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(3588, 32));
        idata_b <= std_logic_vector(to_unsigned(20784, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 12, 32) SEVERITY ERROR;
        
        -- test 824
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(46472, 32));
        idata_b <= std_logic_vector(to_unsigned(33708, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 825
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(27168, 32));
        idata_b <= std_logic_vector(to_unsigned(14892, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 12, 32) SEVERITY ERROR;
        
        -- test 826
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(35990, 32));
        idata_b <= std_logic_vector(to_unsigned(45375, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 5, 32) SEVERITY ERROR;
        
        -- test 827
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(35254, 32));
        idata_b <= std_logic_vector(to_unsigned(19902, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 828
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(4557, 32));
        idata_b <= std_logic_vector(to_unsigned(27688, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 829
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(50190, 32));
        idata_b <= std_logic_vector(to_unsigned(11721, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 830
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(10574, 32));
        idata_b <= std_logic_vector(to_unsigned(10306, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 831
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(41676, 32));
        idata_b <= std_logic_vector(to_unsigned(1430, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 832
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(7598, 32));
        idata_b <= std_logic_vector(to_unsigned(20595, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 833
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(59719, 32));
        idata_b <= std_logic_vector(to_unsigned(48375, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 834
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(16109, 32));
        idata_b <= std_logic_vector(to_unsigned(59361, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 835
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(53153, 32));
        idata_b <= std_logic_vector(to_unsigned(52705, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 836
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(45169, 32));
        idata_b <= std_logic_vector(to_unsigned(51413, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 837
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(30135, 32));
        idata_b <= std_logic_vector(to_unsigned(19739, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 838
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(14952, 32));
        idata_b <= std_logic_vector(to_unsigned(33723, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 839
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(40523, 32));
        idata_b <= std_logic_vector(to_unsigned(61424, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 840
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(1896, 32));
        idata_b <= std_logic_vector(to_unsigned(2156, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 841
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(10781, 32));
        idata_b <= std_logic_vector(to_unsigned(37886, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 842
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(47531, 32));
        idata_b <= std_logic_vector(to_unsigned(46035, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 11, 32) SEVERITY ERROR;
        
        -- test 843
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(57788, 32));
        idata_b <= std_logic_vector(to_unsigned(52088, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 844
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(8187, 32));
        idata_b <= std_logic_vector(to_unsigned(42442, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 845
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(63809, 32));
        idata_b <= std_logic_vector(to_unsigned(18762, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 846
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(52748, 32));
        idata_b <= std_logic_vector(to_unsigned(39949, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 847
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(20192, 32));
        idata_b <= std_logic_vector(to_unsigned(60347, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 848
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(60545, 32));
        idata_b <= std_logic_vector(to_unsigned(14376, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 849
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(43186, 32));
        idata_b <= std_logic_vector(to_unsigned(11118, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 850
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(8201, 32));
        idata_b <= std_logic_vector(to_unsigned(30803, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 851
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(63823, 32));
        idata_b <= std_logic_vector(to_unsigned(53371, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 852
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(16680, 32));
        idata_b <= std_logic_vector(to_unsigned(28422, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 6, 32) SEVERITY ERROR;
        
        -- test 853
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(7574, 32));
        idata_b <= std_logic_vector(to_unsigned(31632, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 854
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(62145, 32));
        idata_b <= std_logic_vector(to_unsigned(48097, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 855
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(27521, 32));
        idata_b <= std_logic_vector(to_unsigned(64041, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 856
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(50253, 32));
        idata_b <= std_logic_vector(to_unsigned(38302, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 857
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(36391, 32));
        idata_b <= std_logic_vector(to_unsigned(32248, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 858
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(18801, 32));
        idata_b <= std_logic_vector(to_unsigned(28644, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 859
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(18800, 32));
        idata_b <= std_logic_vector(to_unsigned(26989, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 860
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(5550, 32));
        idata_b <= std_logic_vector(to_unsigned(17074, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 861
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(45751, 32));
        idata_b <= std_logic_vector(to_unsigned(58299, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 862
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(57023, 32));
        idata_b <= std_logic_vector(to_unsigned(407, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 863
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(53110, 32));
        idata_b <= std_logic_vector(to_unsigned(52032, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 864
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(14783, 32));
        idata_b <= std_logic_vector(to_unsigned(30760, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 865
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(63150, 32));
        idata_b <= std_logic_vector(to_unsigned(22985, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 5, 32) SEVERITY ERROR;
        
        -- test 866
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(61563, 32));
        idata_b <= std_logic_vector(to_unsigned(61437, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 867
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(10820, 32));
        idata_b <= std_logic_vector(to_unsigned(12708, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 868
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(24323, 32));
        idata_b <= std_logic_vector(to_unsigned(18394, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 869
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(44340, 32));
        idata_b <= std_logic_vector(to_unsigned(20933, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 870
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(955, 32));
        idata_b <= std_logic_vector(to_unsigned(6325, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 5, 32) SEVERITY ERROR;
        
        -- test 871
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(19438, 32));
        idata_b <= std_logic_vector(to_unsigned(51209, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 872
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(44627, 32));
        idata_b <= std_logic_vector(to_unsigned(55830, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 873
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(17921, 32));
        idata_b <= std_logic_vector(to_unsigned(63429, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 874
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(18938, 32));
        idata_b <= std_logic_vector(to_unsigned(36722, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 875
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(24882, 32));
        idata_b <= std_logic_vector(to_unsigned(24488, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 876
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(53796, 32));
        idata_b <= std_logic_vector(to_unsigned(5097, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 877
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(17251, 32));
        idata_b <= std_logic_vector(to_unsigned(45283, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 878
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(5504, 32));
        idata_b <= std_logic_vector(to_unsigned(4825, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 879
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(31780, 32));
        idata_b <= std_logic_vector(to_unsigned(20288, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 880
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(35585, 32));
        idata_b <= std_logic_vector(to_unsigned(29394, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 881
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(43273, 32));
        idata_b <= std_logic_vector(to_unsigned(31613, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 882
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(25296, 32));
        idata_b <= std_logic_vector(to_unsigned(54093, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 883
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(44321, 32));
        idata_b <= std_logic_vector(to_unsigned(49619, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 884
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(6951, 32));
        idata_b <= std_logic_vector(to_unsigned(23125, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 885
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(5016, 32));
        idata_b <= std_logic_vector(to_unsigned(7906, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 886
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(29451, 32));
        idata_b <= std_logic_vector(to_unsigned(24455, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 887
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(59115, 32));
        idata_b <= std_logic_vector(to_unsigned(8542, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 888
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(14749, 32));
        idata_b <= std_logic_vector(to_unsigned(11501, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 7, 32) SEVERITY ERROR;
        
        -- test 889
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(6435, 32));
        idata_b <= std_logic_vector(to_unsigned(33687, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 9, 32) SEVERITY ERROR;
        
        -- test 890
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(48223, 32));
        idata_b <= std_logic_vector(to_unsigned(31317, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 891
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(58175, 32));
        idata_b <= std_logic_vector(to_unsigned(36483, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 892
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(36414, 32));
        idata_b <= std_logic_vector(to_unsigned(9891, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 63, 32) SEVERITY ERROR;
        
        -- test 893
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(16230, 32));
        idata_b <= std_logic_vector(to_unsigned(41919, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 894
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(14716, 32));
        idata_b <= std_logic_vector(to_unsigned(48010, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 895
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(62207, 32));
        idata_b <= std_logic_vector(to_unsigned(50302, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 896
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(11869, 32));
        idata_b <= std_logic_vector(to_unsigned(39944, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 897
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(16379, 32));
        idata_b <= std_logic_vector(to_unsigned(37165, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 898
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(28501, 32));
        idata_b <= std_logic_vector(to_unsigned(60700, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 899
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(21248, 32));
        idata_b <= std_logic_vector(to_unsigned(35452, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 900
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(18289, 32));
        idata_b <= std_logic_vector(to_unsigned(26265, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 901
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(43358, 32));
        idata_b <= std_logic_vector(to_unsigned(47740, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 14, 32) SEVERITY ERROR;
        
        -- test 902
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(50720, 32));
        idata_b <= std_logic_vector(to_unsigned(36938, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 903
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(56283, 32));
        idata_b <= std_logic_vector(to_unsigned(65469, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 904
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(48439, 32));
        idata_b <= std_logic_vector(to_unsigned(62718, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 905
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(33620, 32));
        idata_b <= std_logic_vector(to_unsigned(31126, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 906
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(28500, 32));
        idata_b <= std_logic_vector(to_unsigned(26259, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 907
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(2073, 32));
        idata_b <= std_logic_vector(to_unsigned(64914, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 908
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(36150, 32));
        idata_b <= std_logic_vector(to_unsigned(18303, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 909
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(41297, 32));
        idata_b <= std_logic_vector(to_unsigned(50867, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 910
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(778, 32));
        idata_b <= std_logic_vector(to_unsigned(37968, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 911
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(35633, 32));
        idata_b <= std_logic_vector(to_unsigned(12647, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 912
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(12376, 32));
        idata_b <= std_logic_vector(to_unsigned(52012, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 913
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(49812, 32));
        idata_b <= std_logic_vector(to_unsigned(40877, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 914
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(47176, 32));
        idata_b <= std_logic_vector(to_unsigned(5524, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 915
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(10793, 32));
        idata_b <= std_logic_vector(to_unsigned(65465, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 916
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(31789, 32));
        idata_b <= std_logic_vector(to_unsigned(54152, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 917
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(47670, 32));
        idata_b <= std_logic_vector(to_unsigned(16973, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 918
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(25554, 32));
        idata_b <= std_logic_vector(to_unsigned(38417, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 919
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(16906, 32));
        idata_b <= std_logic_vector(to_unsigned(8457, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 920
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(35599, 32));
        idata_b <= std_logic_vector(to_unsigned(50526, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 921
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(39583, 32));
        idata_b <= std_logic_vector(to_unsigned(64099, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 922
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(11250, 32));
        idata_b <= std_logic_vector(to_unsigned(41656, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 923
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(63478, 32));
        idata_b <= std_logic_vector(to_unsigned(47400, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 924
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(59959, 32));
        idata_b <= std_logic_vector(to_unsigned(39239, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 925
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(32731, 32));
        idata_b <= std_logic_vector(to_unsigned(60737, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 926
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(11672, 32));
        idata_b <= std_logic_vector(to_unsigned(2828, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 927
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(7848, 32));
        idata_b <= std_logic_vector(to_unsigned(24048, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 72, 32) SEVERITY ERROR;
        
        -- test 928
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(54840, 32));
        idata_b <= std_logic_vector(to_unsigned(57660, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 60, 32) SEVERITY ERROR;
        
        -- test 929
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(64926, 32));
        idata_b <= std_logic_vector(to_unsigned(36480, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 6, 32) SEVERITY ERROR;
        
        -- test 930
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(63185, 32));
        idata_b <= std_logic_vector(to_unsigned(10183, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 931
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(36410, 32));
        idata_b <= std_logic_vector(to_unsigned(29438, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 932
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(64335, 32));
        idata_b <= std_logic_vector(to_unsigned(18544, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 933
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(46412, 32));
        idata_b <= std_logic_vector(to_unsigned(24353, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 934
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(56961, 32));
        idata_b <= std_logic_vector(to_unsigned(63318, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 935
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(32810, 32));
        idata_b <= std_logic_vector(to_unsigned(27024, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 936
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(48309, 32));
        idata_b <= std_logic_vector(to_unsigned(6857, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 937
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(25588, 32));
        idata_b <= std_logic_vector(to_unsigned(59559, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 938
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(48513, 32));
        idata_b <= std_logic_vector(to_unsigned(23530, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 939
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(41423, 32));
        idata_b <= std_logic_vector(to_unsigned(42937, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 940
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(62769, 32));
        idata_b <= std_logic_vector(to_unsigned(8619, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 941
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(38138, 32));
        idata_b <= std_logic_vector(to_unsigned(8905, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 942
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(11447, 32));
        idata_b <= std_logic_vector(to_unsigned(45987, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 943
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(32954, 32));
        idata_b <= std_logic_vector(to_unsigned(752, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 944
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(38111, 32));
        idata_b <= std_logic_vector(to_unsigned(32344, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 945
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(37232, 32));
        idata_b <= std_logic_vector(to_unsigned(35760, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 16, 32) SEVERITY ERROR;
        
        -- test 946
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(42527, 32));
        idata_b <= std_logic_vector(to_unsigned(8106, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 947
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(65199, 32));
        idata_b <= std_logic_vector(to_unsigned(41327, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 948
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(26650, 32));
        idata_b <= std_logic_vector(to_unsigned(46075, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 25, 32) SEVERITY ERROR;
        
        -- test 949
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(144, 32));
        idata_b <= std_logic_vector(to_unsigned(18075, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 950
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(43857, 32));
        idata_b <= std_logic_vector(to_unsigned(32955, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 951
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(45100, 32));
        idata_b <= std_logic_vector(to_unsigned(26630, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 10, 32) SEVERITY ERROR;
        
        -- test 952
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(39812, 32));
        idata_b <= std_logic_vector(to_unsigned(5152, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 953
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(20653, 32));
        idata_b <= std_logic_vector(to_unsigned(22790, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 954
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(28682, 32));
        idata_b <= std_logic_vector(to_unsigned(62077, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 955
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(191, 32));
        idata_b <= std_logic_vector(to_unsigned(25915, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 956
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(5160, 32));
        idata_b <= std_logic_vector(to_unsigned(38329, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 957
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(34821, 32));
        idata_b <= std_logic_vector(to_unsigned(16607, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 958
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(18780, 32));
        idata_b <= std_logic_vector(to_unsigned(2239, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 959
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(17359, 32));
        idata_b <= std_logic_vector(to_unsigned(56892, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 960
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(34583, 32));
        idata_b <= std_logic_vector(to_unsigned(54592, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 961
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(27116, 32));
        idata_b <= std_logic_vector(to_unsigned(11574, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 962
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(62698, 32));
        idata_b <= std_logic_vector(to_unsigned(26779, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 963
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(52901, 32));
        idata_b <= std_logic_vector(to_unsigned(23813, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 964
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(7318, 32));
        idata_b <= std_logic_vector(to_unsigned(53046, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 965
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(41888, 32));
        idata_b <= std_logic_vector(to_unsigned(51176, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 8, 32) SEVERITY ERROR;
        
        -- test 966
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(20465, 32));
        idata_b <= std_logic_vector(to_unsigned(21452, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 967
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(12270, 32));
        idata_b <= std_logic_vector(to_unsigned(60277, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 968
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(26604, 32));
        idata_b <= std_logic_vector(to_unsigned(32924, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 4, 32) SEVERITY ERROR;
        
        -- test 969
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(17531, 32));
        idata_b <= std_logic_vector(to_unsigned(55286, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 970
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(29465, 32));
        idata_b <= std_logic_vector(to_unsigned(17722, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 971
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(15666, 32));
        idata_b <= std_logic_vector(to_unsigned(34625, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 972
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(56052, 32));
        idata_b <= std_logic_vector(to_unsigned(50487, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 3, 32) SEVERITY ERROR;
        
        -- test 973
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(51232, 32));
        idata_b <= std_logic_vector(to_unsigned(9296, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 16, 32) SEVERITY ERROR;
        
        -- test 974
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(52726, 32));
        idata_b <= std_logic_vector(to_unsigned(3056, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 975
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(652, 32));
        idata_b <= std_logic_vector(to_unsigned(21773, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 976
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(57648, 32));
        idata_b <= std_logic_vector(to_unsigned(27769, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 977
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(33347, 32));
        idata_b <= std_logic_vector(to_unsigned(54810, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 978
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(54548, 32));
        idata_b <= std_logic_vector(to_unsigned(20713, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 979
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(13087, 32));
        idata_b <= std_logic_vector(to_unsigned(61867, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 980
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(8223, 32));
        idata_b <= std_logic_vector(to_unsigned(54976, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 981
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(47507, 32));
        idata_b <= std_logic_vector(to_unsigned(28688, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 982
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(10892, 32));
        idata_b <= std_logic_vector(to_unsigned(59777, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 983
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(23429, 32));
        idata_b <= std_logic_vector(to_unsigned(37497, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 984
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(27165, 32));
        idata_b <= std_logic_vector(to_unsigned(40961, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 985
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(27247, 32));
        idata_b <= std_logic_vector(to_unsigned(56630, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 986
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(58683, 32));
        idata_b <= std_logic_vector(to_unsigned(42913, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 987
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(25719, 32));
        idata_b <= std_logic_vector(to_unsigned(49199, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 988
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(27864, 32));
        idata_b <= std_logic_vector(to_unsigned(11416, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 8, 32) SEVERITY ERROR;
        
        -- test 989
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(58496, 32));
        idata_b <= std_logic_vector(to_unsigned(15054, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 990
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(14472, 32));
        idata_b <= std_logic_vector(to_unsigned(59148, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 36, 32) SEVERITY ERROR;
        
        -- test 991
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(36827, 32));
        idata_b <= std_logic_vector(to_unsigned(6584, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 992
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(21381, 32));
        idata_b <= std_logic_vector(to_unsigned(4639, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 993
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(61394, 32));
        idata_b <= std_logic_vector(to_unsigned(10394, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 994
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(25352, 32));
        idata_b <= std_logic_vector(to_unsigned(8946, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 995
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(6725, 32));
        idata_b <= std_logic_vector(to_unsigned(33575, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 25, 32) SEVERITY ERROR;
        
        -- test 996
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(63922, 32));
        idata_b <= std_logic_vector(to_unsigned(54232, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 2, 32) SEVERITY ERROR;
        
        -- test 997
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(62263, 32));
        idata_b <= std_logic_vector(to_unsigned(9278, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 998
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(48473, 32));
        idata_b <= std_logic_vector(to_unsigned(20156, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        
        -- test 999
        wait for 5 * TbPeriod;
        idata_a <= std_logic_vector(to_unsigned(46775, 32));
        idata_b <= std_logic_vector(to_unsigned(10103, 32));
        idata_en <= '1';
        wait for 10 ns;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for 10 ns;
        end loop;
        ASSERT UNSIGNED(odata) = TO_UNSIGNED( 1, 32) SEVERITY ERROR;
        report "fin du test";
        -- Stop the clock and hence terminate the simulation
        wait for 5 * TbPeriod;
        TbSimEnded <= '1';
        wait;
    end process;

end tb;
