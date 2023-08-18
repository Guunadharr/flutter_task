class UserData {
  List<Result> results;
  Info info;

  UserData({required this.results, required this.info});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      results: List<Result>.from(
          json['results'].map((result) => Result.fromJson(result))),
      info: Info.fromJson(json['info']),
    );
  }
}

class Result {
  Name name;
  Location location;
  String email;
  Dob dob;
  Registered registered;
  Picture picture;
  String nat;

  Result({
    required this.name,
    required this.location,
    required this.email,
    required this.dob,
    required this.registered,
    required this.picture,
    required this.nat,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      name: Name.fromJson(json['name']),
      location: Location.fromJson(json['location']),
      email: json['email'],
      dob: Dob.fromJson(json['dob']),
      registered: Registered.fromJson(json['registered']),
      picture: Picture.fromJson(json['picture']),
      nat: json['nat'],
    );
  }
}

class Name {
  String title;
  String first;
  String last;

  Name({required this.title, required this.first, required this.last});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }
}

class Location {
  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  final Street street;
  final String city;
  final String state;
  final String country;
  final dynamic postcode;
  final Coordinates coordinates;
  final Timezone timezone;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      street: Street.fromJson(json['street']),
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'],
      coordinates: Coordinates.fromJson(json['coordinates']),
      timezone: Timezone.fromJson(json['timezone']),
    );
  }
}

class Street {
  Street({
    required this.number,
    required this.name,
  });

  final int number;
  final String name;

  factory Street.fromJson(Map<String, dynamic> json) {
    return Street(
      number: json['number'],
      name: json['name'],
    );
  }
}

class Coordinates {
  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  final String latitude;
  final String longitude;

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

class Timezone {
  Timezone({
    required this.offset,
    required this.description,
  });

  final String offset;
  final String description;

  factory Timezone.fromJson(Map<String, dynamic> json) {
    return Timezone(
      offset: json['offset'],
      description: json['description'],
    );
  }
}

class Dob {
  Dob({
    required this.date,
    required this.age,
  });

  final String date;
  final int age;

  factory Dob.fromJson(Map<String, dynamic> json) {
    return Dob(
      date: json['date'],
      age: json['age'],
    );
  }
}

class Registered {
  Registered({
    required this.date,
    required this.age,
  });

  final String date;
  final int age;

  factory Registered.fromJson(Map<String, dynamic> json) {
    return Registered(
      date: json['date'],
      age: json['age'],
    );
  }
}

class Picture {
  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  final String large;
  final String medium;
  final String thumbnail;

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      large: json['large'],
      medium: json['medium'],
      thumbnail: json['thumbnail'],
    );
  }
}

class Info {
  Info({
    required this.seed,
    required this.results,
    required this.page,
    required this.version,
  });

  final String seed;
  final int results;
  final int page;
  final String version;

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      seed: json['seed'],
      results: json['results'],
      page: json['page'],
      version: json['version'],
    );
  }
}
