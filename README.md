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
