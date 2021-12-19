class Character{
  late int charID;
  late String name;
  late String nickName;
  late String image;
  late List<dynamic> jobs;
  late String statusIfDeadOrAlive;
  late List<dynamic> appearanceOfSeasons;
  late String actorName;
  late String categoryForTwoSeries;
  late List<dynamic> betterCallSaulAppearance;

//this method request data from json = API
  Character.fromJson(Map<String , dynamic> json){
    charID = json ['char_id'];
    name = json ['name'];
    nickName = json ['nickname'];
    image = json ['img'];
    jobs = json ['occupation'];
    statusIfDeadOrAlive = json ['status'];
    appearanceOfSeasons =json['appearance'];
    //this main portrayed name of actor
    actorName =json['portrayed'];
    categoryForTwoSeries =json['category'];
    betterCallSaulAppearance =json['better_call_saul_appearance'];
  }
}