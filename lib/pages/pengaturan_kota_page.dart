import 'package:flutter/material.dart';

class PengaturanKotaPage extends StatefulWidget {
  const PengaturanKotaPage({super.key});

  @override
  State<PengaturanKotaPage> createState() => _PengaturanKotaPageState();
}

class _PengaturanKotaPageState extends State<PengaturanKotaPage> {
  bool notifikasiAktif = true;
  bool lokasiAktif = true;

  String kotaDipilih = 'Kota Nusantara';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pengaturan Kota',
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
            'Pengaturan',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'Atur preferensi layanan dan informasi kota.',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 25),

          // Pilihan kota
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.location_city,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Kota',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  DropdownButtonFormField<String>(
                    initialValue: kotaDipilih,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Pilih Kota',
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'Kota Nusantara',
                        child: Text('Kota Nusantara'),
                      ),
                      DropdownMenuItem(
                        value: 'Bandung',
                        child: Text('Bandung'),
                      ),
                      DropdownMenuItem(
                        value: 'Jakarta',
                        child: Text('Jakarta'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          kotaDipilih = value;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 15),

          // Notifikasi
          Card(
            child: SwitchListTile(
              secondary: const Icon(
                Icons.notifications_outlined,
                color: Colors.blue,
              ),
              title: const Text(
                'Notifikasi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                'Terima informasi terbaru dari layanan kota.',
              ),
              value: notifikasiAktif,
              onChanged: (value) {
                setState(() {
                  notifikasiAktif = value;
                });
              },
            ),
          ),

          const SizedBox(height: 15),

          // Lokasi
          Card(
            child: SwitchListTile(
              secondary: const Icon(
                Icons.location_on_outlined,
                color: Colors.blue,
              ),
              title: const Text(
                'Layanan Lokasi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                'Gunakan lokasi untuk memberikan layanan yang relevan.',
              ),
              value: lokasiAktif,
              onChanged: (value) {
                setState(() {
                  lokasiAktif = value;
                });
              },
            ),
          ),

          const SizedBox(height: 25),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Pengaturan berhasil disimpan.',
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Simpan Pengaturan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}