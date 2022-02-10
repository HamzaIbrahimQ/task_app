import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:connectivity/connectivity.dart';
import 'package:task_app/constants/constatnts.dart';



mixin Utility {
  Future showDialogSheet(BuildContext context, Widget child,
      {bool? isDismissible}) {
    return showModalBottomSheet<void>(
        context: context,
        enableDrag: isDismissible ?? true,
        isDismissible: isDismissible ?? true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        isScrollControlled: false,
        builder: (BuildContext context) {
          return Wrap(children: [child]);
        });
  }

  double getFontSize(int dp, BuildContext context) {
    if (dp == 1) {
      return (MediaQuery.of(context).size.width * 0.02);
    } else if (dp == 2) {
      return (MediaQuery.of(context).size.width * 0.03);
    } else if (dp == 3) {
      return (MediaQuery.of(context).size.width * 0.035);
    } else if (dp == 4) {
      return (MediaQuery.of(context).size.width * 0.04);
    } else if (dp == 5) {
      return (MediaQuery.of(context).size.width * 0.05);
    } else if (dp == 6) {
      return (MediaQuery.of(context).size.width * 0.055);
    } else {
      return (MediaQuery.of(context).size.width * 0.035);
    }
  }

  final BorderRadius borderRadius = const BorderRadius.only(
      topRight: Radius.circular(15),
      topLeft: Radius.circular(15),
      bottomRight: Radius.circular(15),
      bottomLeft: Radius.circular(15));

  final OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
    borderSide:
        BorderSide(color: Colors.grey, width: 0.5, style: BorderStyle.solid),
    borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
        bottomLeft: Radius.circular(20)),
  );

  showToast(
      {required BuildContext context,
      required String msg,
      required bool state}) {
    FToast fToast = FToast();
    fToast.removeCustomToast();
    fToast.init(context);
    fToast.showToast(
        child: Container(
            decoration: BoxDecoration(
                color: state ? Colors.green : Colors.red,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            padding: const EdgeInsets.all(8),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Icon(
                    state ? Icons.check_circle_outline : Icons.error,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Text(
                    msg,
                    style: const TextStyle(color: Colors.white),
                  )),
                ],
              ),
            )),
        toastDuration: const Duration(seconds: 2),
        gravity: ToastGravity.BOTTOM);
  }

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // connected
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      // not connected
      return false;
    } else {
      return false;
    }
  }

  AppBar getAppBar({String? title, required BuildContext context}) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: true,
      centerTitle: true,
      elevation: 0,
      // toolbarHeight: MediaQuery.of(context).size.height / 9,
      toolbarHeight: 130,
      leading: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 16.0,
          top: 16,
        ),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: Image.asset(
            'assets/images/profile.png',
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Padding(
        padding: const EdgeInsetsDirectional.only(top: 8.0),
        child: Column(
          children: [
            Text(
              title ?? "",
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Container(
              width: 172,
              height: 32,
              decoration: BoxDecoration(
                color: greyColor,
                borderRadius: borderRadius,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: secondColor,
                        ),
                        const Text("الرياض شارع الملك", style: TextStyle(fontSize: 12.0, color: Colors.black),),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: borderRadius,
                      color: Colors.grey.withOpacity(0.05),
                    ),
                    child: CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.grey.withOpacity(0.05),
                      child: Center(
                        child: IconButton(
                          alignment: Alignment.center,
                          onPressed: () {},
                          icon: const Icon(Icons.keyboard_arrow_down, size: 20, color: Colors.black,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      titleTextStyle: const TextStyle(fontSize: 24.0),
      actions: const [
        Padding(
          padding: EdgeInsetsDirectional.only(
            end: 16.0,
            top: 16,
          ),
          child: CircleAvatar(
            radius: 20,
            child: Icon(Icons.notifications_outlined, size: 22.0,),
          ),
        ),
      ],
    );
  }

// showAlertDialog(
//     {BuildContext? context,
//       String? title,
//       String? msg,
//       AlertDialogCallBack? listener,
//       String? action}) {
//   showDialog(
//       context: context!,
//       builder: (BuildContext context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20.0)),
//           child: Wrap(
//             children: [
//               Column(
//                 children: [
//                   if (title != null)
//                     Column(children: [
//                       Container(
//                         height: 20,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: getNafithTextView(
//                             title: title,
//                             styleId: 3,
//                             fontSize: 3,
//                             color: Colors.black,
//                             textAlign: TextAlign.center,
//                             context: context),
//                       ),
//                     ]),
//                   Container(
//                     height: 15.0,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: getNafithTextView(
//                         title: msg ?? "",
//                         styleId: 3,
//                         fontSize: 3,
//                         color: Colors.grey[600]!,
//                         textAlign: TextAlign.center,
//                         context: context),
//                   ),
//                   Container(
//                     height: 10,
//                   ),
//                   const Divider(
//                     color: Colors.grey,
//                     thickness: 1.0,
//                   ),
//                   Padding(
//                     padding: const EdgeInsetsDirectional.only(
//                         top: 0, start: 32.0, bottom: 0, end: 32.0),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: <Widget>[
//                           TextButton(
//                             onPressed: () {
//                               listener!
//                                   .onDialogConfirm(context, action ?? "");
//                             },
//                             child: getNafithTextView(
//                                 title: S.of(context).OK,
//                                 color: appGreen01,
//                                 fontSize: 3,
//                                 styleId: 3,
//                                 context: context),
//                           ),
//                           Container(
//                             width: 10,
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               listener!.onDialogCancel(context);
//                             },
//                             child: getNafithTextView(
//                                 title: S.of(context).CANCEL,
//                                 color: appColorPink,
//                                 fontSize: 3,
//                                 styleId: 3,
//                                 context: context),
//                           ),
//                         ]),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       });
// }
//
//
//

}
