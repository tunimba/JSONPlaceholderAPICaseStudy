# Proje Açıklaması (Case Study)

Bu proje, bir **case study** olarak **JSONPlaceholder** servisine ait `/users` endpoint'ini kullanarak geliştirilmiştir.

## Özellikler

* Ana ekranda kullanıcıların **isim** ve **email** bilgileri bir liste halinde gösterilir.
* Her bir kullanıcıya tıklandığında **detay ekranı** açılır ve seçili kullanıcıya ait **isim**, **email**, **telefon numarası** ve **web sitesi** bilgileri görüntülenir.

## Mimari

Proje, **MVVM** (Model-View-ViewModel) prensipleri doğrultusunda katmanlara ayrılmıştır. Ağ üzerinden çekilen veriler, **UserDefaults** aracılığıyla yerel olarak da saklanabilir. Böylece uygulama kapatılıp yeniden açıldığında verileri koruyabilmektedir.

## Nasıl Çalıştırılır?

### 1. Depoyu Klonla

```bash
git clone https://github.com/<kullanıcıAdınız>/<repoAdı>.git
cd <repoAdı>

2. Projenin Açılması

Proje klasöründeki .xcodeproj veya .xcworkspace dosyasına çift tıklayarak Xcode'da açın.
(Örnek: MySwiftUIProject.xcodeproj)

3. Cihaz veya Simülatör Seçimi

Xcode menüsünden, projeyi çalıştıracağınız iPhone veya simülatörü seçin (Örnek: iPhone 14 Pro).

4. Derleme ve Çalıştırma

Sol üstteki "Run" (►) butonuna basın veya Cmd + R kısayolunu kullanın.
Uygulama başarıyla derlendikten sonra seçtiğiniz cihaza/simülatöre yüklenecektir.

5. Kullanım

Uygulama açıldığında otomatik olarak JSONPlaceholder'dan kullanıcı verisi çeker ve bir liste halinde gösterir.
Liste elemanına dokunduğunuzda kullanıcıya özel detay sayfasına yönlendirilirsiniz.
Veriler, UserDefaults içine kaydedildiği için uygulamayı tekrar açtığınızda daha önce yüklenen veriler görüntülenebilir.

Gereksinimler

Swift 5 veya üzeri
Xcode 14 veya üzeri
iOS 16.0+
(Herhangi bir harici paket yönetimi aracı kullanılmamıştır.)

Ek Notlar

İnternet bağlantısı gereklidir (API çağrısı için).
Model, ViewModel ve View yapıları ayrı dosyalarda organize edilmiştir.
Uygulamadaki User, UserListItem ve UserDetailItem modelleri, verilerin ayrı ekranlarda daha kolay yönetilmesini sağlamaktadır.
