# Smart-Home-Applications-Cost-Analysis

***Yapılan çalışma sonucunda Akıllı Ev ve Enerji Yönetim Sistemi içerisinde hem talep tarafı aksiyomlarından yük öteleme uygulaması hem de yenilebilir bir enerji kaynağının akıllı ev enerji yönetimi sistemi ile entegrasyonu sonucu tüketicinin toplam enerji bedelinin nasıl değişiklik göstereceğinin elde edilmesini sağlayan proje gerçekleştirilmiştir.*** 

**Bu proje özelinde bilinmesi gereken bir kaç başlık sırasıyla ele alınmıştır. Ardından kodda iki örnek veri grubu girilerek iki farklı senaryoda neler elde edildiği özetlenmiştir.**

## Akıllı Ev(Smart Home) Nedir? Akılı Ev Enerji Yönetim Sistemi(Smart Home Energy Management System) Nedir?
Akıllı ev birden fazla sensörün aydınlatma, iklimlendirme(klima, termostat vb.), akıllı prizler ile elektronik cihazların(çamaşır makinesi, televizyon vb.) kontrolü, bahçe sulama,  yangın alarmı, perde, güvenlik ve akıllı telefonların birbirleri ile uyum sağlayan çevre birimlerini izleyebilen ve kontrol edebilen sistemin bütününe denir. Tüm cihazlar ve sensörler genellikle akıllı bir ana merkez olarak adlandırılan Enerji Kontrol Sistemi(Energy Management System) tarafından kontrol edilirek ev içinde gerçekleştirilen enerji harcamaları sistemden arzu ettiğimiz şekliyle ve arzu edilen zaman aralığı içerisinde gerçekleşir. Yani Enerji Kontrol Sistemi(Energy Management System) ile ev içerisindeki her elektrikli aletin(çamaşır makinesi, klima, aydınlatma vb.) istediğimiz zaman çalışmasını -sistemden enerji talep etmesini- kontrol edebiliriz.

## Elektrik Yükü(Load) Nedir? Yük Ötelemek(Load Shifting) Ne Demektir?

Elektrik yükü, ev içindeki elektrikli aletler ve ışıklar gibi (aktif) elektrik gücü tüketen bir elektrik bileşeni veya devrenin bir parçasıdır. Bu noktada öncelikli olarak 'yük' ve 'yük öteleme' kavramları ile neyi kastetdiğimize basit bir örnek üzerinden değinmek gerekirse, örneğin çamaşır makineniz sizin enerjiye ihtiyaç duyan bir yükünüzdür ve bu enerji ihtiyacını karşıladığınız zamanın -makineyi prize taktığınız zamanın- ileri bir vakte alınmasına(örneğin makineyi 17:00'de değilde 20:00'da çalıştırmanıza) ise 'yük öteleme' denir.

## Peki ama neden ve hangi zamanlarda yük ötelenmek istenir? 
Yani neden ben çamaşır makinemi ileri bir saat diliminde çalıştırmalıyım? Burada verilen projeyi gerçekleştirebilmek için bize verilen senoryada 3 tarifeli bir elektrik tüketiminin olduğu yani herkesin elektrik enerjisi talep ettiği aralıklarda(peak period içinde) enerjinin maliyetinin daha fazla olduğunu bilmek gerekiyor. Aşağıda yer alan tabloda bize bu senaryoda gün içinde enerji talep ettiğimizde yani evimizde herhangi bir elektrikli aleti prize taktığımızda ve enerji harcamaya başladığımız hangi saatlerde kWh(kiloWatt*saat) başına ne kadar TL ücretlendirileceğimizi gösteren tablo verilmiştir.

    Gün içerisindeki üç zamanlı fiyat tarifesi degerleri:

    DT = 0.252087 ;(TL/kWh)| 06:00 - 17:00    %Day_Period   

    PT = 0.546287 ;(TL/kWh)| 17:00 - 22:00   %Peak_Period  

    NT = 0.180231 ;(TL/kWh)| 22:00 - 06:00  %Night_Period

Örneğin sabah sekizde 1 kiloWatt*saat enerji için 0.252087 TL ücretiriliyor iken ücretlendirme açısından en uygun zaman dilimi gece zaman diliminde(Night_Period) ve en pahalı elektrik enerji tüketilen aralık ise zirve zaman dilimi(Peak_Period)dir. Burada yapılan yük öteleme işleminin temel amacı üç tarifeli bir sistemde mümkün olduğunca yükleri tarifenin ucuz olduğu zamanlarda devreye alarak mevcut fatura bedelini aşağıya çekebilmektir.

