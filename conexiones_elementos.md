
# **Conexiones entre elementos**
Es muy importante realizar una conexión adecuada entre los distintos elementos para que todo funcione correctamente y evitar daños en los componentes.

---
## **CNC Shield**:
Se emplea para facilitar el control de hasta 4 motores paso a paso, con ella se utilizarán el modelo de driver Pololu A4988.
La CNC Shield solo proporciona un condensador y pines para utilizar los jumpers que definen la resolucion del paso en el Pololu. Por ello, una posible alternativa sería utilizar un diseño propio de circuito impreso con el fin de simplificar las conexiones con la FPGA.

A la hora de realizar la conexión entre el Pololu y la CNC Shield, se puede tomar como referencia que el pin "ENABLE" del pololu coincida con el de la placa.
![La imagen no se ha cargado correctamente](https://github.com/sanchezco/proyecto_scanner3D/blob/master/Imgs/CNC%20Shield.PNG "CNC Shield y Pololu")
En el lado izquierdo del driver se encuentran cuatro pines correspondientes al motor (1A,1B,2A,2B), y en el derecho los pines que se utilizaran para conectarlo con la FPGA.
Justo debajo del drivers se encuentran los pines MS1, MS2 y MS3 en los cuales se pueden poner los jumpers para modificar la resolución de los micropasos del motor. Por el momento se trabajará con el modo paso completo (sin utilizar ningún jumper), la forma de configurar la resolución de los pasos es la siguiente:

![La imagen no se ha cargado correctamente](https://github.com/sanchezco/proyecto_scanner3D/blob/master/Imgs/A4988%20Stepper%20Motor%20Driver%20Carrier.png)

Para evitar dañar los compoenentes es muy importante apagar la fuente de tensión de la CNC Shield antes de colocar o quitar el driver.
También es conveniente evitar el contacto de los pines de la parte inferior de la placa, para ello se utilizará un soporte.

Respecto a la alimentación de la CNC Shield hay que distinguir entre: 

**Alimentación del circuito:** (3V - 5,5V)
  Es importante señalar que la CNC Shield está diseñada para su uso con Arduino, por ello en la alimentación de pone 5V. Al utilizar una FPGA se puede conectar con la salida de 3,3 V, el utilizar 5V o 3,3V no implica ninguna consecuencia y se puede utilizar indistintamente.
  En caso de utilizar la fuente de tensión de pc, es preciso conectar el cable verde con el negro para el funcionamiento de la misma
  
  **Alimentación de potencia:** (12v - 36V)
  Únicamente se puede aportar con la fuente de tensión, y se emplea para el funcionamiento de los motores.
  
### **Ajuste de la corriente del driver**
  Es preciso calibrar el Pololu en función de su apliación, aumentar el voltaje generalmente permite mayores pasos y mayor torque.
  Una de las posibles formas de calibrarlo es calcular el voltaje de referencia, empleando la fórmula: **Vref = 8 Imax Rcs**
 Donde: 
 * Rcs es la resistencia del pololu, en el pololu utilizado la resisitencia es R100 que se corresponde con 0,1 Ohmios.
 * Imax se define como la raiz de la suma al cuadrado del liímite de cada bobina, para el motor utilizado es de 1A por bobina.
   
   Para medir el voltaje de referencia se coloca el polímetro en paralelo al potenciómetro:
   
   ![La imagen no se ha cargado correctamente](https://github.com/sanchezco/proyecto_scanner3D/blob/master/Imgs/Calibrado_Pololu.png "Calibrado del Pololu")
  
En el caso de utilizar el modo de paso completo el límite debe aumentarse un 40%, ya que las bobinas están limitadas aproximadamente en un 70% en este modo. Por lo tanto, los valores precisos para el modelo de motor utilizado son:
    *Vref=1*8*0,1= **0,8V**    Para utilizar los micropasos 
    *Vref= 0,8*1,4= **1,12V**  Para modo de paso completo

Otra posible forma de realizar una medida aproximada de Vref sería: **Imax =Vref*2**, es decir si tengo una corriente máxima de 1A el voltaje necesario sería 0,5V


---
## **FPGA**
Una vez obtenidas las variables STEP, DIR y ENABLE se asigna los pines de salidas:   
![La imagen no se ha cargado correctamente](https://github.com/sanchezco/proyecto_scanner3D/blob/master/Imgs/FPGA_pinOut.png "FPGA pin outs")
Se realizará un crimpado de los cables para conectar la FPGA con la CNC Shield, ya que a diferencia de Arduino no se puede conectar directamente. 

Por otro lado, es importate tener cuidado con la frecuencia de la señal STEP ya que el pulso mínimo que soporta el driver es de un microsegundo, en caso de utilizar una frecuencia menor el motor no funcionará y emitirá un pitido.
![La imagen no se ha cargado correctamente](https://github.com/sanchezco/proyecto_scanner3D/blob/master/Imgs/Diagrama%20tiempos%20pololu.png "Diagrama de tiempos Pololu")


---
## **MOTOR PASO A PASO**:
El motor tiene cuatro cables correspondientes a sus dos bobinas, a la hora de hacer el crimpado se debe conocer que cables corresponden a cada bobina.
No importa el orden a la hora de colocar los cables en los pines, ya que este solo define el sentido del giro. Pero si que es preciso que los dos primeros correspondan a una bobina (2B y 2A) y los dos siguientes a la otra (1A y 1B).

![La imagen no se ha cargado correctamente](https://github.com/sanchezco/proyecto_scanner3D/blob/master/Imgs/pololu_A4988.png "pololu")
