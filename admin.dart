  //사용자가 요청한 알림을 수신하는 admin APP
  
  String _homeScreenText = "Waiting for token...";
  String _messageText = "Waiting for message...";

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();

    _firebaseMessaging.getToken()
      .then((String token) {

    setState(() {
      _homeScreenText = token;
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        Vibration.vibrate(duration: 1000, amplitude: 128);
        setState(() {
          _messageText = "Push Messaging message: $message";
        });
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        Vibration.vibrate(duration: 1000, amplitude: 128);
        setState(() {
          _messageText = "Push Messaging message: $message";
        });
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        Vibration.vibrate(duration: 1000, amplitude: 128);
        setState(() {
          _messageText = "Push Messaging message: $message";
        });
        print("onResume: $message");
      },
    );

    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true)
    );

    _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
      Vibration.vibrate(duration: 1000, amplitude: 128);
      print("Settings registered: $settings");
    });

      setState(() {
        print("토큰 /*/************//// ${_homeScreenText.toString()}");
      });

    });
  }
