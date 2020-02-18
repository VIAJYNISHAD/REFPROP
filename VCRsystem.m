%{
EXAMPLES

An ideal vapor-compression refrigerant cycle operates at 
steady state with Refrigerant 134a as the working fluid. 
Saturated vapor enters the compressor at -12C, and 
saturated liquid  leaves  the  condenser  at  34C.  
The  mass  flow  rate  of  refrigerant  is  5  kg/min. 

Determine
(a)The compressor power, in kW
(b)The refrigerating capacity, in tons.
(c)The coefficient of performance
%}
clear;
clc;
%Here, refrigerant is R134a
%Mass flow is 5  kg/min.
mf=5/60;

%Here, Saturated vapor enters the compressor at -12C and 
%saturated liquid  leaves  the  condenser  at  30C. 
% By this we can find pressure boundary of our VCR system

%Let, Pc be pressure in condensor
%and  Pe be pressure in evaporator.

Pc = refpropm('P','T',307,'Q',0,'r134a');
%This is pressure of r134a whem 'Q' quality is 0 and temp is 34C

Pe = refpropm('P','T',261,'Q',1,'r134a');
%This is pressure of r134a whem 'Q' quality is 1 and temp is -12C

%Now,
%H1=Enahalpy vaule at entry of compressor
%H2=Enthalpy value at exit of compressor
%H4=Enthalpy value at exit of condensor or expansion value

H1 = refpropm('H','P',Pe,'Q',1,'r134a');
H4 = refpropm('H','P',Pc,'Q',0,'r134a');

%For value of H2, We know that entropy across compressor remaains 
%constant.
s1 = refpropm('S','P',Pe,'Q',1,'r134a');
H2 = refpropm('H','P',Pc,'S',s1,'r134a');

Ref_effect=mf*(H1-H4);
fprintf('The refreigeration effect is %f kW\n',Ref_effect/1000);

work=mf*(H2-H1);
fprintf('The work is %f kW\n',work/1000);
cop=Ref_effect/work;
fprintf('The COP is %f\n ',cop);

