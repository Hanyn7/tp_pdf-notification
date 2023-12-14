import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PDFViewerExample(),
    );
  }
}

class PDFViewerExample extends StatefulWidget {
  @override
  _PDFViewerExampleState createState() => _PDFViewerExampleState();
}

class _PDFViewerExampleState extends State<PDFViewerExample> {
  String pdfAsset = 'assets/sample.pdf';
  int notificationCount = 0;

  void openPDFViewer() {
    setState(() {
      notificationCount++;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PDFViewerScreen(pdfAsset)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Stack(
                children: <Widget>[
                  Icon(Icons.notifications),
                  if (notificationCount > 0)
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 15,
                          minHeight: 15,
                        ),
                        child: Text(
                          '$notificationCount',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
              onPressed: () {
                openPDFViewer();
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                openPDFViewer();
              },
              child: Text('Open PDF of student'),
            ),
          ],
        ),
      ),
    );
  }
}

class PDFViewerScreen extends StatelessWidget {
  final String pdfAsset;

  PDFViewerScreen(this.pdfAsset);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: PDFView(
        filePath: pdfAsset,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
      ),
    );
  }
}
