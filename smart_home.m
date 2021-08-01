clc,clear
control = 1;
flag = 0;

while control == 1
    Z_e=input ("Please enter...\n1 if you would like to load the winter season's average daily energy expenditures values,or\n2 if you would like to load the summer season's average daily energy expenditures values: ");
    if Z_e==1
        control = 0;
        fprintf('\nValues loading...')
    %Kis mevsimi icin ortalama gunluk harcamalar sisteme dahil edilir. 
        buzdolabi         =	xlsread ('akilliev.xlsx','buzdolabi_kis'        );
        kombi             = xlsread ('akilliev.xlsx','kombi_kis'            );
        aydinlatma1       = xlsread ('akilliev.xlsx','aydinlatma1_kis'      );
        camasirmakinesi   = xlsread ('akilliev.xlsx','camasirmakinesi_kis'  ); 
        bulasikmakinesi   = xlsread ('akilliev.xlsx','bulasikmakinesi_kis'  );
        aydinlatma2       = xlsread ('akilliev.xlsx','aydinlatma2_kis'      );
        TV1               = xlsread ('akilliev.xlsx','TV1_kis'              );
        firin             = xlsread ('akilliev.xlsx','firin_kis'            );
        klima             = xlsread ('akilliev.xlsx','klima_kis'            );
        aspirator         = xlsread ('akilliev.xlsx','aspirator_kis'        );
        elektriklisupurge = xlsread ('akilliev.xlsx','elektriklisupurge_kis');
        suisiticisi       = xlsread ('akilliev.xlsx','suisiticisi_kis'      );
        utu               = xlsread ('akilliev.xlsx','utu_kis'              );
        TV2	              =	xlsread ('akilliev.xlsx','TV2_kis'              );
        sackurutma        = xlsread ('akilliev.xlsx','sackurutma_kis'       ); 
        bilgisayar        = xlsread ('akilliev.xlsx','bilgisayar_kis'       );
        fprintf('\nAverage daily expenditures for the winter season have been uploaded to the system.\n')
    elseif Z_e==2
        control = 0;
        fprintf('\nValues loading...')
    %Yaz mevsimi icin ortalama gunluk harcamalar sisteme dahil edilir. 
        buzdolabi         =	xlsread ('akilliev.xlsx','buzdolabi_yaz'        );
        kombi             = xlsread ('akilliev.xlsx','kombi_yaz'            );
        aydinlatma1       = xlsread ('akilliev.xlsx','aydinlatma1_yaz'      );
        camasirmakinesi   = xlsread ('akilliev.xlsx','camasirmakinesi_yaz'  ); 
        bulasikmakinesi   = xlsread ('akilliev.xlsx','bulasikmakinesi_yaz'  );
        aydinlatma2       = xlsread ('akilliev.xlsx','aydinlatma2_yaz'      );
        TV1               = xlsread ('akilliev.xlsx','TV1_yaz'              );
        firin             = xlsread ('akilliev.xlsx','firin_yaz'            );
        klima             = xlsread ('akilliev.xlsx','klima_yaz'            );
        aspirator         = xlsread ('akilliev.xlsx','aspirator_yaz'        );
        elektriklisupurge = xlsread ('akilliev.xlsx','elektriklisupurge_yaz');
        suisiticisi       = xlsread ('akilliev.xlsx','suisiticisi_yaz'      );
        utu               = xlsread ('akilliev.xlsx','utu_yaz'              );
        TV2	              =	xlsread ('akilliev.xlsx','TV2_yaz'              );
        sackurutma        = xlsread ('akilliev.xlsx','sackurutma_yaz'       ); 
        bilgisayar        = xlsread ('akilliev.xlsx','bilgisayar_yaz'       );
        fprintf('\nAverage daily expenditures for the summer season have been uploaded to the system.\n')
    else
        fprintf('\nError ! Please try again.\n>>(1)Winter Season (2)Summer Season\n\n');
    end
end

total_energy_expenditure = (buzdolabi + kombi + aydinlatma1  + camasirmakinesi + bulasikmakinesi + aydinlatma2 + TV1 + firin + klima + aspirator + elektriklisupurge + suisiticisi + utu + TV2 + sackurutma + bilgisayar);

stairs(total_energy_expenditure)  %Gun icerisindeki toplam harcamayi gorebiliriz. 
legend ('Load')
ylabel ('Power[W]')
xlabel ('15 minutes periods of day ')

time = 1:96; %Gun icerisindeki 96 adet 15 dk 'lik zaman dilimi(24*4=96 adet 15 dk'lik zaman dilimi elde edilir.)


%Yuklerin onem sirasina gore gruplandirilmasi

