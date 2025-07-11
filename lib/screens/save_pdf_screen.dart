import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

import '../services/pdf_saver.dart';

class SavePdfScreen extends StatelessWidget {
  final Uint8List imageBytes;

  const SavePdfScreen({super.key, required this.imageBytes});

  Future<void> _saveAndOpenPdf(BuildContext context) async {
    try {
      final path = await PDFSaver.saveMosaicAsPDF(imageBytes);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF salvo em: $path')),
      );

      await OpenFile.open(path);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao salvar PDF: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Salvar PDF do Mosaico')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _saveAndOpenPdf(context),
          child: const Text('Salvar e abrir PDF'),
        ),
      ),
    );
  }
}
