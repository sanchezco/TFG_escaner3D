
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;-- para poder utilizar signed y unsigned;


--Las se�ales de los interruptores se activan a nivel alto, inicialmente estan a 0 y al cambiar el interruptor se activan.

entity control_motor is
  Port (
  --entradas:
  direccion_sw : in STD_LOGIC; --SW_1:  cambia la direccion                    
     enable_sw : in std_LOGIC; --SW_0:  activa el motor con el interruptor 
         reset : in STD_LOGIC; --SW_15: activa el reset con el interruptor      
           clk : in STD_LOGIC; -- 100MHz por lo tanto el reloj es de 10ns
--salidas:                     -Se�al acitva a nivel bajo, a cambiar el interruptor 
            DIR : out STD_LOGIC;  
           STEP : out STD_LOGIC;  
         ENABLE : out STD_LOGIC  
  );
end control_motor;


architecture Behavioral of control_motor is
        signal ta: unsigned(8 downto 0); --puedo contar hasta 2048 ( para hacer la cuenta contando hasta 2000ns : 2microseg, siendo el minimo 1 microseg)
        signal cuenta_step: unsigned(8 downto 0); 
        signal step_in: std_logic; -- variable intermedia que da el valor a la salida STEP
        signal enable_in: std_logic; -- variable intermedia que da el valor a la salida ENABLE

begin

--///////////////////////////// PROCESO PARA OBTENER ENABLE ////////////////////////////////////
proceso_enable: process (clk, reset)
begin
    if reset = '1' then
         enable_in <= '0';
    elsif clk'event and clk = '1' then
        if enable_sw = '1' then
         enable_in <= '1';
         else
         enable_in <= '0';
        end if;
    end if;
end process;
       ENABLE <= enable_in;
----/////////////////////////////////////////////////////////////////////////////////////////////
 
--///////////////////////////// PROCESO PARA OBTENER DIR ////////////////////////////////////////
proceso_DIR: process (clk, reset)
begin
    if reset = '1' then
         DIR <= '0';
    elsif clk'event and clk = '1' then
       if direccion_sw = '1' then
         DIR <= '1';
       else
         DIR <= '0';
       end if;
    end if;
end process;

--///////////////////////////// TIEMPO ENTRE PASOS //////////////////////////////////////////////
    ta <= to_unsigned(500,9); 

--///////////////////////////////////// PROCESO PARA EL STEP ////////////////////////////////////
 Proceso_paso : process (clk,reset)
  begin
    if reset= '1' then
    step_in <= '0';
    cuenta_step <= (others =>'0');
    
    elsif clk' event and clk = '1' then 
     if enable_in = '1' then
                    if cuenta_step = ta-1 then  -- hay una se�al step cada ta
                        cuenta_step <= (others =>'0');
                        step_in <= not step_in;
                     else
                       cuenta_step <= cuenta_step + 1;
                     end if;
              end if;
       end if;
  end process;
   STEP <= step_in;
   

    end Behavioral;

