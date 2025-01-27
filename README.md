# Proje Açıklaması (Case Study)

Bu proje, bir **case study** olarak **JSONPlaceholder** API servisine ait `/users` endpoint'ini kullanarak geliştirilmiştir.

## Özellikler

* Ana ekranda kullanıcıların **isim** ve **email** bilgileri bir liste halinde gösterilir.
* Her bir kullanıcıya tıklandığında **detay ekranı** açılır ve seçili kullanıcıya ait **isim**, **email**, **telefon numarası** ve **web sitesi** bilgileri görüntülenir.

# Nasıl Çalıştırılır?

## 1) Depoyu Klonla

git clone https://github.com/tunimba/JSONPlaceholderAPICaseStudy.git ya da
proje dosyasını indirin.

## 2) Projenin Açılması

* Proje klasöründeki .xcodeproj dosyasına çift tıklayarak Xcode'da açın.

## 3) Cihaz veya Simülatör Seçimi

* Xcode menüsünden, projeyi çalıştıracağınız iPhone veya simülatörü seçin (Örnek: iPhone 14 Pro).

## 4) Derleme ve Çalıştırma

* Sol üstteki “Run” (►) butonuna basın veya Cmd + R kısayolunu kullanın.
* Uygulama başarıyla derlendikten sonra seçtiğiniz cihaza/simülatöre yüklenecektir.

## 5) Kullanım

* Uygulama açıldığında otomatik olarak JSONPlaceholder’dan kullanıcı verisi çeker ve bir liste halinde gösterir.
* Liste elemanına dokunduğunuzda kullanıcıya özel detay sayfasına yönlendirilirsiniz.

# Gereksinimler

* iOS 17.0+

# Ek Not

* Uygulamanın kullanımı için internet bağlantısı gereklidir (API çağrısı için). Fakat internetsiz kullanımla test edebilmek için mock datalar kod olarak sağlanmaktadır.
* (Herhangi bir harici paket yönetimi aracı kullanılmamıştır.)
* Kodlar test edilebilmeye uygundur fakat kod testleri vakit göz önünde bulundurularak yazılmamıştır.
