library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity simulacion_motor is
end simulacion_motor;

architecture Behavioral of simulacion_motor is

    Component control_motor  --Defino entradas y salidas
    Port(
     direccion_sw: in STD_LOGIC;
      enable_sw:   in STD_LOGIC;
      reset:    in STD_LOGIC;
      clk:      in STD_LOGIC;
      
      DIR:        out STD_LOGIC;
      STEP:       out STD_LOGIC;
      ENABLE: out STD_LOGIC
      ); 
     end component;
     
  --Señales intermedias
     signal direccion_s:  std_logic;
     signal enable_sw_s :    std_logic;
     signal reset_s :     std_logic;
     signal clk_s :       std_logic;
     
     signal DIR_s:        std_logic;
     signal STEP_s:       std_logic;
     signal ENABLE_s:     std_logic;
     
begin

  UnidadEnPruebas: control_motor
  Port Map (
  -- puertos componente => senales del banco de pruebas
      direccion_sw    => direccion_s,
      enable_sw       => enable_sw_s,
      reset        => reset_s,
      clk          => clk_s,
      DIR          => DIR_s,
      STEP         => step_s,
      ENABLE       => enable_s
  );

  Reloj: Process  -- la frecuencia de la FPGA es de 100MHz, periodo de clk 10ns (5ns high y 5ns low)
  begin  
      clk_s <= '1';
      wait for 5ns;
      clk_s <= '0';
      wait for 5ns;
      
    end process;
     
    
 Estimulos: Process
     begin 
     reset_s <= '1';
     wait for 50ns;
     reset_s <= '0';
     direccion_s <= '0';
     enable_sw_s <= '1';
     wait;
     end process;
    
    
end Behavioral;
