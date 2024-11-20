![image](https://github.com/user-attachments/assets/8e2d09c0-c871-4623-ba79-d40c3bf5712f)# alatas-survival-mobile


Tugas 9
Menjawab Pertanyaan

1. Mengapa Kita Perlu Membuat Model untuk JSON? Apakah Akan Terjadi Error Tanpa Model?
Model diperlukan karena berfungsi sebagai struktur dasar untuk data yang akan dikirimkan atau diterima melalui JSON. Model memastikan bahwa data yang diterima sesuai dengan format yang kita harapkan, seperti tipe data dan hubungan antar atribut. Dengan model, kita bisa dengan mudah mengatur data yang kompleks, validasi input, dan menghindari error saat data diolah atau disimpan ke database.

Jika kita tidak membuat model terlebih dahulu, Django tidak akan memiliki acuan tentang bagaimana data tersebut harus ditangani. Hal ini dapat menyebabkan error, terutama ketika data yang diterima tidak sesuai format atau ketika kita mencoba mengakses atribut yang tidak didefinisikan.

2. Fungsi Library http di Flutter
Library http digunakan sebagai alat untuk mengirim dan menerima data antara aplikasi Flutter dan server Django. Beberapa fungsi utama dari library ini adalah:

Mengirim request HTTP seperti GET, POST, PUT, atau DELETE.
Mengambil data dari server dalam format JSON, yang kemudian bisa diolah dan ditampilkan di aplikasi Flutter.
Mengirim data dari Flutter ke server, misalnya data login atau registrasi.
Dalam tugas ini, library http digunakan untuk mengakses endpoint Django, mengambil daftar item, mengirim data pengguna untuk login atau register, dan berkomunikasi dengan server secara keseluruhan.

3. Fungsi CookieRequest dan Mengapa Harus Dibagikan
Fungsi CookieRequest: CookieRequest berfungsi untuk mengelola sesi autentikasi menggunakan cookie. Ketika pengguna login, Django mengirimkan cookie yang menunjukkan sesi pengguna saat ini. CookieRequest menyimpan informasi ini sehingga kita tidak perlu login ulang setiap berpindah halaman.

Mengapa Perlu Dibagikan: Semua komponen di aplikasi Flutter yang membutuhkan data pengguna login atau akses endpoint tertentu memerlukan cookie. Dengan membagikan instance CookieRequest ke seluruh komponen, kita memastikan setiap bagian aplikasi dapat terhubung ke server dengan autentikasi yang sama.

4. Mekanisme Pengiriman Data (Dari Input ke Tampilan)
Mekanisme pengiriman data dari input hingga dapat ditampilkan di Flutter melibatkan beberapa langkah:

Input di Flutter: Pengguna memasukkan data melalui form, seperti nama, email, atau password.
Kirim ke Django: Data ini dikirim ke server Django melalui request HTTP (biasanya POST) menggunakan library http.
Proses di Django: Django menerima data, memvalidasinya menggunakan model, dan menyimpan data tersebut ke database jika valid.
Respons ke Flutter: Django mengirim respons dalam format JSON, yang berisi data atau status hasil proses.
Tampilkan di Flutter: Flutter membaca data JSON ini, memprosesnya, dan menampilkan hasilnya di antarmuka pengguna.
Contohnya, untuk menampilkan daftar item, Flutter mengirim request GET ke Django, menerima data daftar item dalam JSON, lalu menampilkan name, price, dan description di aplikasi.

5. Mekanisme Autentikasi (Login, Register, Logout)
Autentikasi melibatkan proses berikut:

Registrasi:

Pengguna mengisi form di Flutter.
Flutter mengirim data (misalnya username dan password) ke Django.
Django memvalidasi data dan menyimpannya di database.
Django mengirim respons ke Flutter untuk memberi tahu bahwa registrasi berhasil.
Login:

Pengguna memasukkan username dan password.
Flutter mengirim data ini ke Django.
Django memvalidasi data terhadap database, dan jika benar, mengirim cookie sesi.
Cookie ini disimpan di aplikasi untuk autentikasi berikutnya.
Logout:

Flutter mengirim permintaan logout ke Django.
Django menghapus sesi, dan Flutter menghapus cookie dari memori aplikasi.
Setelah login, menu atau fitur lain di aplikasi Flutter akan menampilkan data yang sesuai dengan akun pengguna tersebut.

6. Langkah-Langkah Implementasi Checklist
---

1. **Menghubungkan Django dengan Flutter melalui JSON**  
   Langkah pertama adalah memastikan Django dapat mengirimkan data dalam format JSON. JSON adalah format data yang umum digunakan untuk pertukaran informasi antara server dan aplikasi. Untuk mengirimkan data JSON, Django menggunakan *API* yang dapat mengirimkan data dalam format tersebut. Flutter kemudian akan mengambil data JSON dengan menggunakan *library* `http` yang memungkinkan aplikasi mengirim permintaan ke server Django dan menerima data JSON sebagai respons.

2. **Mengimplementasikan Fitur Registrasi Akun di Flutter**  
   Di aplikasi Flutter, fitur registrasi melibatkan pembuatan formulir untuk mengisi nama, email, dan password. Setelah data dimasukkan, Flutter mengirimkan data tersebut ke Django untuk membuat akun baru. Django kemudian akan memproses data dan mengirimkan respons yang memberi tahu apakah registrasi berhasil atau gagal.

3. **Membuat Halaman Login di Flutter**  
   Halaman login memungkinkan pengguna untuk memasukkan username dan password. Setelah pengguna mengisi formulir login dan menekan tombol login, aplikasi Flutter mengirimkan permintaan ke Django untuk memverifikasi kredensial. Jika login berhasil, Django mengirimkan token autentikasi yang digunakan untuk memastikan pengguna tetap terautentikasi saat mengakses halaman-halaman berikutnya.

4. **Mengintegrasikan Sistem Autentikasi Django dengan Flutter**  
   Setelah login berhasil, aplikasi Flutter menerima token autentikasi dari Django. Token ini digunakan untuk mengirimkan permintaan ke Django dengan menyertakan token di setiap permintaan berikutnya, yang memastikan hanya pengguna yang terautentikasi yang dapat mengakses data dan halaman yang dilindungi.

5. **Membuat Model Kustom di Django**  
   Model kustom digunakan di Django untuk mendefinisikan struktur data yang akan digunakan di aplikasi. Misalnya, jika aplikasi mengelola produk atau item, model seperti `Item` akan dibuat dengan atribut seperti nama, harga, dan deskripsi. Data yang diambil dari model ini akan dikirim ke Flutter dalam format JSON untuk ditampilkan di aplikasi.

6. **Menampilkan Daftar Item di Flutter**  
   Setelah API di Django disiapkan, aplikasi Flutter dapat mengambil daftar item melalui endpoint yang telah disediakan. Data JSON yang diterima akan berisi informasi seperti nama, harga, dan deskripsi item. Aplikasi Flutter akan menampilkan informasi ini dalam bentuk daftar yang bisa digulir, di mana setiap item dapat diklik untuk melihat lebih banyak detail.

7. **Membuat Halaman Detail Item di Flutter**  
   Setiap item pada daftar dapat dipilih untuk membuka halaman detailnya. Halaman ini akan menampilkan informasi lebih lengkap tentang item, seperti gambar, deskripsi panjang, dan atribut lainnya. Data ini akan diambil dari server Django dan ditampilkan di Flutter.

8. **Melakukan Filter Daftar Item Berdasarkan Pengguna yang Login**  
   Untuk memastikan bahwa setiap pengguna hanya melihat item yang terkait dengan akun mereka, aplikasi Flutter dapat memfilter daftar item yang ditampilkan berdasarkan pengguna yang sedang login. Dengan menggunakan token autentikasi, Django hanya mengirimkan item yang relevan dengan pengguna yang saat ini aktif.

---
[13/11/2024]

Tugas Individu 8
Implementasi Checklist dan Menjawab Pertanyaan

Pertanyaan:
1) Kegunaan 'const' di Flutter:
Kegunaan: 'const' digunakan untuk mendeklarasikan variabel atau widget yang tidak berubah selama aplikasi berjalan. Nilai variabel const harus sudah diketahui pada waktu kompilasi (compile-time constant). Ini mengindikasikan bahwa nilai atau widget tersebut tetap konstan selama runtime.
Keuntungan: Dengan menggunakan 'const', Flutter dapat mengoptimalkan aplikasi karena widget yang tidak berubah tidak perlu dibangun ulang setiap kali. Ini mengurangi overhead rendering dan penggunaan memori.
Kapan digunakan: Gunakan 'const' pada widget atau variabel yang tidak bergantung pada perubahan data (misalnya, warna atau teks yang tetap).
Tidak digunakan: Minimalisir penggunaan 'const' jika widget atau variabel perlu bergantung pada data yang dapat berubah selama runtime (misalnya, data yang didapat dari server atau input pengguna).

