import 'package:movie_app_clean_architecture/domain/entities/cast_entity.dart';

/// id : 724989
/// cast : [{"adult":false,"gender":2,"id":62,"known_for_department":"Acting","name":"Bruce Willis","original_name":"Bruce Willis","popularity":37.169,"profile_path":"/caX3KtMU42EP3VLRFFBwqIIrch5.jpg","cast_id":1,"character":"Chalmers","credit_id":"5f10be992495ab003535eb26","order":0},{"adult":false,"gender":2,"id":57171,"known_for_department":"Acting","name":"Jesse Metcalfe","original_name":"Jesse Metcalfe","popularity":15.89,"profile_path":"/e2jZd4VcOolxLlASCzWCLtj2LwJ.jpg","cast_id":2,"character":"Miller","credit_id":"5f10bea9688cd0003849b3d2","order":1},{"adult":false,"gender":1,"id":1409052,"known_for_department":"Acting","name":"Natalie Eva Marie","original_name":"Natalie Eva Marie","popularity":4.438,"profile_path":"/qNiwFLNHsZo7sD8whI1YNlw2YVn.jpg","cast_id":3,"character":"Sasha","credit_id":"5f10beb62495ab003336bbc7","order":2},{"adult":false,"gender":1,"id":1798408,"known_for_department":"Acting","name":"Lala Kent","original_name":"Lala Kent","popularity":3.692,"profile_path":"/wZW1eom9Ns0gpdp3SUEDMpbEuZu.jpg","cast_id":4,"character":"Eva Chalmers","credit_id":"5f10bee12495ab003336bbea","order":3},{"adult":false,"gender":2,"id":53185,"known_for_department":"Acting","name":"Texas Battle","original_name":"Texas Battle","popularity":6.306,"profile_path":"/zPzagAtKxbHKrQLAQ69KSYLZxjA.jpg","cast_id":5,"character":"Fox","credit_id":"5f10beee6dea3a0035f1ac02","order":4},{"adult":false,"gender":2,"id":1075049,"known_for_department":"Acting","name":"Swen Temmel","original_name":"Swen Temmel","popularity":2.042,"profile_path":"/z6zLmf3PBsTGMU3RBnguAqfHUn3.jpg","cast_id":6,"character":"Dash Hawkins","credit_id":"5f10bef92495ab003535eb3c","order":5},{"adult":false,"gender":2,"id":2145585,"known_for_department":"Acting","name":"Sergio Rizzuto","original_name":"Sergio Rizzuto","popularity":3.752,"profile_path":"/wlxFO0dEtKAXR8W6fEy7T4u4X0K.jpg","cast_id":7,"character":"The Pardoner","credit_id":"5f10bf032d8ef30036401514","order":6},{"adult":false,"gender":2,"id":1388479,"known_for_department":"Acting","name":"Tyler Jon Olson","original_name":"Tyler Jon Olson","popularity":5.223,"profile_path":"/iNVDnqbElYQ5ISM0va2fTJUJaOx.jpg","cast_id":8,"character":"Lt. Colson","credit_id":"5f10bf0e688cd0003849b422","order":7},{"adult":false,"gender":0,"id":2398098,"known_for_department":"Production","name":"Jon Galanis","original_name":"Jon Galanis","popularity":0.6,"profile_path":null,"cast_id":9,"character":"Harrison Zindel","credit_id":"5f10bf2e1684f700359ecab9","order":8},{"adult":false,"gender":1,"id":2145593,"known_for_department":"Acting","name":"Leslee Emmett","original_name":"Leslee Emmett","popularity":1.96,"profile_path":"/ra2KjvFL9wxFhvtNbKB0hEpTzso.jpg","cast_id":48,"character":"Crystal","credit_id":"605b9da670b4440054576a07","order":9},{"adult":false,"gender":0,"id":3023451,"known_for_department":"Acting","name":"Nicholas Petron","original_name":"Nicholas Petron","popularity":0.6,"profile_path":null,"cast_id":49,"character":"Limo Driver","credit_id":"605b9de0a34911006b6e8929","order":10},{"adult":false,"gender":1,"id":2207132,"known_for_department":"Acting","name":"Abigail Esmena Froehle","original_name":"Abigail Esmena Froehle","popularity":1.893,"profile_path":"/9nkpGfi50oLJOyx9JkdOW0xKV4X.jpg","cast_id":50,"character":"Waitress","credit_id":"605b9df7d5ffcb00764c7597","order":11},{"adult":false,"gender":1,"id":1826561,"known_for_department":"Crew","name":"Jacquie Nguyen","original_name":"Jacquie Nguyen","popularity":0.619,"profile_path":null,"cast_id":51,"character":"Gemma","credit_id":"605b9e1bb39e3500544efb76","order":12},{"adult":false,"gender":0,"id":3023452,"known_for_department":"Acting","name":"Katie Groneman","original_name":"Katie Groneman","popularity":0.6,"profile_path":null,"cast_id":52,"character":"Bartender","credit_id":"605b9e2bdd47e10069d3cba6","order":13},{"adult":false,"gender":2,"id":2852349,"known_for_department":"Acting","name":"Adam Huel Potter","original_name":"Adam Huel Potter","popularity":2.128,"profile_path":"/eL4BlIaFmzfF7uYF4UaW917QXcQ.jpg","cast_id":53,"character":"Drunk Patron","credit_id":"605b9e3ed5ffcb0056324a64","order":14},{"adult":false,"gender":0,"id":1109619,"known_for_department":"Acting","name":"Chris Petty","original_name":"Chris Petty","popularity":1.094,"profile_path":null,"cast_id":54,"character":"Pardoner Soldier 1","credit_id":"605b9e62cf4a640076bba14e","order":15},{"adult":false,"gender":2,"id":1367054,"known_for_department":"Production","name":"Timothy C. Sullivan","original_name":"Timothy C. Sullivan","popularity":0.6,"profile_path":null,"cast_id":55,"character":"Pardoner Soldier 2","credit_id":"605b9e79b39e35003ddbc999","order":16},{"adult":false,"gender":0,"id":1635066,"known_for_department":"Production","name":"Alexander Eckert","original_name":"Alexander Eckert","popularity":1.4,"profile_path":null,"cast_id":56,"character":"Pardoner Soldier 3","credit_id":"605b9e8d22df2e0053b2349b","order":17}]
/// crew : [{"adult":false,"gender":2,"id":17210,"known_for_department":"Production","name":"George Furla","original_name":"George Furla","popularity":1.565,"profile_path":"/lUuc7YHInF4GpKCRvZQaspWxPfL.jpg","credit_id":"5f10c0156dea3a0032f3910f","department":"Production","job":"Producer"},{"adult":false,"gender":2,"id":17211,"known_for_department":"Production","name":"Randall Emmett","original_name":"Randall Emmett","popularity":1.347,"profile_path":"/wlFuKcM85H1TeNjSshBSpjdsEVg.jpg","credit_id":"5f10c003688cd00037495de1","department":"Production","job":"Producer"},{"adult":false,"gender":0,"id":41897,"known_for_department":"Sound","name":"Jonathan Sheldon","original_name":"Jonathan Sheldon","popularity":0.656,"profile_path":null,"credit_id":"60097083dd83fa003e8cb47b","department":"Production","job":"Post Producer"},{"adult":false,"gender":0,"id":115810,"known_for_department":"Sound","name":"Yagmur Kaplan","original_name":"Yagmur Kaplan","popularity":0.6,"profile_path":null,"credit_id":"5f8d9fb53927120039285947","department":"Sound","job":"Sound Re-Recording Mixer"},{"adult":false,"gender":2,"id":231705,"known_for_department":"Directing","name":"Matt Eskandari","original_name":"Matt Eskandari","popularity":1.96,"profile_path":"/kSg4nKaFXsKZyO2hI48jAkBkPEY.jpg","credit_id":"5f10bf6d9ca7590038419ab0","department":"Directing","job":"Director"},{"adult":false,"gender":0,"id":567462,"known_for_department":"Sound","name":"Mike Burns","original_name":"Mike Burns","popularity":0.98,"profile_path":null,"credit_id":"5f10c10f23d27800340b4b71","department":"Sound","job":"Music Supervisor"},{"adult":false,"gender":0,"id":995353,"known_for_department":"Production","name":"Bernie Gewissler","original_name":"Bernie Gewissler","popularity":1.4,"profile_path":null,"credit_id":"5f1ae8b82afb25003717bf1c","department":"Production","job":"Unit Production Manager"},{"adult":false,"gender":2,"id":1034592,"known_for_department":"Production","name":"Mark Stewart","original_name":"Mark Stewart","popularity":1.116,"profile_path":"/1xmGO1OwqhxVEsx0FMqAsT8cYlI.jpg","credit_id":"5f10c0a4688cd0003849b62d","department":"Production","job":"Producer"},{"adult":false,"gender":2,"id":1147988,"known_for_department":"Camera","name":"Bryan Koss","original_name":"Bryan Koss","popularity":1.385,"profile_path":null,"credit_id":"5f10c1242495ab0032397706","department":"Camera","job":"Director of Photography"},{"adult":false,"gender":1,"id":1302527,"known_for_department":"Directing","name":"Kimberley Roper","original_name":"Kimberley Roper","popularity":0.6,"profile_path":null,"credit_id":"5f8d9da83927120037291a9f","department":"Directing","job":"Script Supervisor"},{"adult":false,"gender":2,"id":1367054,"known_for_department":"Production","name":"Timothy C. Sullivan","original_name":"Timothy C. Sullivan","popularity":0.6,"profile_path":null,"credit_id":"5f10c0569ca7590038419c0e","department":"Production","job":"Producer"},{"adult":false,"gender":0,"id":1384817,"known_for_department":"Production","name":"Shaun S. Sanghani","original_name":"Shaun S. Sanghani","popularity":0.698,"profile_path":null,"credit_id":"5f10c0366dea3a0035f1adef","department":"Production","job":"Producer"},{"adult":false,"gender":0,"id":1385117,"known_for_department":"Costume & Make-Up","name":"Anne Taylor","original_name":"Anne Taylor","popularity":0.6,"profile_path":null,"credit_id":"5f8d9ee5cb802800390aefb2","department":"Costume & Make-Up","job":"Makeup Department Head"},{"adult":false,"gender":0,"id":1402709,"known_for_department":"Art","name":"Stanford Gilbert","original_name":"Stanford Gilbert","popularity":0.6,"profile_path":null,"credit_id":"5f8d9e4789f749003802fc0b","department":"Art","job":"Property Master"},{"adult":false,"gender":0,"id":1402709,"known_for_department":"Art","name":"Stanford Gilbert","original_name":"Stanford Gilbert","popularity":0.6,"profile_path":null,"credit_id":"5f8d9c8e89f749003802f66b","department":"Crew","job":"Armorer"},{"adult":false,"gender":2,"id":1448299,"known_for_department":"Visual Effects","name":"Thomas D. Moser","original_name":"Thomas D. Moser","popularity":0.6,"profile_path":null,"credit_id":"5f8d9c13f8aee80034bc8b12","department":"Visual Effects","job":"Visual Effects Supervisor"},{"adult":false,"gender":2,"id":1460021,"known_for_department":"Writing","name":"Chris LaMont","original_name":"Chris LaMont","popularity":0.98,"profile_path":"/fkgMJ81OPauqWugSZsbbFRdRvmB.jpg","credit_id":"5f10bfca1684f700389e1479","department":"Writing","job":"Screenplay"},{"adult":false,"gender":0,"id":1579381,"known_for_department":"Costume & Make-Up","name":"Jaclyn Laravie","original_name":"Jaclyn Laravie","popularity":0.6,"profile_path":null,"credit_id":"5f8d9ecb11386c0037fe889e","department":"Costume & Make-Up","job":"Key Makeup Artist"},{"adult":false,"gender":0,"id":1635066,"known_for_department":"Production","name":"Alexander Eckert","original_name":"Alexander Eckert","popularity":1.4,"profile_path":null,"credit_id":"5f10c0491684f700389e155e","department":"Production","job":"Producer"},{"adult":false,"gender":0,"id":1762820,"known_for_department":"Sound","name":"Scott Osowski","original_name":"Scott Osowski","popularity":0.657,"profile_path":null,"credit_id":"5f8d9f47ac617c00367d1e3a","department":"Sound","job":"Boom Operator"},{"adult":false,"gender":0,"id":1762821,"known_for_department":"Costume & Make-Up","name":"Scott H. Reeder","original_name":"Scott H. Reeder","popularity":0.84,"profile_path":null,"credit_id":"5f8d9eb6ac617c00397d0d92","department":"Costume & Make-Up","job":"Key Hair Stylist"},{"adult":false,"gender":0,"id":1820904,"known_for_department":"Costume & Make-Up","name":"Robin Fields","original_name":"Robin Fields","popularity":0.6,"profile_path":null,"credit_id":"5f8d9df189f749003802fad3","department":"Costume & Make-Up","job":"Assistant Costume Designer"},{"adult":false,"gender":0,"id":1822724,"known_for_department":"Sound","name":"Marlowe Taylor","original_name":"Marlowe Taylor","popularity":0.6,"profile_path":null,"credit_id":"5f8d9f9acb8028003708db78","department":"Sound","job":"Sound Mixer"},{"adult":false,"gender":0,"id":1944685,"known_for_department":"Lighting","name":"Mike Dickman","original_name":"Mike Dickman","popularity":0.6,"profile_path":null,"credit_id":"5f8d9cc6f8aee80036be23a2","department":"Lighting","job":"Gaffer"},{"adult":false,"gender":2,"id":2026214,"known_for_department":"Directing","name":"Joe Russo","original_name":"Joe Russo","popularity":0.6,"profile_path":null,"credit_id":"5f10bfb01684f700359ecb3c","department":"Writing","job":"Screenplay"},{"adult":false,"gender":0,"id":2064091,"known_for_department":"Sound","name":"Brian Berger","original_name":"Brian Berger","popularity":0.6,"profile_path":null,"credit_id":"5f8d9f5d3927120039285904","department":"Sound","job":"Dialogue Editor"},{"adult":false,"gender":0,"id":2064092,"known_for_department":"Sound","name":"Lawrence He","original_name":"Lawrence He","popularity":0.6,"profile_path":null,"credit_id":"5f8d9f7ccb802800380757da","department":"Sound","job":"Sound Designer"},{"adult":false,"gender":0,"id":2119529,"known_for_department":"Costume & Make-Up","name":"Anna Maria Reyer","original_name":"Anna Maria Reyer","popularity":0.6,"profile_path":null,"credit_id":"5f8d9e9811386c0035fe0893","department":"Costume & Make-Up","job":"Hair Department Head"},{"adult":false,"gender":0,"id":2178060,"known_for_department":"Lighting","name":"Dylan Algie","original_name":"Dylan Algie","popularity":0.6,"profile_path":null,"credit_id":"5f8d9cb0f8aee80036be236f","department":"Lighting","job":"Best Boy Electric"},{"adult":false,"gender":0,"id":2178063,"known_for_department":"Camera","name":"Michael Salamone","original_name":"Michael Salamone","popularity":0.6,"profile_path":null,"credit_id":"5f8d9ce9cb802800380752a7","department":"Camera","job":"Best Boy Grip"},{"adult":false,"gender":0,"id":2178752,"known_for_department":"Crew","name":"Hilda Somarriba","original_name":"Hilda Somarriba","popularity":0.6,"profile_path":null,"credit_id":"5f8da02717c4430036dd59a6","department":"Crew","job":"Unit Publicist"},{"adult":false,"gender":0,"id":2282835,"known_for_department":"Costume & Make-Up","name":"Zachary Sheets","original_name":"Zachary Sheets","popularity":0.6,"profile_path":null,"credit_id":"5f10c1392d8ef30036401a3b","department":"Costume & Make-Up","job":"Costume Design"},{"adult":false,"gender":0,"id":2282840,"known_for_department":"Art","name":"Laura Dennings","original_name":"Laura Dennings","popularity":0.6,"profile_path":null,"credit_id":"5f8d9e62f8aee80036be27ae","department":"Art","job":"Set Decoration"},{"adult":false,"gender":0,"id":2714350,"known_for_department":"Writing","name":"Nikolai From","original_name":"Nikolai From","popularity":0.694,"profile_path":null,"credit_id":"5f10bf80688cd0003849b4ec","department":"Writing","job":"Story"},{"adult":false,"gender":0,"id":2714351,"known_for_department":"Writing","name":"Clayton Haugen","original_name":"Clayton Haugen","popularity":0.6,"profile_path":null,"credit_id":"5f10bf912d8ef300383e903d","department":"Writing","job":"Story"},{"adult":false,"gender":0,"id":2724128,"known_for_department":"Camera","name":"Mike Burns","original_name":"Mike Burns","popularity":0.6,"profile_path":null,"credit_id":"5f8d9fe711386c0036001985","department":"Camera","job":"Epk Producer"},{"adult":false,"gender":0,"id":2821504,"known_for_department":"Camera","name":"Alexander Elkins","original_name":"Alexander Elkins","popularity":0.6,"profile_path":null,"credit_id":"5f8d9d3bf8aee80036be2475","department":"Camera","job":"Camera Operator"}]

