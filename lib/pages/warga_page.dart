import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/favorit_cubit.dart';
import '../cubit/pengajuan_cubit.dart';
import '../cubit/theme_cubit.dart';

class WargaPage extends StatelessWidget {
  const WargaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Warga'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Informasi profil
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 32,
                    child: Icon(Icons.person, size: 36),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Haikal Dwi Anggara',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text('Pengguna Aplikasi'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Ringkasan pengajuan
          Card(
            child: ListTile(
              leading: const Icon(Icons.assignment_outlined),
              title: const Text('Total Pengajuan'),
              subtitle: const Text(
                'Jumlah layanan yang sudah diajukan',
              ),
              trailing: BlocSelector<PengajuanCubit, List<String>, int>(
                selector: (daftar) => daftar.length,
                builder: (context, total) {
                  return CircleAvatar(
                    child: Text('$total'),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Pengaturan tema
          Text(
            'Pengaturan Tampilan',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),

          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              final isDark = themeMode == ThemeMode.dark;

              return Card(
                child: SwitchListTile(
                  secondary: Icon(
                    isDark ? Icons.dark_mode : Icons.light_mode,
                  ),
                  title: const Text('Mode Gelap'),
                  subtitle: Text(
                    isDark
                        ? 'Tema gelap sedang aktif'
                        : 'Tema terang sedang aktif',
                  ),
                  value: isDark,
                  onChanged: (value) {
                    context.read<ThemeCubit>().setTheme(
                          value ? ThemeMode.dark : ThemeMode.light,
                        );
                  },
                ),
              );
            },
          ),

          const SizedBox(height: 24),

          // Daftar favorit
          Text(
            'Layanan Favorit',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),

          BlocBuilder<FavoritCubit, Set<String>>(
            builder: (context, daftarFavorit) {
              if (daftarFavorit.isEmpty) {
                return const Card(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Icon(
                          Icons.star_border,
                          size: 42,
                        ),
                        SizedBox(height: 8),
                        Text('Belum ada layanan favorit.'),
                        SizedBox(height: 4),
                        Text(
                          'Buka halaman Layanan dan tekan ikon bintang.',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }

              return Column(
                children: daftarFavorit.map((namaLayanan) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      title: Text(namaLayanan),
                      trailing: IconButton(
                        tooltip: 'Hapus dari favorit',
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          context
                              .read<FavoritCubit>()
                              .batalTandai(namaLayanan);
                        },
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
