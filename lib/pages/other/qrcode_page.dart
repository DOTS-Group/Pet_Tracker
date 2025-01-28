import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:pet_tracker/widgets/other/petselected_widget.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:share_plus/share_plus.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Örnek veriler (gerçek uygulamada bu veriler provider'dan gelecek)
    final Map<String, dynamic> petData = {
      'userId': 'user123',
      'petId': 'pet456',
      'petName': 'Poyraz',
      'breed': 'Rottweiler',
      'age': '2',
      'weight': '67',
    };

    // QR kod verisi oluştur
    final String qrData = jsonEncode(petData);
    final qrCode = QrCode.fromData(
      data: qrData,
      errorCorrectLevel: QrErrorCorrectLevel.H,
    );

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(context.tr('qrCode')),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const PetSelectedDropdownButtonWidget(),
            const SizedBox(height: 24),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: PrettyQrView(
                        qrImage: QrImage(qrCode),
                        decoration: PrettyQrDecoration(
                          shape: PrettyQrSmoothSymbol(
                            color: SharedConstants.orangeColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildActionButton(
                          context,
                          Icons.share,
                          context.tr('share'),
                          () => _shareQrCode(context, qrData),
                        ),
                        _buildActionButton(
                          context,
                          Icons.copy,
                          context.tr('copy'),
                          () => _copyQrData(context, qrData),
                        ),
                        _buildActionButton(
                          context,
                          Icons.qr_code_scanner,
                          context.tr('scan'),
                          () => _scanQrCode(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr('petDetails'),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    ...petData.entries.map(
                      (entry) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Text(
                              '${entry.key}:',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 8),
                            Text(entry.value.toString()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _scanQrCode(context),
        backgroundColor: SharedConstants.orangeColor,
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    IconData icon,
    String label,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Icon(icon, color: SharedConstants.orangeColor),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(color: SharedConstants.orangeColor),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _shareQrCode(BuildContext context, String qrData) async {
    await Share.share(
      qrData,
      subject: context.tr('sharePetQrCode'),
    );
  }

  Future<void> _copyQrData(BuildContext context, String qrData) async {
    await Clipboard.setData(ClipboardData(text: qrData));
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.tr('qrCodeCopied'))),
      );
    }
  }

  Future<void> _scanQrCode(BuildContext context) async {
    try {
      // QR kod tarama işlemi burada yapılacak
      // Örnek: mobile_scanner veya qr_code_scanner paketleri kullanılabilir

      // Taranan QR kod verisi ile evcil hayvan bilgileri getirilecek
      // Örnek:
      // final result = await Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const QRViewExample(),
      //   ),
      // );

      // if (result != null) {
      //   final petData = jsonDecode(result);
      //   // Pet verilerini göster
      // }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.tr('scanError'))),
        );
      }
    }
  }
}
