# Aplikasi Mobile NewCity

NewCity adalah aplikasi mobile berbasis Flutter yang dirancang untuk pelaporan warga dan penyebaran informasi, memungkinkan pengguna untuk melaporkan masalah, tetap terinformasi tentang berita lokal, dan berinteraksi dengan komunitas serta pemerintah Bandung.

## Features

- **Pelaporan Warga**:
  - Membuat dan mengirimkan laporan dengan gambar.
  - Melihat daftar semua laporan.
  - Mencari laporan spesifik.
  - Menyukai, menandai (bookmark), dan mengomentari laporan.
- **Berita dan Informasi**:
  - Melihat feed artikel berita.
  - Menyaring berita berdasarkan topik.
- **Profil Pengguna**:
  - Mengelola informasi profil pengguna.
  - Melihat daftar laporan yang dibuat oleh pengguna.
  - Melihat daftar laporan yang disukai.
- **Notifikasi**: Menerima notifikasi untuk pembaruan laporan dan aktivitas lainnya.
- **Portal Pemerintah**: Antarmuka khusus untuk pengguna pemerintah guna melihat dan mengelola laporan.

## Screenshots

<p>
<img src="https://github.com/user-attachments/assets/bcf3c17a-6b05-47e7-a637-1423a3cdab19" alt="Splash View" width="200">
<img src="https://github.com/user-attachments/assets/99632c04-08e1-48d2-9267-831d3be823f5" alt="Login" width="200">
<img src="https://github.com/user-attachments/assets/9335e260-84dc-4990-bd40-b052299f1861" alt="Dashboard" width="200">
<img src="https://github.com/user-attachments/assets/3ac960e8-103b-4efe-9cda-b635d277640f" alt="List Laporan" width="200">
<img src="https://github.com/user-attachments/assets/443d461b-9209-4246-9599-a1b3412abf9d" alt="Cari Laporan" width="200">
<img src="https://github.com/user-attachments/assets/181ad781-c9f1-4cc2-96f9-58c0d78b5614" alt="Buat Laporan" width="200">
<img src="https://github.com/user-attachments/assets/9c4acb0d-be96-4221-8b80-ea39fd4a6a28" alt="Bookmark Laporan" width="200">
<img src="https://github.com/user-attachments/assets/43d01823-e3cc-4e17-aae4-da3aa8c1c971" alt="List Berita" width="200">
<img src="https://github.com/user-attachments/assets/4b2b2211-23b2-4d8a-aa01-4cd68d3ca7ad" alt="Biodata" width="200">
<img src="https://github.com/user-attachments/assets/832e0567-31aa-4e64-95c6-62f87827d802" alt="FAQ" width="200">
</p>

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK

### Installation

1.  Salin (clone) repositori:
    ```sh
    git clone https://github.com/proting-newcity/NewCity-Mobile-FE.git
    ```
2.  Masuk ke direktori proyek:
    ```sh
    cd NewCity-Mobile-FE
    ```
3.  Instal dependensi:
    ```sh
    flutter pub get
    ```
4.  Jalankan aplikasi:
    ```sh
    flutter run
    ```

## Project Structure

Proyek ini mengikuti struktur modular yang terorganisir sebagai berikut:

- `lib/`
  - `app/`: Berisi logika inti aplikasi, dibagi menjadi modul, rute, dan binding.
    - `modules/`: Setiap fitur (misalnya, `beranda`, `login`, `create_laporan`) memiliki modulnya sendiri dengan `view`, `controller`, dan `binding`.
    - `routes/`: Mendefinisikan rute navigasi aplikasi.
  - `models/`: Mendefinisikan model data untuk aplikasi (misalnya, `Berita`, `Report`, `User`).
  - `services/`: Menangani panggilan API dan layanan eksternal lainnya (misalnya, `auth_service`, `report_service`).
  - `themes/`: Berisi tema aplikasi, warna, dan gaya teks.
  - `widgets/`: Berisi widget yang dapat digunakan kembali di seluruh aplikasi.
- `assets/`: Berisi aset statis seperti gambar dan font.

## Dependencies

Proyek ini menggunakan beberapa dependensi utama:

- **get**: Untuk manajemen state, dependency injection, dan navigasi.
- **dio**: Untuk membuat HTTP call ke API.
- **image_picker**: Untuk memilih gambar dari kamera atau galeri.
- **awesome_notifications**: Untuk membuat dan mengelola notifikasi lokal.
- **motion_tab_bar**: Untuk NavBar.
- **pinput**: Untuk membuat input OTP.

Untuk daftar lengkap dependensi, lihat file `pubspec.yaml`.

## API Services

Aplikasi ini berinteraksi dengan API backend melalui serangkaian layanan yang didefinisikan dalam direktori `lib/services/`:

- **`auth_service.dart`**: Menangani autentikasi pengguna, termasuk login, logout, registrasi, dan manajemen kata sandi.
- **`berita_service.dart`**: Mengambil artikel berita dan kategori berita dari API.
- **`report_service.dart`**: Mengelola semua panggilan API terkait laporan, termasuk membuat, mengambil, menyukai, dan menandai laporan.
- **`user_service.dart`**: Menangani data terkait pengguna, seperti mengambil profil pengguna dan notifikasi.
- **`image_service.dart`**: Layanan utilitas untuk memuat dan menangani gambar dari jaringan.
- **`dio_client.dart`**: Klien Dio terpusat untuk membuat permintaan HTTP, dengan manajemen token bawaan.

Untuk lebih lanjut dapat melihat di repository backend di https://github.com/proting-newcity/NewCity-BE.
