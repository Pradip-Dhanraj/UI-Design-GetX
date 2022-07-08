class UserFeelingModel {
  String? status;
  Data? data;

  UserFeelingModel({this.status, this.data});

  UserFeelingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  FeelingPercentage? feelingPercentage;
  List<FeelingList>? feelingList;
  List<VideoArr>? videoArr;

  Data({this.feelingPercentage, this.feelingList, this.videoArr});

  Data.fromJson(Map<String, dynamic> json) {
    feelingPercentage = json['feeling_percentage'] != null
        ? new FeelingPercentage.fromJson(json['feeling_percentage'])
        : null;
    if (json['feeling_list'] != null) {
      feelingList = <FeelingList>[];
      json['feeling_list'].forEach((v) {
        feelingList!.add(new FeelingList.fromJson(v));
      });
    }
    if (json['video_arr'] != null) {
      videoArr = <VideoArr>[];
      json['video_arr'].forEach((v) {
        videoArr!.add(new VideoArr.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.feelingPercentage != null) {
      data['feeling_percentage'] = this.feelingPercentage!.toJson();
    }
    if (this.feelingList != null) {
      data['feeling_list'] = this.feelingList!.map((v) => v.toJson()).toList();
    }
    if (this.videoArr != null) {
      data['video_arr'] = this.videoArr!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FeelingPercentage {
  String? happy;
  String? sad;
  String? energetic;
  String? calm;
  String? angry;
  String? bored;

  FeelingPercentage(
      {this.happy,
      this.sad,
      this.energetic,
      this.calm,
      this.angry,
      this.bored});

  FeelingPercentage.fromJson(Map<String, dynamic> json) {
    happy = json['Happy'];
    sad = json['Sad'];
    energetic = json['Energetic'];
    calm = json['Calm'];
    angry = json['Angry'];
    bored = json['Bored'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Happy'] = this.happy;
    data['Sad'] = this.sad;
    data['Energetic'] = this.energetic;
    data['Calm'] = this.calm;
    data['Angry'] = this.angry;
    data['Bored'] = this.bored;
    return data;
  }
}

class FeelingList {
  String? userFeelingId;
  String? feelingId;
  String? feelingName;
  String? submitTime;

  FeelingList(
      {this.userFeelingId, this.feelingId, this.feelingName, this.submitTime});

  FeelingList.fromJson(Map<String, dynamic> json) {
    userFeelingId = json['user_feeling_id'];
    feelingId = json['feeling_id'];
    feelingName = json['feeling_name'];
    submitTime = json['submit_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_feeling_id'] = this.userFeelingId;
    data['feeling_id'] = this.feelingId;
    data['feeling_name'] = this.feelingName;
    data['submit_time'] = this.submitTime;
    return data;
  }
}

class VideoArr {
  String? title;
  String? description;
  String? youtubeUrl;

  VideoArr({this.title, this.description, this.youtubeUrl});

  VideoArr.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    youtubeUrl = json['youtube_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['youtube_url'] = this.youtubeUrl;
    return data;
  }
}
