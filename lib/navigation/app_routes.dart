import 'package:flutter/material.dart';
import '../pages/layanan_page.dart';
import '../pages/detail_layanan_page.dart';
import '../pages/warga_page.dart';
import '../pages/riwayat_laporan_page.dart';
import '../pages/pengaturan_kota_page.dart';
import '../pages/tentang_aplikasi_page.dart';
import '../pages/route_tidak_dikenal_page.dart';
import 'kerangka_navigasi.dart';

class AppRoutes {
  // Nama-nama route.
  static const String beranda = '/';
  static const String layanan = '/layanan';
  static const String detailLayanan = '/detail-layanan';
  static const String warga = '/warga';
  static const String riwayatLaporan = '/riwayat-laporan';
  static const String pengaturanKota = '/pengaturan-kota';
  static const String tentangAplikasi = '/tentang-aplikasi';
  // Daftar route.
  static Map<String, WidgetBuilder> daftarRoute() {
    return {
      beranda: (context) => const KerangkaNavigasi(),
      layanan: (context) => const LayananPage(),
      warga: (context) => const WargaPage(),
      riwayatLaporan: (context) => const RiwayatLaporanPage(),
      pengaturanKota: (context) => const PengaturanKotaPage(),
      tentangAplikasi: (context) => const TentangAplikasiPage(),
    };
  }
  // Route yang membutuhkan arguments.
  static Route<dynamic>? bentukRoute(RouteSettings settings) {
    switch (settings.name) {
      case detailLayanan:
        final arguments = settings.arguments;

        if (arguments is! Map<String, String>) {
          return MaterialPageRoute(
            builder: (context) => const RouteTidakDikenalPage(),
          );
        }
        return MaterialPageRoute(
          builder: (context) {
            return DetailLayananPage(
              layanan: arguments,
            );
          },
        );

      default:
        return null;
    }
  }
  // Route jika nama route tidak ditemukan.
  static Route<dynamic> routeTidakDikenal(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        return const RouteTidakDikenalPage();
      },
    );
  }
}
