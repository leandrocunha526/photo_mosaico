import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';

import '../widgets/photo_mosaic.dart';
import 'save_pdf_screen.dart';

class MosaicoScreen extends StatefulWidget {
  const MosaicoScreen({super.key});

  @override
  State<MosaicoScreen> createState() => _MosaicoScreenState();
}

class _MosaicoScreenState extends State<MosaicoScreen> {
  final ScreenshotController screenshotController = ScreenshotController();
  final List<File> _images = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        _images.add(File(photo.path));
      });
    }
  }

  Future<void> _navigateToSavePdfScreen() async {
    Uint8List? imageBytes = await screenshotController.capture();
    if (imageBytes == null || !mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => SavePdfScreen(imageBytes: imageBytes)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mosaico Fotos PDF')),
      body: Column(
        children: [
          Expanded(
            child: PhotoMosaic(
              images: _images,
              screenshotController: screenshotController,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _takePhoto,
                  icon: const Icon(Icons.camera_alt),
                  label: const Text("Tirar Foto"),
                ),
                ElevatedButton.icon(
                  onPressed: _images.isEmpty ? null : _navigateToSavePdfScreen,
                  icon: const Icon(Icons.picture_as_pdf),
                  label: const Text("Salvar em PDF"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
