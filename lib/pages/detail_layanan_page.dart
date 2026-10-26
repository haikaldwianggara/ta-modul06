import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/pengajuan_cubit.dart';

class DetailLayananPage extends StatefulWidget {
  final Map<String, String> layanan;

  const DetailLayananPage({
    super.key,
    required this.layanan,
  });

  @override
  State<DetailLayananPage> createState() =>
      _DetailLayananPageState();
}

class _DetailLayananPageState extends State<DetailLayananPage> {
  bool sedangMemuat = false;

  String get namaLayanan =>
      widget.layanan['nama'] ??
      widget.layanan['namaLayanan'] ??
      'Layanan';

  String get kategori =>
      widget.layanan['kategori'] ?? 'Umum';

  String get deskripsi =>
      widget.layanan['deskripsi'] ??
      'Informasi deskripsi layanan belum tersedia.';

  Future<void> ajukanPermohonan() async {
    if (sedangMemuat) return;

    setState(() {
      sedangMemuat = true;
    });

    // Simulasi proses pengajuan.
    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    // Simpan pengajuan menggunakan PengajuanCubit.
    context.read<PengajuanCubit>().tambah(namaLayanan);

    // Kembali ke halaman sebelumnya dan kirim hasil.
    Navigator.pop(context, namaLayanan);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Layanan'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 42,
                backgroundColor:
                    Theme.of(context).colorScheme.primaryContainer,
                child: Icon(
                  Icons.description_outlined,
                  size: 42,
                  color:
                      Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              namaLayanan,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 8),

            Chip(
              label: Text(kategori),
            ),

            const SizedBox(height: 16),

            Text(
              'Deskripsi Layanan',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 8),

            Text(
              deskripsi,
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(height: 24),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.info_outline),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Pastikan layanan yang dipilih sudah sesuai '
                        'sebelum mengajukan permohonan.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed:
                    sedangMemuat ? null : ajukanPermohonan,
                icon: sedangMemuat
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : const Icon(Icons.send),
                label: Text(
                  sedangMemuat
                      ? 'Memproses Pengajuan...'
                      : 'Ajukan Permohonan',
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
