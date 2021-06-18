import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutterinit/components/plant_alert_dialog.dart';
import 'package:flutterinit/constants.dart';
import 'package:flutterinit/models/requests/plant_image_request.dart';
import 'package:flutterinit/models/responses/plant_image_response.dart';
import 'package:flutterinit/services/plant_service.dart';

class CameraPage extends StatefulWidget {
  final CameraDescription camera;

  CameraPage({required this.camera});

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    Loader.hide();
    super.dispose();
  }

  void takePicture() async {
    List<PlantResults> listOfPlantResults = [];
    Loader.show(context, progressIndicator: CircularProgressIndicator());

    // Take the Picture in a try / catch block. If anything goes wrong,
    // catch the error.
    try {
      // Ensure that the camera is initialized.
      await _initializeControllerFuture;

      // Attempt to take a picture and get the file `image`
      // where it was saved.
      final image = await _controller.takePicture();

      PlantService plantService = PlantService();
      PlantImageRequest request = PlantImageRequest(plantImage: image);
      PlantImageResponse response = await plantService.getPlantResults(request);

      // Filters out plant names that have the exact same name
      listOfPlantResults = response.results;
      var plantNames = listOfPlantResults.map((e) => e.species.genus.scientificNameWithoutAuthor).toSet();
      listOfPlantResults.retainWhere((element) => plantNames.remove(element.species.genus.scientificNameWithoutAuthor));
    } catch (e) {
      print(e);
    }

    Loader.hide();

    showDialog(
      context: context,
      builder: (context) {
        return PlantAlertDialog(
          listOfPlantResults: listOfPlantResults,
        );
      },
    );
  }

  void onBackButtonPressed() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  BackButton(
                    onPressed: this.onBackButtonPressed,
                  ),
                  Text(
                    'Scan Plants',
                    style: const TextStyle(
                      fontSize: 34.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 11,
              ),
            ],
          ),
        ),
      ),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            final scale = 1 / (_controller.value.aspectRatio * MediaQuery.of(context).size.aspectRatio);
            return Transform.scale(
              scale: scale,
              alignment: Alignment.topCenter,
              child: CameraPreview(_controller),
            );
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: takePicture,
        child: const Icon(Icons.camera_alt),
        backgroundColor: CustomColorScheme.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