2. Perbandingan Column dan Row:
Column: Widget yang digunakan untuk menata anak-anaknya secara vertikal (ke bawah).
Contoh:menampilkan beberapa teks satu per satu secara vertikal, seperti pada formulir atau daftar.
'''dart
 child: Column(
    children: [
      const Padding(
        padding: EdgeInsets.only(top: 16.0),
        child: Text(
          'Welcome to Alatas Survival!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
      ),
      GridView.count(
        primary: true,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: items.map((ItemHomepage item) {
          return HoverableItemCard(item);
        }).toList(),
      ),
    ],
  ),

Row: Widget yang digunakan untuk menata anak-anaknya secara horizontal (ke samping).
Contoh: Menampilkan ikon dan teks dalam satu baris.
''dart
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      InfoCard(title: 'NPM', content: npm),
      InfoCard(title: 'Name', content: name),
      InfoCard(title: 'Class', content: className),
    ],
  ),

Perbandingan: Column cocok digunakan saat kamu perlu menata elemen secara vertikal, sedangkan Row digunakan ketika elemen perlu ditata secara horizontal. Keduanya sangat bergantung pada kebutuhan tata letak antarmuka.


3. Elemen Input pada Form:
A. Elemen Input yang Digunakan:
a. TextField untuk input teks (misalnya, nama, deskripsi, jumlah).
  TextFormField untuk Name: dengan ketentuan, panjang nama minimal 5 karakter dan tidak boleh kosong.
  TextFormField untuk Descripton: dengan ketentuan, panjang antara 10 hingga 100 karakter, dan tidak boleh kosong.
  TextFormField untuk Ammount: yang dimasukkan harus berupa angka dan tidak boleh negatif ataupun kosong. 
Jika inputnya tidak valid, pengguna akan diberi tahu.
b. ElevatedButton untuk tombol kirim atau simpan.

B. Elemen Input yang Tidak Digunakan:
Checkbox: Untuk pilihan biner (Ya/Tidak).
Radio: Untuk pilihan tunggal dalam grup.
Switch: Untuk pengaturan hidup/mati.
DatePicker: Untuk memilih tanggal.

4. Mengatur Tema di Flutter:
Cara Mengatur Tema: Tema di Flutter didefinisikan menggunakan ThemeData, yang mengatur aspek visual seperti warna dan gaya teks di seluruh aplikasi.
Dan, ya, saya menggunakannya di main.dart, untuk mengelola tema dalam warna dasar cyan/biru. Untuk fontnya, sedang suka font Cardo yang sedikit imaginer.
Contoh Penggunaan:
'''dart
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan,).copyWith(secondary: Colors.cyan[50]),
        textTheme: GoogleFonts.cardoTextTheme( // Menetapkan text theme menggunakan font Cardo
            Theme.of(context).textTheme.apply(
            bodyColor: Colors.black,
            displayColor: Colors.black,
          ),
        ),
        useMaterial3: true,
      ),

