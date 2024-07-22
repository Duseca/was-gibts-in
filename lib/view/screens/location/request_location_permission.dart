import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_images.dart';
import 'package:was_gibts_in/constants/app_styling.dart';
import 'package:was_gibts_in/controller/locationController.dart';
import 'package:was_gibts_in/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:was_gibts_in/view/widget/my_button_widget.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class RequestLocationPermission extends StatefulWidget {
  const RequestLocationPermission({super.key});

  @override
  State<RequestLocationPermission> createState() =>
      _RequestLocationPermissionState();
}

class _RequestLocationPermissionState extends State<RequestLocationPermission> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showModalBottomSheet(
        context: context,
        builder: (_) {
          return _LocationBottomSheet();
        },
        isScrollControlled: true,
        isDismissible: false,
        backgroundColor: Colors.transparent,
        enableDrag: false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                Assets.imagesPermissionsLocation,
              ),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}

class _LocationBottomSheet extends StatefulWidget {
  _LocationBottomSheet();

  @override
  State<_LocationBottomSheet> createState() => _LocationBottomSheetState();
}

class _LocationBottomSheetState extends State<_LocationBottomSheet> {
  bool serviceEnabled = false;

  Future<void> getLocation() async {
    try {
      Location location = Location();
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
      }
    } catch (e) {
      print("not accepted");
    }
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  LocationController controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 217,
      padding: EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 29,
      ),
      decoration: AppStyling.BOTTOM_SHEET_DEC,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText(
            text: 'Location Services',
            size: 18,
            weight: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          MyText(
            paddingTop: 10,
            text:
                'We need to know were you are in order to find what’s near to you.',
            size: 14,
            color: kQuaternaryColor,
            textAlign: TextAlign.center,
            paddingBottom: 24,
          ),
          MyButton(
              buttonText: 'Enable Location Service',
              onTap: () async {
                if (!serviceEnabled) {
                  getLocation();
                } else {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return loadingSpinKit();
                    },
                  );
                  LocationPermission permission =
                      await Geolocator.checkPermission();
                  if (permission == LocationPermission.denied) {
                    permission = await Geolocator.requestPermission();
                    if (permission == LocationPermission.denied) {
                      Get.back();
                      AppSettings.openAppSettings(
                          type: AppSettingsType.location);
                      print("permission denaid");
                      return Future.error("Location Permission is Denied");
                    }
                  }
                  if (permission == LocationPermission.deniedForever) {
                    Get.back();
                    AppSettings.openAppSettings(type: AppSettingsType.location);
                    print("permanently Deleted");
                    return Future.error(
                        "Location Permission is permanently Denied");
                  }
                }
                print("accepted");
                Position position = await Geolocator.getCurrentPosition();
                controller.latitude = position.latitude;
                controller.longitude = position.longitude;
                if(controller.longitude!=null && controller.latitude!=null){
                Get.offAll(() => BottomNavBar(),
                    transition: Transition.rightToLeft,
                    duration: Duration(milliseconds: 400));
                }
              })
        ],
      ),
    );
  }
}

class loadingSpinKit extends StatelessWidget {
  const loadingSpinKit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
       return false;
      },
      child: Center(
        child: SpinKitDoubleBounce(
          color: kSecondaryColor,
          duration: Duration(seconds: 3),
          size: 50,
        ),
      ),
    );
  }
}
