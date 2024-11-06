![image](https://github.com/user-attachments/assets/8e2d09c0-c871-4623-ba79-d40c3bf5712f)# alatas-survival-mobile

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