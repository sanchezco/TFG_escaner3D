# Conexiones entre elementos
Es muy importante realizar una conexión adecuada entre los distintos elementos para que todo funcione correctamente y evitar daños en los componentes.

 **CNC Shield**:
Se emplea para facilitar el control de los motores paso a paso, con ella se utilizarán el modelo de driver Pololu A4988.
A la hora de realizar la conexión entre ellos, se puede tomar como referencia quel pin "enable" del pololu coincida con el de la placa.

![La imagen no se ha cargado correctamente](https://github.com/sanchezco/proyecto_scanner3D/blob/master/Imgs/cnc_shield.jpg "CNC Shield")
(imagenes)
Para evitar dañar los compoenentes es muy importante apagar la fuente de tensión de la cnc shield antes de colocar o quitar el driver.
También es importante utilizar un soporte para que no haya contacto en los pines de la parte inferior de la placa.
**ajuste de la corriente del driver...**

Justo debajo del drivers se encuentran los pines MS1, MS2 y MS3 en los cuales se pueden poner los jumpers para modificar la resolución de los micropasos del motor.



(imágenes)
Por el momento no es necesario una resolución tan minuciosa y se trabajará con el modo paso completo (sin utilizar ningún jumper).

---
 **FPGA**:
Una vez obtenidas las variables STEP, DIRRECCION, ENABLE, RESET se les asigna los pines de salidas:   


(imagen)
Se realizará un crimpado de los cables para conectar la FPGA con la CNC Shield, porque a diferencia de Arduino no se puede conectar directamente. 
La CNC shield no puede alimentar a la FPGA y por lo tanto esta requiere su propio suministro de tensión. 

---
**Motor paso a paso**
el motor tiene cuatro cables que correspondientes a sus dos bobinas,  a la hora de hacer el crimpado se debe conocer que cables corresponden a cada bobina.
No importa el orden ya que este solo definirá el sentido del giro, pero si es preciso que los dos primeros pines correspondan a una bobina y los dos siguientes a la otra.


(imagen)
