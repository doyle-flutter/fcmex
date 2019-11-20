// 사용자는 admin의 서버에 http 요청을 보내면, 서버에서 admin에게 FCM을 보내도록 함

onTap() async{
  await http.get("Firebase functions를 사용");
  await Firestore.instance.collection('').add(
    {
      "발송하는":"내역을 firebase DB에 저장"
    }
  );
}
