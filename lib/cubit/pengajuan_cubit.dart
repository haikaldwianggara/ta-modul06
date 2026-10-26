import 'package:flutter_bloc/flutter_bloc.dart';

class PengajuanCubit extends Cubit<List<String>> {
  PengajuanCubit() : super(<String>[]);

  // Menghitung jumlah pengajuan
  int get totalPengajuan => state.length;

  // Menambahkan layanan ke daftar pengajuan
  void tambah(String namaLayanan) {
    emit([...state, namaLayanan]);
  }

  // Menghapus layanan dari daftar pengajuan
  void hapus(String namaLayanan) {
    final daftarBaru = [...state];

    daftarBaru.remove(namaLayanan);

    emit(daftarBaru);
  }

  // Menghapus semua pengajuan
  void kosongkan() {
    emit(<String>[]);
  }
}
