# SotaApp
---
Bu projede SotaApp isimli bir veritabanı tasarladım. Amacım, müşteri, ürün, sipariş ve satıcı bilgilerini tutarak basit bir e-ticaret sistemini simüle etmekti. Çalışma sürecinde öncelikle hangi tabloların gerekli olacağına karar verdim. Daha sonra tablolar arasındaki ilişkileri belirledim ve uygun alan tiplerini seçerek tabloları oluşturdum.

## Tasarım Süreci
---
Müşteri Tablosu: Sisteme kayıtlı olan müşterilerin ad, soyad, e-posta, şehir ve kayıt tarihini tuttum.

Kategori Tablosu: Ürünlerin kategorilere ayrılması için basit bir tablo oluşturdum.

Satıcı Tablosu: Ürünleri tedarik eden satıcıların ad ve adres bilgilerini ekledim.

Ürün Tablosu: Ürünlerin adı, fiyatı, stok bilgisi ile birlikte hangi kategoriye ve hangi satıcıya ait olduğunu ilişkilendirdim.

Sipariş Tablosu: Müşterilerin verdiği siparişleri tarih, toplam tutar ve ödeme yöntemiyle birlikte kaydettim.

Sipariş Detay Tablosu: Siparişlerin hangi ürünlerden oluştuğunu ve adet/fiyat bilgisini sakladım.

Bu yapıyla birlikte tablolar arasında birincil ve yabancı anahtar ilişkileri kurarak tutarlılığı sağlamaya çalıştım.

## Karşılaşılan Sorunlar
---
Çalışma sırasında birkaç noktada karar vermekte zorlandım. Örneğin, sipariş verildiğinde ürün stoklarının otomatik olarak güncellenmesi gerektiğini düşündüm. İlk başta UPDATE sorgusu ile bunu manuel olarak yazdım fakat bunun pratikte daha iyi bir yöntem olmadığını fark ettim. Daha doğru yaklaşımın bir trigger veya stored procedure ile otomatik güncelleme yapmak olduğunu not ettim.

Bir diğer konu da raporlama sorgularında ortaya çıktı. Bazı sorgularda sadece JOIN ve GROUP BY kullanmak yeterliydi ama HAVING kullanmadan belirli koşullara göre filtreleme yapmak eksik kaldı. Bunun da ilerleyen aşamalarda eklenmesi gerektiğini gördüm.

## Raporlama Sorguları
--
* En çok sipariş veren müşteriler
* En çok satılan ürünler
* En yüksek ciro yapan satıcılar
* Şehirlere göre müşteri dağılımı
* Kategori bazlı satış toplamları
* Aylara göre sipariş sayıları
* Hiç sipariş vermeyen müşteriler ve hiç satılmayan ürünler
* Bu sorgular sayesinde veritabanının işlevselliğini test edebildim ve ticari açıdan kullanılabilir raporlar elde ettim.