### Neden böyle bir ücretlendirme politikasına ihtiyaç duyulmuş ki?
Enerji dağıtım şirketleri(Ayedaş, Bedaş vb.) müşterileri olan tüketicilere enerji sağlamak ile mükelleftirler. Dağıtım şirketleri enerji harcamalarının peak olduğu zamanlarda-yani örneğin herkesin işden eve gelip enerji tüketmeye başladığı zamanlarda- talep edilen enerjiyi karşılamakta zorlanmaktadırlar. Talep edilen enerjiyi karşılayamamaları durumda ise gün içi piyasasından bu enerjiyi satın alırlar ve bu durum onlar için enerji tedariği organizasyonunda çok daha fazla maliyete yol açar. Bu noktada yukarıda ki gibi aksiyomlar alınarak tüketiciler olan bizlerin, enerji sağlayıcılarının anlık sağlayabildiği enerji gücünü aşmamasını sağlayabilmek adına enerji ihtiyacının çok olduğu saatlerde fiyat artırıp az olduğu zamanlarda fiyatı normalden aşağı çekerek tüketicileri o saatlere teşvik etmek isterler. Bu şekilde dağıtım şirketlerinin tüketicilere ödül yada ceza verebilecek yaptırımlarda bulunarak sistemdeki enerji talebini gün içerisinde dengeli hale getirmek temel hedeflerindendir. Üç tarifeli sistemde bu uygulamalardan biri olarak bu çalışmada konu edilmiştir. Özetle bu sistemde enerjinin daha az talep edildiği zamanlarda enerji bedeli daha az, enerji talebinin çok olduğu zamanlarda ise enerji bedeli daha yüksek belirlenerek enerji talebinde denge yakalanmak istenmiştir.

Bizde bu noktada enerji kontrol sistemi vasıtasıyla bizim için daha az öneme sahip bazı yüklerin bizim tarafından belirlenen enerji tüketim eşiğine(limitine) kadar kullanılmasına izin verdiğimiz ve bu eşiği aşabilecek daha az öneme sahip yüklerin ötelenmesini sağlayarak maliyet azaltabiliriz.

## MATLAB Kodlarına İlişkin
MATLAB' de yazılan proje, temel olarak kullanıcıdan aldığı mevsim bilgisi ışığında -yaz veya kış mevsim seçimiyle- o mevsime ait günlük ortalama enerji tüketiplerimlerinin sisteme yüklenmesiyle başlar. 

    Please enter...
    1 if you would like to load the winter season's average daily energy expenditures values,or
    2 if you would like to load the summer season's average daily energy expenditures values:

Bu çalışmada bir akıllı evin  elektrik sistemi ve temel elektrikli ev aletlerinin  gün içerisinde kullanmış olduğu güç değerleri on beşer  dakikalık zaman dilimleriyle  incelenmiştir. On beş dakikalık dağılımlar EXCEL programında bir tablo halinde oluşturulup MATLAB' a aktarılmıştır.  Yüklenen verilere ait günlük ortalama enerji tüketimi tablosu ekrana verilir.