class CastCrewResultModel {
  CastCrewResultModel({
    this.id,
    this.cast,
    this.crew,
  });

  CastCrewResultModel.fromJson(dynamic json) {
    id = json['id'];
    if (json['cast'] != null) {
      cast = [];
      json['cast'].forEach((v) {
        cast?.add(CastModel.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = [];
      json['crew'].forEach((v) {
        crew?.add(Crew.fromJson(v));
      });
    }
  }
  num? id;
  List<CastModel>? cast;
  List<Crew>? crew;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (cast != null) {
      map['cast'] = cast?.map((v) => v.toJson()).toList();
    }
    if (crew != null) {
      map['crew'] = crew?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// adult : false
/// gender : 2
/// id : 17210
/// known_for_department : "Production"
/// name : "George Furla"
/// original_name : "George Furla"
/// popularity : 1.565
/// profile_path : "/lUuc7YHInF4GpKCRvZQaspWxPfL.jpg"
/// credit_id : "5f10c0156dea3a0032f3910f"
/// department : "Production"
/// job : "Producer"

class Crew {
  Crew({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.creditId,
    this.department,
    this.job,
  });

  Crew.fromJson(dynamic json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    creditId = json['credit_id'];
    department = json['department'];
    job = json['job'];
  }
  bool? adult;
  num? gender;
  num? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  num? popularity;
  String? profilePath;
  String? creditId;
  String? department;
  String? job;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['gender'] = gender;
    map['id'] = id;
    map['known_for_department'] = knownForDepartment;
    map['name'] = name;
    map['original_name'] = originalName;
    map['popularity'] = popularity;
    map['profile_path'] = profilePath;
    map['credit_id'] = creditId;
    map['department'] = department;
    map['job'] = job;
    return map;
  }
}

/// adult : false
/// gender : 2
/// id : 62
/// known_for_department : "Acting"
/// name : "Bruce Willis"
/// original_name : "Bruce Willis"
/// popularity : 37.169
/// profile_path : "/caX3KtMU42EP3VLRFFBwqIIrch5.jpg"
/// cast_id : 1
/// character : "Chalmers"
/// credit_id : "5f10be992495ab003535eb26"
/// order : 0

class CastModel extends CastEntity {
  CastModel(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      required this.name,
      this.originalName,
      this.popularity,
      required this.profilePath,
      this.castId,
      required this.character,
      required this.creditId,
      this.order})
      : super(
            creditId: creditId,
            name: name,
            posterPath: profilePath,
            character: character);

  factory CastModel.fromJson(dynamic json) {
    return CastModel(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: json['popularity'],
      profilePath: json['profile_path'],
      castId: json['cast_id'],
      character: json['character'],
      creditId: json['credit_id'],
      order: json['order'],
    );
  }
  final bool? adult;
  final num? gender;
  final num? id;
  final String? knownForDepartment;
  final String name;
  final String? originalName;
  final num? popularity;
  final String? profilePath;
  final num? castId;
  final String character;
  final String creditId;
  final num? order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['gender'] = gender;
    map['id'] = id;
    map['known_for_department'] = knownForDepartment;
    map['name'] = name;
    map['original_name'] = originalName;
    map['popularity'] = popularity;
    map['profile_path'] = profilePath;
    map['cast_id'] = castId;
    map['character'] = character;
    map['credit_id'] = creditId;
    map['order'] = order;
    return map;
  }
}
