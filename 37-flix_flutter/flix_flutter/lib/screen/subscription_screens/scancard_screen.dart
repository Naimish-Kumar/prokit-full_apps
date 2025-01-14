import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/utils/common_widgets.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ScanCard extends StatefulWidget {
  State<ScanCard> createState() => ScanCardState();
}

class ScanCardState extends State<ScanCard> {
  CameraController? cameraController;

  void initState() {
    super.initState();
    OpenCamera();
  }

  OpenCamera() async {
    final cameras = await availableCameras();
    final firstCam = cameras.first;
    if (cameras != null) {
      cameraController = CameraController(firstCam, ResolutionPreset.max);
      cameraController!.initialize().then((value) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      print("camera not found");
    }
  }

  @override
  void dispose() {
    cameraController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? url;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          cameraController == null
              ? Center(
                  child: Text("Loading Camera..."),
                )
              : !cameraController!.value.isInitialized
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : CameraPreview(cameraController!),
          Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 64,
                ),
                Text('Scan Your Card', style: boldTextStyle(fontSize: 24), textAlign: TextAlign.center),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Place your card in the middle of the rectangle.',
                        style: secondaryTextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {},
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width - 64,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.red),
                borderRadius: BorderRadius.circular(8),
              ),
              child: url != null
                  ? Image.file(
                      File(url),
                      fit: BoxFit.contain,
                    )
                  : Container(),
            ),
          ),
          Positioned(
            top: 40,
            left: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back_ios_rounded,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.camera,
          size: 22,
        ),
        onPressed: () async {
          final path = join((await getTemporaryDirectory()).path, '${DateTime.now()}.png');
          await cameraController!.takePicture().then(
                (res) => {
                  url = path,
                  setState(() {}),
                },
              );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