Implementasi Tema: Tema dapat diterapkan di seluruh aplikasi dengan menambahkan theme di MaterialApp. Ini memastikan konsistensi visual di seluruh aplikasi, sehingga aplikasi terlihat seragam.

5. Menangani Navigasi di Flutter:
Navigasi: Di Flutter Alatas Survival ini, navigasi antar halaman diatur menggunakan Navigator. Navigator.push() digunakan untuk membuka halaman baru, dan Navigator.pop() digunakan untuk kembali ke halaman sebelumnya.
Contoh Navigasi:
'''dart
// Menavigasi ke halaman baru
Navigator.push(
  context, 
  MaterialPageRoute(builder: (context) => NewPage()),
);

// Kembali ke halaman sebelumnya
Navigator.pop(context);
Navigasi Penggantian: Jika ingin mengganti halaman saat ini tanpa bisa kembali ke halaman sebelumnya, gunakan Navigator.pushReplacement().
Navigasi memungkinkan aplikasi untuk berpindah antar halaman atau tampilan tanpa memulai ulang aplikasi.




===============================================================================================
[06/11/2024]
Tugas Individu 7
Implementasi Checklist dan Menjawab Pertanyaan
ALATAS SURVIVAL MOBILE
![image](https://github.com/user-attachments/assets/40a2aaf5-1f00-427d-9461-01c352d8274d)

Pertanyaan:
1) Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
    Stateless Widget: Ini adalah widget yang tidak berubah setelah dibuat. Artinya, tampilan atau isinya tetap sama dan tidak terpengaruh oleh interaksi pengguna atau perubahan data. Contohnya adalah InfoCard dalam kode yang saya buat, karena informasi yang ditampilkan (seperti NPM, nama, dan kelas) tidak berubah.
    Stateful Widget: Sebaliknya, widget satu ini bisa berubah seiring waktu, misalnya saat ada interaksi pengguna, seperti menekan tombol atau menggerakkan mouse. Contohnya adalah HoverableItemCard, di mana status hover berubah ketika mouse berada di atasnya, dan tampilannya juga berubah.
   
2) Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
  >> Scaffold: Widget ini menyediakan struktur dasar halaman untuk aplikasi MyHomePage, termasuk AppBar di bagian atas dan body sebagai konten utama.
  >> AppBar: Menampilkan judul aplikasi "Alatas Survival" di bagian atas halaman dengan gaya font yang tebal dan warna putih. Warna latar belakangnya diambil dari colorScheme aplikasi.
  >> Padding: Memberikan jarak di sekitar SingleChildScrollView agar konten tidak terlalu menempel di tepi layar, sehingga membuat tampilan lebih rapi.
  >> SingleChildScrollView: Memungkinkan pengguna menggulir konten jika tinggi layar tidak mencukupi, terutama berguna saat konten dalam Column terlalu panjang.
  >> : Komponen khusus yang dirancang untuk menampilkan informasi pengguna seperti NPM, nama, dan kelas dalam bentuk kartu. Setiap kartu memiliki judul dan isi yang ditampilkan dengan gaya sederhana namun jelas.
  >> GridView: Digunakan untuk menampilkan HoverableItemCard dalam bentuk grid dengan 3 kolom, menciptakan tata letak yang simetris untuk ikon item. Grid ini tidak dapat digulir karena shrinkWrap disetel ke true dan physics disetel ke NeverScrollableScrollPhysics.
  >> HoverableItemCard: Widget ini menampilkan item interaktif dengan nama dan ikon, seperti "Lihat Daftar Produk", "Tambah Produk", dan "Logout". Setiap kartu dapat diperbesar sedikit saat mouse berada di atasnya, memberikan efek hover yang menarik. Selain itu, kartu ini dilengkapi dengan warna unik untuk setiap item yang ditentukan melalui metode _getItemColor.
  >> MouseRegion: Ditempatkan di sekitar HoverableItemCard untuk mendeteksi gerakan mouse, mengubah status isHovered dan menyesuaikan tampilan kartu saat mouse masuk atau keluar dari area kartu.
  >> SnackBar: Digunakan untuk memberikan umpan balik kepada pengguna ketika suatu kartu ditekan. SnackBar muncul di bagian bawah layar untuk sementara waktu, menampilkan pesan yang sesuai dengan tombol yang ditekan.
  >> Card: Widget dasar yang menampilkan elemen dengan bayangan (elevasi) agar tampak mengambang. Digunakan di InfoCard untuk menampilkan informasi pengguna dalam format kartu yang rapi.
  >> Icon: Menyediakan ikon untuk setiap item di dalam HoverableItemCard, membuat tampilan aplikasi lebih intuitif. Ikon ini juga membantu pengguna mengenali fungsi setiap kartu dengan cepat.

3)  Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
  >> setState() digunakan untuk memberi tahu aplikasi bahwa ada perubahan dalam data atau status yang mempengaruhi tampilan widget. Jadi, saat data berubah, tampilan widget akan diperbarui.
Variabel yang berubah: Dalam kode ini, variabel yang berubah adalah isHovered, yang menunjukkan apakah mouse sedang berada di atas item atau tidak. Ketika status ini berubah, kita memanggil setState() untuk memperbarui tampilan widget.

4) Jelaskan perbedaan antara const dengan final.
  >> const: Digunakan untuk nilai yang tidak bisa berubah dan sudah diketahui saat aplikasi dijalankan. Misalnya, teks "Welcome to Alatas Survival" yang tidak akan berubah.
  >> final: Digunakan untuk variabel yang hanya bisa diberi nilai satu kali, tetapi nilai tersebut bisa ditentukan saat aplikasi sedang berjalan. Misalnya, npm yang diset saat aplikasi dijalankan.


Bagaimana cara mengimplementasikan checklist-checklist di atas:

Berikut adalah langkah-langkah yang telah dilakukan dalam membangun aplikasi ini:
1) Menjalankan perintah flutter create alatas_survival untuk membuat direktori proyek baru dengan nama alatas_survival.
2) Membuat file .dart di dalam folder alatas_survival/lib guna mengelola tampilan. Struktur file dipisahkan menjadi main.dart untuk tampilan utama dan menu.dart untuk menu interaksi.
3) Untuk menampilkan informasi pengguna seperti NPM, nama, dan kelas, saya menggunakan widget InfoCard, yang bersifat statis. Sementara itu, widget HoverableItemCard digunakan untuk menampilkan item yang berubah tampilan saat mouse berada di atasnya.
4) Membuat button pada halaman utama menggunakan widget InkWell, yang membungkus konten card agar dapat menerima interaksi klik dan snackbar "Kamu telah menekan..."
5) Desain warna mengikuti tema biru, cyan, dan lightBlue sesuai template, guna menciptakan nuansa visual yang konsisten.
6) Menerapkan efek "card mengambang" yang memperbesar tampilan saat ada mouse di atasnya, memberikan kesan interaktif pada item.
7) Menyesuaikan ikon pada card dan mengimpor font Cardo sebagai font utama aplikasi untuk memperkuat gaya visual.
