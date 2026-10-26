import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/pengajuan_cubit.dart';
import '../pages/beranda_page.dart';
import '../pages/layanan_page.dart';
import '../pages/warga_page.dart';
import 'app_routes.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() =>
      _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  int _index = 0;

  final List<Widget> _halaman = const [
    BerandaPage(),
    LayananPage(),
    WargaPage(),
  ];

  void _ubahHalaman(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double lebarLayar = MediaQuery.of(context).size.width;
    final bool layarLebar = lebarLayar >= 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nusantara Cerdas',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      // Navigation Drawer
      drawer: NavigationDrawer(
        onDestinationSelected: (index) {
          Navigator.pop(context);

          if (index == 0) {
            _ubahHalaman(0);
          } else if (index == 1) {
            _ubahHalaman(1);
          } else if (index == 2) {
            _ubahHalaman(2);
          } else if (index == 3) {
            Navigator.pushNamed(
              context,
              AppRoutes.pengaturanKota,
            );
          } else if (index == 4) {
            Navigator.pushNamed(
              context,
              AppRoutes.tentangAplikasi,
            );
          } else if (index == 5) {
            _tampilkanDialogKeluar(context);
          }
        },
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 20, 16, 12),
            child: Text(
              'Nusantara Cerdas',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: Text('Beranda'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.miscellaneous_services_outlined),
            selectedIcon: Icon(Icons.miscellaneous_services),
            label: Text('Layanan'),
          ),
          NavigationDrawerDestination(
            icon: _ikonWarga(Icons.person_outline),
            selectedIcon: _ikonWarga(Icons.person),
            label: const Text('Warga'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28),
            child: Divider(),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: Text('Pengaturan Kota'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.info_outline),
            selectedIcon: Icon(Icons.info),
            label: Text('Tentang Aplikasi'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.logout),
            selectedIcon: Icon(Icons.logout),
            label: Text('Keluar'),
          ),
        ],
      ),

      // Konten responsif: NavigationRail pada layar lebar
      body: Row(
        children: [
          if (layarLebar)
            NavigationRail(
              selectedIndex: _index,
              onDestinationSelected: _ubahHalaman,
              labelType: NavigationRailLabelType.all,
              destinations: [
                const NavigationRailDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: Text('Beranda'),
                ),
                const NavigationRailDestination(
                  icon: Icon(
                    Icons.miscellaneous_services_outlined,
                  ),
                  selectedIcon: Icon(
                    Icons.miscellaneous_services,
                  ),
                  label: Text('Layanan'),
                ),
                NavigationRailDestination(
                  icon: _ikonWarga(Icons.person_outline),
                  selectedIcon: _ikonWarga(Icons.person),
                  label: const Text('Warga'),
                ),
              ],
            ),
          Expanded(
            child: _halaman[_index],
          ),
        ],
      ),

      // NavigationBar pada layar sempit
      bottomNavigationBar: layarLebar
          ? null
          : NavigationBar(
              selectedIndex: _index,
              onDestinationSelected: _ubahHalaman,
              destinations: [
                const NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Beranda',
                ),
                const NavigationDestination(
                  icon: Icon(
                    Icons.miscellaneous_services_outlined,
                  ),
                  selectedIcon: Icon(
                    Icons.miscellaneous_services,
                  ),
                  label: 'Layanan',
                ),
                NavigationDestination(
                  icon: _ikonWarga(Icons.person_outline),
                  selectedIcon: _ikonWarga(Icons.person),
                  label: 'Warga',
                ),
              ],
            ),
    );
  }

  // Badge jumlah pengajuan dengan BlocSelector
  Widget _ikonWarga(IconData icon) {
    return BlocSelector<PengajuanCubit, List<String>, int>(
      selector: (daftarPengajuan) => daftarPengajuan.length,
      builder: (context, totalPengajuan) {
        return Badge(
          isLabelVisible: totalPengajuan > 0,
          label: Text('$totalPengajuan'),
          child: Icon(icon),
        );
      },
    );
  }

  // Dialog keluar
  void _tampilkanDialogKeluar(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Keluar'),
          content: const Text(
            'Apakah Anda yakin ingin keluar dari aplikasi?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Keluar'),
            ),
          ],
        );
      },
    );
  }
}