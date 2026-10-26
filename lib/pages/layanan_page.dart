import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/favorit_cubit.dart';
import '../navigation/app_routes.dart';

class LayananPage extends StatefulWidget {
  const LayananPage({super.key});

  @override
  State<LayananPage> createState() => _LayananPageState();
}

class _LayananPageState extends State<LayananPage> {
  String kategoriTerpilih = 'Semua';

  final List<Map<String, dynamic>> daftarLayanan = [
    {
      'nama': 'KTP Elektronik',
      'kategori': 'Perizinan',
      'deskripsi': 'Pengajuan dan pengurusan KTP elektronik.',
      'ikon': Icons.badge_outlined,
    },
    {
      'nama': 'Kartu Keluarga',
      'kategori': 'Perizinan',
      'deskripsi': 'Pengurusan dan perubahan data kartu keluarga.',
      'ikon': Icons.family_restroom,
    },
    {
      'nama': 'Surat Keterangan Domisili',
      'kategori': 'Perizinan',
      'deskripsi': 'Permohonan surat keterangan domisili.',
      'ikon': Icons.description_outlined,
    },
    {
      'nama': 'Layanan Puskesmas',
      'kategori': 'Kesehatan',
      'deskripsi': 'Informasi dan akses layanan kesehatan warga.',
      'ikon': Icons.local_hospital_outlined,
    },
    {
      'nama': 'Jadwal Imunisasi',
      'kategori': 'Kesehatan',
      'deskripsi': 'Informasi jadwal imunisasi masyarakat.',
      'ikon': Icons.vaccines_outlined,
    },
    {
      'nama': 'Transportasi Umum',
      'kategori': 'Transportasi',
      'deskripsi': 'Informasi layanan transportasi umum.',
      'ikon': Icons.directions_bus_outlined,
    },
  ];

  final List<String> daftarKategori = [
    'Semua',
    'Perizinan',
    'Kesehatan',
    'Transportasi',
  ];

  void bukaDetailLayanan(Map<String, dynamic> layanan) {
    Navigator.pushNamed(
      context,
      AppRoutes.detailLayanan,
      arguments: <String, String>{
        'nama': layanan['nama'] as String,
        'kategori': layanan['kategori'] as String,
        'deskripsi': layanan['deskripsi'] as String,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final layananDitampilkan = daftarLayanan.where((layanan) {
      return kategoriTerpilih == 'Semua' ||
          layanan['kategori'] == kategoriTerpilih;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Layanan Warga'),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Temukan Layanan',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Pilih layanan yang kamu butuhkan.'),
          ),
          const SizedBox(height: 16),

          // Filter kategori.
          SizedBox(
            height: 44,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: daftarKategori.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final kategori = daftarKategori[index];
                final terpilih = kategori == kategoriTerpilih;

                return ChoiceChip(
                  label: Text(kategori),
                  selected: terpilih,
                  onSelected: (selected) {
                    if (!selected) return;

                    setState(() {
                      kategoriTerpilih = kategori;
                    });
                  },
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          // Daftar kartu layanan.
          Expanded(
            child: layananDitampilkan.isEmpty
                ? const Center(
                    child: Text(
                      'Tidak ada layanan pada kategori ini.',
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: layananDitampilkan.length,
                    itemBuilder: (context, index) {
                      final layanan = layananDitampilkan[index];
                      final nama = layanan['nama'] as String;
                      final kategori = layanan['kategori'] as String;
                      final deskripsi = layanan['deskripsi'] as String;
                      final ikon = layanan['ikon'] as IconData;

                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        clipBehavior: Clip.antiAlias,
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          leading: CircleAvatar(
                            child: Icon(ikon),
                          ),
                          title: Text(
                            nama,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(kategori),
                                const SizedBox(height: 4),
                                Text(deskripsi),
                              ],
                            ),
                          ),

                          // Favorit menggunakan FavoritCubit.
                          trailing: BlocBuilder<FavoritCubit, Set<String>>(
                            builder: (context, daftarFavorit) {
                              final isFavorit =
                                  daftarFavorit.contains(nama);

                              return IconButton(
                                tooltip: isFavorit
                                    ? 'Hapus dari favorit'
                                    : 'Tambahkan ke favorit',
                                icon: Icon(
                                  isFavorit
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: isFavorit ? Colors.amber : null,
                                ),
                                onPressed: () {
                                  context
                                      .read<FavoritCubit>()
                                      .toggleFavorit(nama);
                                },
                              );
                            },
                          ),

                          // Buka detail melalui AppRoutes.
                          onTap: () => bukaDetailLayanan(layanan),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