![image](https://user-images.githubusercontent.com/83073342/127766713-7f0babd7-d182-47eb-abe0-eee8080bd75a.png)

                Kış mevsimi için gün içerisinde anlık ortalama talep edilen enerji harcamasını gösteren grafik
                                                                     
Ardından proje kapsamında daha önceden belirlenen yük grupları ve yük gruplarının önem sıraları belirlenmiştir. Verilen harcama değerleri geniş bir aile baz alınarak verilmiştir. Akıllı evde kullanılan  ev aletleri kendi içerisinde önem sırasına göre gruplandırılmıştır.  Bu gruplandırmada önem sırası bir numaralı gruptan beş numaralı gruba doğru aşağıdaki tabloda belirtildiği  gibidir. Birinci yük grubu en yüksek öneme sahip yük grubu olmak üzere yük grupları sıralanmıştır. (Bu sıralama arzu edildiği şekliyle kodda yeniden düzenlenebilir.)  

![image](https://user-images.githubusercontent.com/83073342/127766738-ad5909e3-0bd4-4b0a-af43-f0dc6b75f35d.png)


Ekrana yansıtılan günlük ortalama enerji tüketimi tablosuna geri dönecek olursak, tablo ekrana yansıtıldaktan sonra kullanıcı günlük enerji harcamasını gösteren tablo üzerinde yüksek maliyetli enerji tüketilen zaman aralığını belirler ve düşük enerji maliyeti olan zaman aralığına 'ötelemek' için bu zaman aralığını girmektedir. Zaman aralıkları ve ücretlendirmeye ilişkin veriler aşağıdaki gibidir.

![image](https://user-images.githubusercontent.com/83073342/127767733-3f82d613-f445-4275-b01f-539d20321666.png)

Gün içerisindeki üç zamanlı fiyat tarifesi degerleri: 
Day_Period(06:00 - 17:00)--> 0.252087 (TL/kWh) | Peak_Period(17:00 - 22:00)--> 0.546287 (TL/kWh) | Night_Period(22:00 - 06:00)--> 0.180231 (TL/kWh) |     
     
    Enter the desired time period range to perform 'Load Shifting'.

    ******************************************************************

    Enter the beginning point of the peak range(between 0 and 96) : 

    Enter the ending    point of the peak range(between 0 and 96) : 

Ve sonrasında yükleri ötelemek istediği zaman aralığında ne kadar Watt bir gücün çekilebileceğinin eşik değerini girmektedir.
    
    Define to treshold value for peak period [W]:

Yani girilen eşik değerinin (örneğin 4000 W' ın) üzerinde enerji talebinde bulunulması durumunda o yük/yükler ileri bir zamana ötelenir. Örneğin çamaşır makineniz akşam sekiz yerine akşam 10' da devreye alınarak çamaşırları yıkar ve sizin ayın sonunda ki fatura maliyetiniz aynı enerjiyi talep etmenize rağman düşer. Eşik değeri belirlenirkenki tek istisna bu değerin en yüksek önem değerine sahip yük grubunun talep ettiği enerji talebinden küçük olmamasıdır. Bu durumda kullanıcından tekrar eşik değerini belirlemesi istenir. Birinci öncelik seviyesindeki yükler buzdolabı, kombi ve birinci aydınlatma grubu gibi enerjisinin kesilmesini istemediğimiz temel yük gruplarıdır.

Yük gruplarının çektiği enerji büyüklüklerini gösteren tablo aşağıda yer almaktadır. 

![image](https://user-images.githubusercontent.com/83073342/127768351-d8eb043f-e53d-4cf4-86e7-268681370ae0.png)

İlgili senaryoda yer aldığı üzere akıllı evimize elektrik enerjisi sağlayan rüzgar türbinimize ait özellikler() kodda yer almaktadır. İstenmesi halinde kod üzerinden yeniden düzenlenebilir. Bu özelliklerin dışında rüzgar türbininden elde edilen ortalama enerjiyi bulabilmek için o konuma ait ortalama hız bilgisi girilir.

    Average wind speed of your location (m/s):

Bu bilgi ile türbinin ürettiği enerji miktarına ulaşılır. Ve bu değer maliyet hesaplarına dahil edilir. Ardından sonuçlar ekrana basılır.

    *******************************************RESULTS****************************************************
      >Invoice amount obtained as a result of expenditures                              : X TL/Month

      >Invoice amount obtained by including only the load shifting process in the system: X TL/Month

      >Profit value obtained by shifting loads only                                     : X TL/Month 

      >Invoice amount obtained by including only the wind turbine in the system         : X TL/Month

      >Profit value obtained by adding only the wind turbine                            : X TL/Month

    ------------------------------------Total Profit------------------------------------: X TL/Month 


İki örnek senaryo ile verilenleri somutlaştırılalım. 

Şebekeden güç çekiminin fazla olduğu peak zamanda (17:00-22:00 saatleri arasında) birinci senaryoda kış mevsimi için 5000 W, ikinci senaryoda yaz mevsimi için 4000 W trashold değeri belirlenmiştir ve bu yükler Akıllı Ev Enerji Yönetimi Sistemi vasıtasıyla 22:00 ‘den sonrasına ötelenmiştir. Ötelenmesi istenen aralıklar 70 ile 80 (70. 15 dakikalık zaman ile 80. 15 dakikalık) zaman aralığı belirlenmiştir. Ayrıca akıllı evin enerji ihtiyacının bir kısmını karşılayacak bir rüzgar türbini Enerji Yönetim Sistemi'ne bağlı ve entegre şekilde çalışarak gün içerisinde kazandığı enerjiyi ev içerisinde kullanmakta ve toplam enerji maliyetini azaltmaktadır. İki senaryoda da konum için belirlenen rüzgar hızı 5 km/s'dir.  

***ÖRNEK SENARYO 1***

    Please enter...
    1 if you would like to load the winter season's average daily energy expenditures values,or
    2 if you would like to load the summer season's average daily energy expenditures values: 1 

Kış mevsiminin ortalama günlük enerji harcaması değerlerini yüklenir. Kış mevsimi için gün içerisinde anlık ortalama talep edilen enerji harcamasını gösteren grafik ekrana basılır.

![image](https://user-images.githubusercontent.com/83073342/127766713-7f0babd7-d182-47eb-abe0-eee8080bd75a.png)

          Kış mevsimi için gün içerisinde anlık ortalama talep edilen enerji harcamasını gösteren grafik

Ardından ötelenmesi istenilen zaman aralığı istenir.

    Enter the desired time period range to perform 'Load Shifting'.

    ******************************************************************

    Enter the beginning point of the peak range(between 0 and 96) : 70

    Enter the ending    point of the peak range(between 0 and 96) : 80
İlgili yerlere ötelenmesi istenen aralıklar olan 70 ile 80 (70. 15 dakikalık zaman ile 80. 15 dakikalık) zaman aralığı girilir.

![image](https://user-images.githubusercontent.com/83073342/127769606-0d506549-5182-4686-a1ed-73f525d40b3b.png)

                                   Grafik üzerinde ötelenmesi istenen zaman aralıkları

Bu aralıklar için uygulanacak olan eşik değeri girilir.

    Define to treshold value for peak period      [W]: 5000 
    
Girilen eşik değerine göre öteleme işlemi gerçekleştirilir. Ve ötelenen yükünde yer aldığı grafik ekrana basılır. 
    
![image](https://user-images.githubusercontent.com/83073342/127769750-8bc0fe48-4c9a-4180-b882-a9c3986920b9.png)

Akıllı ev enerji yönetimi sistemi ile entegre çalışan ve yenilebilir enerji kaynaklarından biri olan rüzgar türbininin gücünün hesaplanabilmesi ve maliyet analizine eklenebilmesi için kullanıcının konumuna ait ortalama rüzgar hızı bilgisi kullanıcı tarafından girilir.  

    Average wind speed of your location              : 5 m/s
    
    Rüzgar türbininin ürettiği oratalama güç değeri  : 86.8307 W

Tüm bilgiler girildikten sonra sistemin yük öteleme ve rüzgar türbininin entegrasyonu ile ortaya çıkan maliyet tablosu ekrana basılır.

    *******************************************RESULTS****************************************************
      >Invoice amount obtained as a result of expenditures                              : 382.1321 TL/Month

      >Invoice amount obtained by including only the load shifting process in the system: 350.1204 TL/Month

      >Profit value obtained by shifting loads only                                     : 32.0116 TL/Month 

      >Invoice amount obtained by including only the wind turbine in the system         : 298.1518 TL/Month

      >Profit value obtained by adding only the wind turbine                            : 83.9803 TL/Month

    ------------------------------------Total Profit------------------------------------: 115.9919 TL/Month

Harcamalar sonucu elde edilen fatura tutarı, 382.1321 TL' dir. Yanlızca yük kaydırma işleminin sisteme dahil edilmesi ile elde edilen fatura tutarı, 350.1204 TL'dir. Yalnızca yük kaydırarak elde edilen kâr, 32.0116  TL' dir. Yanlızca rüzgar türbinin sisteme dahil edilmesi ile elde edilen fatura tutarı 298.1518 TL' dir. Yalnızca rüzgar türbini eklenerek elde edilen kâr 83.9803  TL' dir. Toplam kâr ise 115.9919 TL elde edilir.

***ÖRNEK SENARYO 2***

    Please enter...
    1 if you would like to load the winter season's average daily energy expenditures values,or
    2 if you would like to load the summer season's average daily energy expenditures values: 2 

Yaz mevsiminin ortalama günlük enerji harcaması değerlerini yüklenir. Yaz mevsimi için gün içerisinde anlık ortalama talep edilen enerji harcamasını gösteren grafik ekrana basılır.

![image](https://user-images.githubusercontent.com/83073342/127770250-0a0e8e6f-1b44-4b40-86ed-aadf9e67da60.png)
                    
          Yaz mevsimi için gün içerisinde anlık ortalama talep edilen enerji harcamasını gösteren grafik
          
Ardından ötelenmesi istenilen zaman aralığı istenir.

    Enter the desired time period range to perform 'Load Shifting'.

    ******************************************************************

    Enter the beginning point of the peak range(between 0 and 96) : 70

    Enter the ending    point of the peak range(between 0 and 96) : 80
İlgili yerlere ötelenmesi istenen aralıklar olan 70 ile 80 (70. 15 dakikalık zaman ile 80. 15 dakikalık) zaman aralığı girilir.

![image](https://user-images.githubusercontent.com/83073342/127770398-1a788aa7-f6e9-479b-af9a-663c5784618f.png)

                                   Grafik üzerinde ötelenmesi istenen zaman aralıkları

Bu aralıklar için uygulanacak olan eşik değeri girilir.

    Define to treshold value for peak period      [W]: 4000 
    
Girilen eşik değerine göre öteleme işlemi gerçekleştirilir. Ve ötelenen yükünde yer aldığı grafik ekrana basılır. 

![image](https://user-images.githubusercontent.com/83073342/127770414-ad6f5d6c-5ba4-4b18-ad0b-02d34fc2b5b8.png)

Akıllı ev enerji yönetimi sistemi ile entegre çalışan ve yenilebilir enerji kaynaklarından biri olan rüzgar türbininin gücünün hesaplanabilmesi ve maliyet analizine eklenebilmesi için kullanıcının konumuna ait ortalama rüzgar hızı bilgisi kullanıcı tarafından girilir.  

    Average wind speed of your location              : 5 m/s
    
    Rüzgar türbininin ürettiği oratalama güç değeri  : 86.8307 W

Tüm bilgiler girildikten sonra sistemin yük öteleme ve rüzgar türbininin entegrasyonu ile ortaya çıkan maliyet tablosu ekrana basılır.

    *******************************************RESULTS****************************************************
      >Invoice amount obtained as a result of expenditures                              : 349.7290 TL/Month

      >Invoice amount obtained by including only the load shifting process in the system: 306.9254 TL/Month

      >Profit value obtained by shifting loads only                                     : 42.8036 TL/Month 

      >Invoice amount obtained by including only the wind turbine in the system         : 265.7488 TL/Month

      >Profit value obtained by adding only the wind turbine                            : 83.9803 TL/Month

    ------------------------------------Total Profit------------------------------------: 126.7838 TL/Month


Örnek yaz ve kış mevsimlerine ait senaryoların maliyet verileri aşağıdaki tabloda sırasıyla gösterilmiştir.

![image](https://user-images.githubusercontent.com/83073342/127752234-13465ad4-7729-46e7-ad6e-b0ad418da3af.png)

Örnek senaryoların sonucunda hem talep tarafı aksiyomlarından yük öteleme uygulaması hem de yenilebilir bir enerji kaynağının akıllı ev enerji yönetimi sistemi ile entegrasyonu sonucu tüketicinin toplam enerji bedelini yaklaşık %30 azalacağını göstermektedir. 

Burada girilen değerler asgari büyüklükler olarak verilmiş olduğundan konuma ait ortalama rüzgar hızı, öteleme yapılacak zaman aralığı ve eşik değeri gibi parametreler değiştirilirdiğinde enerji bedelinin çok daha fazla azalacağı göz önünde bulundurulmalıdır. 

Ayrıca bu çalışmada sadece yük öteleme veya sadece rüzgar türbininden sağlanan kar da elde edilebilmektedir. Bir akıllı evde farklı şekillerde gerçekleştirilebilecek senaryolar ile Enerji Yönetim Sistemi'i gibi bir sistemin gerçekleştirdiği çeşitli aksiyomlardan biri olan 'Yük Öteleme(Load Shifting)' uyguanmasının ve yenilebilir enerji üretiminin tüketiciye finansal etkisi ölçülebilmektedir.
