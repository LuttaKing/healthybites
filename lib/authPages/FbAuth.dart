
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthybites/Home.dart';
import 'package:healthybites/common/common.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;


String your_client_id = "3127597384034848";
String your_redirect_url ="https://www.facebook.com/connect/login_success.html";



loginWithFacebook(BuildContext context) async{
 // await Firebase.initializeApp();
String result = await Navigator.push(context,
  MaterialPageRoute(
      builder: (context) => CustomWebView(
            selectedUrl:
                'https://www.facebook.com/dialog/oauth?client_id=$your_client_id&redirect_uri=$your_redirect_url&response_type=token&scope=email,public_profile,',
          ),
      maintainState: true),
    
);
  if (result != null) {
  try {
    final facebookAuthCred =FacebookAuthProvider.credential(result);
    final user =await _auth.signInWithCredential(facebookAuthCred);
      tost('Logging you in...');
    print('SUCCESS: $user');
  
  // updateProfile(user.additionalUserInfo.profile['name'],'',user.additionalUserInfo.profile['picture']['data']['url'],context);
    Navigator.push(context,
                               MaterialPageRoute(
                                 builder: (context) => HomePage(),
                               )); 
  } catch (e) {
    print('ERROR: $e');
tost('Error ocuured $e',Colors.red);

  }
}else{
      tost('Error ocuured',Colors.red);
}
}


class CustomWebView extends StatefulWidget {
  final String selectedUrl;

  CustomWebView({this.selectedUrl});

  @override
  _CustomWebViewState createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (url.contains("#access_token")) {
        succeed(url);
      }

      if (url.contains(
          "https://www.facebook.com/connect/login_success.html?error=access_denied&error_code=200&error_description=Permissions+error&error_reason=user_denied")) {
        denied();
      }
    });
  }

  denied() {
    Navigator.pop(context);
  }

  succeed(String url) {
    var params = url.split("access_token=");

    var endparam = params[1].split("&");

    Navigator.pop(context, endparam[0]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: WebviewScaffold(
          url: widget.selectedUrl,
          ),
    );
  }
}