%*********** highest priority ***************% 
Load_1 = buzdolabi + kombi + aydinlatma1;  
     
%************** high priority ***************%               
Load_2 = camasirmakinesi + bulasikmakinesi + aydinlatma2; 
     
%************** mean priority ***************%
Load_3 = TV1 + firin + klima;  

%*************** low priority ***************%       
Load_4 = aspirator + elektriklisupurge + suisiticisi + utu;  

%*************lowest priority ***************%  
Load_5 = TV2 + sackurutma + bilgisayar;   


Load_1t	= [time', Load_1];                                    
Load_2t	= [time', Load_2];
Load_3t	= [time', Load_3];
Load_4t	= [time', Load_4];
Load_5t	= [time', Load_5];

T      = Load_1 + Load_2 + Load_3 + Load_4 + Load_5;
Load_T = [time',T];                                            %Total load 

fprintf("\nEnter the desired time period range to perform 'Load Shifting'.\n");
disp   ('******************************************************************')
while control == 0  % (Baslangicta control degiskeni 0' a esittir.)
    P_b = input ('Enter the beginning point of the peak range(between 0 and 96) : ');
    P_e = input ('Enter the ending    point of the peak range(between 0 and 96) : ');
    if     and(P_e < 96, P_b < 96) 
        break
    elseif or(P_e > 96, P_b > 96)
        fprintf('\nError! Please be sure of the input values.\n\n')
    end

end


while flag == 0    % (Baslangicta flag degiskeni 0' a esittir.)
    fprintf('\nImportant Information:\nThe value given below is the maximum power drawn by the load group with the highest importance, \nand the treshold should be selected above this value.\n')
    Minimum_treshold_value = max(Load_1);
    fprintf('Minimum Treshold Value: %d [kW]\n\n', Minimum_treshold_value )
    TH  = input ('Define to treshold value for peak period [kW]: ');

    if TH >= Minimum_treshold_value %Treshold degeri, en yuksek oncelik seviyesine sahip 1.grup yukun maksimum degerinden buyuk olmadir.
        flag  = 1;
        count = 0;
        Load_sT = Load_T;          % Her yuk grubu uygun gorulmesi halinde sirasiyla otelenir ve istenen seviye yakalanmaya çaliþilir.
        for index = P_b:P_e        % 5.yuk grubunu oteleme
            ++count;
            P_en  = P_e + count;
            if P_en > 96
                P_en = mod(P_en,96);
            end
            P_bn = P_b + count;
            if P_bn > 96
                P_bn = mod(P_bn,96);
            end
            if Load_T(index,2) >= TH
                Load_sT(index,2) = Load_1t(index,2) + Load_2t(index,2) + Load_3t(index,2) + Load_4t(index,2);
                shift = index + 20 ;%(88. 15dk'lik dilim(22:00) ile 68. 15dk'lik dilim(17:00) arasindaki fark kadar yuku kaydiririz.)
                if shift > 96
                    shift = mod(shift,96);
                end
                Load_sT(shift,2) = Load_sT(shift,2) + Load_5t(index,2);
            end
        end
        count = 0;
        for index = P_b:P_e        % 4.yuk grubunu oteleme
            ++count;
            P_en  = P_e + count ;
            if P_en > 96
                P_en = mod(P_en,96);
            end
            P_bn = P_b + count;
            if P_bn > 96
                P_bn = mod(P_bn,96);
            end
            if Load_T(index,2) >= TH
                Load_sT(index,2) = Load_1t(index,2) + Load_2t(index,2) + Load_3t(index,2);
                shift = index + 20;
                if shift > 96
                    shift = mod(shift,96);
                end
                Load_sT(shift,2) = Load_sT(shift,2) + Load_5t(index,2) + Load_4t(index,2);
            end
        end
        count = 0;
        for index = P_b:P_e        % 3.yuk grubunu oteleme
            ++count;
            P_en = P_e + count; 
            if P_en > 96
                P_en = mod(P_en,96);
            end
            P_bn = P_b + count;
            if P_bn > 96
                P_bn = mod(P_bn,96);
            end
            if Load_T(index,2) >= TH
                Load_sT(index,2) = Load_1t(index,2) + Load_2t(index,2); 
                shift = index+20;
                if shift > 96
                    shift = mod(shift,96);
                end
                Load_sT(shift,2) = Load_sT(shift,2) + Load_5t(index,2) + Load_4t(index,2) + Load_3t(index,2);
            end
        end
        count = 0;
        for index = P_b:P_e        % 2.yuk grubunu oteleme
            ++count; 
            P_en = P_e + count; 
            if P_en > 96
                P_en = mod(P_en,96);
            end
            P_bn = P_b + count;
            if P_bn > 96
                P_bn = mod(P_bn,96);
            end
            if Load_T(index,2) >= TH
                Load_sT(index,2) = Load_1t(index,2); 
                shift = index + 20;
                if shift > 96
                    shift = mod(shift,96);
                end
                Load_sT(shift,2) = Load_sT(shift,2) + Load_5t(index,2) + Load_4t(index,2) + Load_3t(index,2) + Load_2t(index,2);
            end
        end

    else %Eger girilen treshold degeri en yuksek oneme sahip olan 1.yuk grubunun enerjisini kaydirmaya calisirsa cihaz 1. yuk grubunun enerjisinin kesilmesini engelleyerek sistemden cikar.
        disp(' ')
        disp('Error! The determined threshold value affects the healthy operation of the 1st load group, which has the highest importance...')       
        continue
    end
end

stairs  (Load_T (:,2))         % graph settings          
hold on
stairs (Load_sT (:,2),':r ')
legend ('Unshifted Load ','Shifted Load ')
ylabel ('Power[W]')
xlabel ('15 minutes periods of day ')

%**********************************************
%Ruzgar turbinin urettigi enerji miktari hesabi
%**********************************************
Cp = 0.4       ;               %coefficient of performance
Eg = 0.95      ;               %generator efficiency
Eb = 0.95      ;               %gearbox/bearing efficiency
q  = 1.225     ;               %air density
A  = (pi*(1^2));               %swept area

fprintf('\n\nEnter the required information for the power calculation of the wind turbine.\n')
disp   ('*****************************************************************************')
V      = input('\nAverage wind speed of your location (km/s): ');
P_wind =( Cp * Eg * Eb * 0.5 * q * A * V^3 );
fprintf('\nAverage power value produced by the wind turbine: %.4f [W]\n\n', P_wind)


%*****************************************************
%Gun icerisindeki uc zamanli fiyat tarifesi degerleri:
%*****************************************************
DT = 0.252087 ; %Day_Period   (TL/kWh)| 06:00 - 17:00
PT = 0.546287 ; %Peak_Period  (TL/kWh)| 17:00 - 22:00
NT = 0.180231 ; %Night_Period (TL/kWh)| 22:00 - 06:00


%*************************
%Maliyet Hesabi Sonuclari: 
%*************************
disp(' ')
disp('*******************************************RESULTS****************************************************')
%Harcamalar sonucu elde edilen fatura tutarý:
firstbill          = ((sum(Load_T(24:68,2))*DT + sum(Load_T (68:88,2))*PT + (sum(Load_T(88:96,2)) + sum(Load_T (1:24,2)))*NT)*30) / (1000*4);
fprintf('>Invoice amount obtained as a result of expenditures                              : %.4f TL/Month\n', firstbill)

disp(' ')
%Yanlizca yuk kaydirma isleminin sisteme dahil edilmesi ile elde edilen fatura tutari:
bill_with_shifting = ((sum(Load_sT(24 :68,2))*DT + sum(Load_sT(68:88,2))*PT + (sum(Load_sT(88:96,2)) + sum(Load_sT(1:24,2)))*NT)*30) / (1000*4);
fprintf('>Invoice amount obtained by including only the load shifting process in the system: %.4f TL/Month\n', bill_with_shifting)
disp(' ')
%Yalnizca yuk kaydirarak elde edilen kar:
save_with_shifting = firstbill - bill_with_shifting;  %TL/Month
fprintf('>Profit value obtained by shifting loads only                                     : %.4f TL/Month \n', save_with_shifting)

disp(' ')
%Yanlizca ruzgar turbinin sisteme dahil edilmesi ile elde edilen fatura tutari: 
bill_with_wind_turbine     =((sum(Load_T(24:68,2)-(P_wind*(11)))*DT + (sum(Load_T (68:88,2))-P_wind*(5))*PT + (sum(Load_T(88:96,2)) + sum(Load_T (1:24,2))-P_wind*(8))*NT)*30) / (1000*4);
fprintf('>Invoice amount obtained by including only the wind turbine in the system         : %.4f TL/Month\n', bill_with_wind_turbine)
disp(' ')
%Yalnizca ruzgar turbini eklenerek elde edilen kar:
save_with_wind_turbine     = firstbill - bill_with_wind_turbine;
fprintf('>Profit value obtained by adding only the wind turbine                            : %.4f TL/Month\n', save_with_wind_turbine)

disp(' ')
%Toplam elde edilen kar:
Total_save         = save_with_shifting + save_with_wind_turbine;     
fprintf('------------------------------------Total Profit----------------------------------: %.4f TL/Month\n', Total_save )
