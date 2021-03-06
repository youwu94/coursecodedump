** Part 1 - Current Mirror - DC Analysis **

.INCLUDE sedra_lib.lib

* DC and AC Supplies
VD VDD 0 DC 3.3V
V1 D1 0 DC 1.0883V
V2 D2 0 DC 1.0883V

.PARAM wx = 50U

* Resistors
R VDD D0 23.541K

* MOSFETs
M0 D0 D0 0 0 NMOS0P5 W=5U L=0.5U
M1 D1 D0 0 0 NMOS0P5 W=wx L=0.5U
M2 D2 D0 0 0 NMOS0P5 W=250U L=0.5U


.OPTIONS POST
.OP

.DC wx 1U 100U 10U
.PLOT DC I(M1) wx

.END
