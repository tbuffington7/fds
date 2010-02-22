% McDermott
% 2-15-10
% sandia_helium_plume.m
%
% Plot Sandia 1m helium plume data and FDS results

close all
clear all

addpath '..\..\Validation\Sandia_He_1m\Experimental_Data'
addpath '..\..\Validation\Sandia_He_1m\FDS_Output_Files'

% vertical velocity

radial_profile('Sandia_He_1m\Sandia_He_1m_W2',[2:22],0.2, ...
               'radial position (m)','vertical velocity (m/s)','Northeast', ...
               -.5,.5,.05,-.5,.5,.1,0,5,1, ...
               'W2.csv','bo','Exp', ...
               'Sandia_He_1m_dx3cm_devc.csv','b--','FDS 3 cm', ...
               'Sandia_He_1m_dx1p5cm_devc.csv','b-','FDS 1.5 cm')
           
radial_profile('Sandia_He_1m\Sandia_He_1m_W4',[23:43],0.2, ...
               'radial position (m)','vertical velocity (m/s)','Northeast', ...
               -.5,.5,.05,-.5,.5,.1,0,5,1, ...
               'W4.csv','bo','Exp', ...
               'Sandia_He_1m_dx3cm_devc.csv','b--','FDS 3 cm', ...
               'Sandia_He_1m_dx1p5cm_devc.csv','b-','FDS 1.5 cm')

radial_profile('Sandia_He_1m\Sandia_He_1m_W6',[44:64],0.2, ...
               'radial position (m)','vertical velocity (m/s)','Northeast', ...
               -.5,.5,.05,-.5,.5,.1,0,5,1, ...
               'W6.csv','bo','Exp', ...
               'Sandia_He_1m_dx3cm_devc.csv','b--','FDS 3 cm', ...
               'Sandia_He_1m_dx1p5cm_devc.csv','b-','FDS 1.5 cm')
           
% radial velocity

radial_profile('Sandia_He_1m\Sandia_He_1m_U2',[65:85],0.4, ...
               'radial position (m)','radial velocity (m/s)','Northeast', ...
               -.5,.5,.05,-.5,.5,.1,-1,1,.25, ...
               'U2.csv','ro','Exp', ...
               'Sandia_He_1m_dx3cm_devc.csv','r--','FDS 3 cm', ...
               'Sandia_He_1m_dx1p5cm_devc.csv','r-','FDS 1.5 cm')
           
radial_profile('Sandia_He_1m\Sandia_He_1m_U4',[86:106],0.4, ...
               'radial position (m)','radial velocity (m/s)','Northeast', ...
               -.5,.5,.05,-.5,.5,.1,-1,1,.25, ...
               'U4.csv','ro','Exp', ...
               'Sandia_He_1m_dx3cm_devc.csv','r--','FDS 3 cm', ...
               'Sandia_He_1m_dx1p5cm_devc.csv','r-','FDS 1.5 cm')
           
radial_profile('Sandia_He_1m\Sandia_He_1m_U6',[107:127],0.4, ...
               'radial position (m)','radial velocity (m/s)','Northeast', ...
               -.5,.5,.05,-.5,.5,.1,-1,1,.25, ...
               'U6.csv','ro','Exp', ...
               'Sandia_He_1m_dx3cm_devc.csv','r--','FDS 3 cm', ...
               'Sandia_He_1m_dx1p5cm_devc.csv','r-','FDS 1.5 cm')
           
% helium mass fraction

radial_profile('Sandia_He_1m\Sandia_He_1m_YHe2',[128:148],0.3, ...
               'radial position (m)','helium mass fraction','Northeast', ...
               -.5,.5,.05,-.5,.5,.1,0,1,.2, ...
               'YHe2.csv','go','Exp', ...
               'Sandia_He_1m_dx3cm_devc.csv','g--','FDS 3 cm', ...
               'Sandia_He_1m_dx1p5cm_devc.csv','g-','FDS 1.5 cm')
           
radial_profile('Sandia_He_1m\Sandia_He_1m_YHe4',[149:169],0.4, ...
               'radial position (m)','helium mass fraction','Northeast', ...
               -.5,.5,.05,-.5,.5,.1,0,1,.2, ...
               'YHe4.csv','go','Exp', ...
               'Sandia_He_1m_dx3cm_devc.csv','g--','FDS 3 cm', ...
               'Sandia_He_1m_dx1p5cm_devc.csv','g-','FDS 1.5 cm')
           
radial_profile('Sandia_He_1m\Sandia_He_1m_YHe6',[170:190],0.5, ...
               'radial position (m)','helium mass fraction','Northeast', ...
               -.5,.5,.05,-.5,.5,.1,0,1,.2, ...
               'YHe6.csv','go','Exp', ...
               'Sandia_He_1m_dx3cm_devc.csv','g--','FDS 3 cm', ...
               'Sandia_He_1m_dx1p5cm_devc.csv','g-','FDS 1.5 cm')

           
           
           
           