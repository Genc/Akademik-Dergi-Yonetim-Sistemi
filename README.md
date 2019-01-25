# Akademik Dergi Yönetim Sistemi ( Journality )

***Journality*** isimli projenin amacı; akademik ve bilimsel araştırma makaleleri yazarlarının yazmış olduğu makaleleri sisteme kolay bir şekilde yükleyip, sistemde var olan editörler tarafından kontrol edilip uygunluğuna göre editör, makaleyi *reddedebilme ya da onaylayıp* ilgili hakeme atayabilme gibi yetkileri bulunuyor. Editör tarafından reddedilmiş makale, yazarın sayfasında reddedilme sebebi ile birlikte görüntülenmekte. Şayet editör onaylayıp ilgili hakeme atama işlemini gerçekleştirdiği durumda da editör için var olan *reddetme/onaylama* yetkileri hakem içinde geçerli olmakta. Hakem bu makaleyi gerekçe göstererek reddedebilir veya makaleyi kabul ederek; Üniversite ve araştırma kurumları gibi dergi yayımlayan yayınevlerine gönderilmesini sağlar. 
Bu sayede yayınevi ilgili makaleyi kontrol ettikten sonra kolay bir şekilde dergide yayımlamaya başlayabilir. 

Bu proje @[dergipark](http://dergipark.gov.tr/) projesinin bir benzeridir.

# Kullanıcı Tipleri ve Rolleri
İlk olarak sistemimizde var olacak olan yapıları tanımlamalar şeklinde ifade edelim. Akademik Dergi Yönetimi Sistemi isimli projemiz; “**Yazar**, **Editör** ve **Hakem** ” olmak üzere 3 adet temel rol ile yönetilmekte. Bu rolleri kısaca tanımlayalım ve bilgi verelim.

**Yazar**: Akademik ve Bilimsel araştırma niteliğinde çalışma yapan ve bu çalışmasını ilgili kategorideki dergide yayımlanmak üzere sisteme yükleyen rol.

**Editör**: Sistem içerisinde kendi panelinde olan makaleyi/yazıyı inceledikten sonra, uygun görüldüğü durumda hakeme yönlendirme görevi olan rol.

**Hakem**: Editör tarafından gelen makaleyi, belirli şartlara uygunluğu teyit edildikten sonra ilgili kuruma aktarılmasını sağlayan rol.

### Genel iş akış modeli
![İş Akışı](https://farukgenc.com/AKDYS/isakisi.png)

## Nasıl kullanabilirim ?

Projeyi bilgisayarınıza indirdikten sonra, [database](https://github.com/genc/Akademik-Dergi-Yonetim-Sistemi/tree/master/Database) klasöründe bulunan SQL dosyasını MySQL üzerinde çalıştırarak hızlı bir şekilde gerekli olan tüm tabloları oluşturmalısınız.

Ardından projede Yazar, eklemiş olduğu makaleleri "**controller/addArticleController.java**" sınıfında hangi klasöre yüklenmesini istediğinin ilgili ayarları bulunmakta. Bu klasörüde dilerseniz değiştirebilirsiniz. 
Eğer değiştirmezseniz yüklemiş olduğunuz makaleler varsayılan olarak **"C:\..\..\out\artifacts\..\uploadFolder"** olacaktır.
Ayrıca **"controller/DownloadServletController.java"** sınıfında da bunun ilgili ayarları bulunmakta.

Bu ayarların haricinde Veritabanı bağlantısı konfigürasyon ayarlarını **"dao/ConnectionManager.java"** sınıfında kendi veritabanı bağlantı ayarlarınıza göre değiştirmeniz gerekmektedir.

Ek olarak yazar sisteme yeni bir makale yüklerken listelenen şehirler ve dergi isimleri "**WEB-INF/"** klasörü altında txt formatında bir dosyadan okunuyor. Burayı dilediğiniz gibi düzeltebilirsiniz.


## Kullanılan Teknolojiler

 - HTML, CSS, Bootstrap
 - Servlet & JSP
 - MySQL
 - Apache Tomcat 9.0.12
 - IntelliJ IDEA

## Ekran Görüntüleri

![enter image description here](https://farukgenc.com/AKDYS/1.png)
![enter image description here](https://farukgenc.com/AKDYS/2.png)
![enter image description here](https://farukgenc.com/AKDYS/3.png)
![enter image description here](https://farukgenc.com/AKDYS/4.png)
![enter image description here](https://farukgenc.com/AKDYS/5.png)
![enter image description here](https://farukgenc.com/AKDYS/6.png)
![enter image description here](https://farukgenc.com/AKDYS/7.png)
![enter image description here](https://farukgenc.com/AKDYS/8.png)
![enter image description here](https://farukgenc.com/AKDYS/9.png)
![enter image description here](https://farukgenc.com/AKDYS/10.png)
![enter image description here](https://farukgenc.com/AKDYS/11.png)
![enter image description here](https://farukgenc.com/AKDYS/12.png)
![enter image description here](https://farukgenc.com/AKDYS/13.png)
![enter image description here](https://farukgenc.com/AKDYS/14.png)
![enter image description here](https://farukgenc.com/AKDYS/15.png)
![enter image description here](https://farukgenc.com/AKDYS/16.png)
![enter image description here](https://farukgenc.com/AKDYS/17.png)
![enter image description here](https://farukgenc.com/AKDYS/18.png)
![enter image description here](https://farukgenc.com/AKDYS/19.png)