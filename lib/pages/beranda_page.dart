import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> pilar = [
      {
        'judul': 'Smart Governance',
        'icon': Icons.account_balance,
        'deskripsi':
            'Pelayanan pemerintahan yang efektif dan transparan.',
      },
      {
        'judul': 'Smart Branding',
        'icon': Icons.campaign,
        'deskripsi':
            'Meningkatkan identitas dan daya tarik Kota Nusantara.',
      },
      {
        'judul': 'Smart Economy',
        'icon': Icons.trending_up,
        'deskripsi':
            'Mendukung pertumbuhan ekonomi dan UMKM masyarakat.',
      },
      {
        'judul': 'Smart Living',
        'icon': Icons.home,
        'deskripsi':
            'Meningkatkan kualitas hidup dan kenyamanan warga.',
      },
      {
        'judul': 'Smart Society',
        'icon': Icons.groups,
        'deskripsi':
            'Membangun masyarakat yang aktif dan terhubung.',
      },
      {
        'judul': 'Smart Environment',
        'icon': Icons.eco,
        'deskripsi':
            'Mewujudkan kota yang bersih dan berkelanjutan.',
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            'Selamat Datang di',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            'Nusantara Cerdas',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Platform layanan digital untuk membantu warga '
            'mengakses berbagai layanan Kota Nusantara.',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 25),

          // Informasi
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_city,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(height: 12),
                Text(
                  'Kota Cerdas untuk Semua',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Nikmati kemudahan layanan publik dalam satu aplikasi.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          const Text(
            'Enam Pilar Smart City',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Membangun kota yang cerdas melalui enam pilar utama.',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 18),

          // Enam pilar
          LayoutBuilder(
            builder: (context, constraints) {
              final int jumlahKolom =
                  constraints.maxWidth >= 700 ? 3 : 2;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pilar.length,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: jumlahKolom,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,

                  // Tinggi card dibuat tetap agar teks tidak terpotong
                  mainAxisExtent: 210,
                ),
                itemBuilder: (context, index) {
                  final item = pilar[index];

                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius:
                                  BorderRadius.circular(12),
                            ),
                            child: Icon(
                              item['icon'],
                              color: Colors.blue,
                              size: 28,
                            ),
                          ),

                          const SizedBox(height: 14),

                          Text(
                            item['judul'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            item['deskripsi'],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}