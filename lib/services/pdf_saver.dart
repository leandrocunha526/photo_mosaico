import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';

class PDFSaver {
  static Future<String> saveMosaicAsPDF(Uint8List imageBytes) async {
    final pdf = pw.Document();
    final pdfImage = pw.MemoryImage(imageBytes);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) => pw.Center(child: pw.Image(pdfImage)),
      ),
    );

    final dir = await getApplicationDocumentsDirectory();
    final path = '${dir.path}/mosaico_${DateTime.now().millisecondsSinceEpoch}.pdf';
    final file = File(path);

    await file.writeAsBytes(await pdf.save());
    return path;
  }
}
