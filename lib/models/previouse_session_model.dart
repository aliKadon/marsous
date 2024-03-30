import 'package:marsous/models/session_model.dart';

class PreviousSessionModel {
  List<SessionModel>? old;
  SessionModel? upcomming;

  PreviousSessionModel({
    this.old,
    this.upcomming,
  });

  factory PreviousSessionModel.fromJson(Map<String, dynamic> json) =>
      PreviousSessionModel(
        old: List<SessionModel>.from(
          json["old"].map(
            (x) => SessionModel.fromJson(x),
          ),
        ),
        upcomming: SessionModel.fromJson(json["upcomming"])
      );
}
