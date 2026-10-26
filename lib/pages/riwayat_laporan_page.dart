import 'package:flutter/material.dart';

class RiwayatLaporanPage extends StatelessWidget {
  const RiwayatLaporanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat Laporan',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Laporan Saya',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'Daftar laporan yang pernah Anda kirimkan.',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 20),

          _kartuLaporan(
            context,
            judul: 'Lampu Jalan Mati',
            lokasi: 'Jl. Nusantara No. 10',
            tanggal: '20 September 2026',
            status: 'Diproses',
            warna: Colors.orange,
            icon: Icons.lightbulb_outline,
          ),

          _kartuLaporan(
            context,
            judul: 'Sampah Menumpuk',
            lokasi: 'Kawasan Pusat Kota',
            tanggal: '18 September 2026',
            status: 'Selesai',
            warna: Colors.green,
            icon: Icons.delete_outline,
          ),

          _kartuLaporan(
            context,
            judul: 'Jalan Rusak',
            lokasi: 'Jl. Merdeka',
            tanggal: '15 September 2026',
            status: 'Menunggu',
            warna: Colors.blue,
            icon: Icons.warning_amber_outlined,
          ),
        ],
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Form laporan baru akan segera tersedia.',
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),

      // Bottom App Bar
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Menampilkan semua laporan.'),
                    ),
                  );
                },
                icon: const Icon(Icons.list),
                tooltip: 'Semua Laporan',
              ),

              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Menampilkan laporan yang diproses.'),
                    ),
                  );
                },
                icon: const Icon(Icons.pending_actions),
                tooltip: 'Diproses',
              ),

              const SizedBox(width: 45),

              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Menampilkan laporan yang selesai.'),
                    ),
                  );
                },
                icon: const Icon(Icons.check_circle_outline),
                tooltip: 'Selesai',
              ),

              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Memperbarui data laporan.'),
                    ),
                  );
                },
                icon: const Icon(Icons.refresh),
                tooltip: 'Refresh',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _kartuLaporan(
    BuildContext context, {
    required String judul,
    required String lokasi,
    required String tanggal,
    required String status,
    required Color warna,
    required IconData icon,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: warna.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: warna,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    judul,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    lokasi,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    tanggal,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: warna.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        color: warna,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}