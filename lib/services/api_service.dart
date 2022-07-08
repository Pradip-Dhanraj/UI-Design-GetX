import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:qubehealth/models/feelings_model.dart';
import 'package:qubehealth/models/feelings_model.dart';
import 'package:qubehealth/models/user_feeeling_model.dart';

class ApiService {
  Future<UserFeelingModel> getUserFeelings() async {
    Map postMapData = {"user_id": "3206161992", "feeling_date": "15-04-2022"};
    String payload = json.encode(postMapData);
    var url = Uri.https("www.qubehealth.com",
        "/qube_services/api/testservice/getListOfUserFeeling");
    final http.Response response = await http.post(
      url,
      headers: {
        "Accept": "application/json",
        "X-Api-Key": "f6d646a6c2f2df883ea0cccaa4097358ede98284",
      },
      body: payload,
    );
    if (response.statusCode == 200) {
      return UserFeelingModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load themes');
    }
  }

  Future<List<Feelings>> getFeelingPercentage() async {
    await Future.delayed(
      const Duration(
        milliseconds: 600,
      ),
    );
    List<Feelings> feelings = [];
    feelings.add(Feelings(percentage: 30, label: "Energetic", icon: "⚡️️"));
    feelings.add(Feelings(percentage: 10, label: "Sad", icon: "️😪"));
    feelings.add(Feelings(percentage: 40, label: "Happy", icon: "😄️️"));
    feelings.add(Feelings(percentage: 1, label: "Angry", icon: "😡️️"));
    feelings.add(Feelings(percentage: 0, label: "Calm", icon: "🍃️"));
    feelings.add(Feelings(percentage: 0, label: "Bored", icon: "😐️️"));
    feelings.add(Feelings(percentage: 0, label: "Love", icon: "🥰️️"));
    return feelings;
  }

  Future<List<Feelings>> getSchedule() async {
    await Future.delayed(
      const Duration(
        milliseconds: 600,
      ),
    );
    List<Feelings> feelings = [];
    feelings.add(Feelings(percentage: 0, label: "9AM-12PM", icon: "🥰️️ Love"));
    feelings.add(Feelings(percentage: 0, label: "1PM-4PM", icon: "😡️️ Angry"));
    feelings.add(Feelings(percentage: 0, label: "4PM-6PM", icon: "😡️️ Angry"));
    return feelings;
  }

  String weekString(int weekday) {
    switch (weekday) {
      case 7:
        return "Su";
      case 1:
        return "Mo";
      case 2:
        return "Tu";
      case 3:
        return "We";
      case 4:
        return "Th";
      case 5:
        return "Fr";
      case 6:
        return "Sa";

      default:
        return "";
    }
  }

  Future<List<String>> getCalendar(int noDays) async {
    await Future.delayed(
      const Duration(
        milliseconds: 600,
      ),
    );
    List<String> days = [];
    return List<String>.generate(noDays, (i) {
      var day = DateTime.now().add(Duration(days: i));
      return '${weekString(day.weekday)}\n ${day.day}';
    });
  }
}
