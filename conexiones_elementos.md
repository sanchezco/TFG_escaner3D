# Conexiones entre elementos
Es muy importante realizar una conexión adecuada entre los distintos elementos para que todo funcione correctamente y evitar daños en los componentes.

---
 **CNC Shield**:
Se emplea para facilitar el control de los motores paso a paso, con ella se utilizarán el modelo de driver Pololu A4988.
A la hora de realizar la conexión entre ellos, se puede tomar como referencia quel pin "enable" del pololu coincida con el de la placa.

![La imagen no se ha cargado correctamente](https://github.com/sanchezco/proyecto_scanner3D/blob/master/Imgs/CNC%20Shield.PNG "CNC Shield y Pololu")

En el lado izquierdo del driver se encuentran cuatro pines correspondientes al motor (1A,1B,2A,2B), y en el derecho los pines que se utilizaran para conectarlo con la FPGA.

Justo debajo del drivers se encuentran los pines MS1, MS2 y MS3 en los cuales se pueden poner los jumpers para modificar la resolución de los micropasos del motor. Por el momento se trabajará con el modo paso completo (sin utilizar ningún jumper), el modo de configurar la resolución de los pasos es el siguiente:
![La imagen no se ha cargado correctamente](https://github.com/sanchezco/proyecto_scanner3D/blob/master/Imgs/A4988%20Stepper%20Motor%20Driver%20Carrier.png)

Para evitar dañar los compoenentes es muy importante apagar la fuente de tensión de la cnc shield antes de colocar o quitar el driver.
También es importante utilizar un soporte para que no haya contacto en los pines de la parte inferior de la placa.
**Ajuste de la corriente del driver...**

---
 **FPGA**:
Una vez obtenidas las variables STEP, DIR y ENABLE se les asigna los pines de salidas:   

![La imagen no se ha cargado correctamente](https://github.com/sanchezco/proyecto_scanner3D/blob/master/Imgs/FPGA_pinOut.png "FPGA pin outs")

Se realizará un crimpado de los cables para conectar la FPGA con la CNC Shield, ya que a diferencia de Arduino no se puede conectar directamente. 
La CNC shield no puede alimentar a la FPGA y por lo tanto esta requiere su propio suministro de tensión. 

---
**Motor paso a paso**
El motor tiene cuatro cables correspondientes a sus dos bobinas, a la hora de hacer el crimpado se debe conocer que cables corresponden a cada bobina.
No importa el orden ya que este solo define el sentido del giro, pero si es preciso que los dos primeros pines correspondan a una bobina (2B y 2A) y los dos siguientes a la otra (1A y 1B).
![La imagen no se ha cargado correctamente](https://github.com/sanchezco/proyecto_scanner3D/blob/master/Imgs/pololu_A4988.png "pololu")
