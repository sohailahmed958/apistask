// To parse this JSON data, do
//
//     final productsModel = productsModelFromMap(jsonString);

import 'dart:convert';

ProductsModel productsModelFromMap(String str) => ProductsModel.fromMap(json.decode(str));

String productsModelToMap(ProductsModel data) => json.encode(data.toMap());

class ProductsModel {
  ProductsModel({
    this.code,
    this.status,
    this.data,
  });

  int? code;
  String? status;
  List<Datum>? data;

  factory ProductsModel.fromMap(Map<String, dynamic> json) => ProductsModel(
    code: json["code"] == null ? null : json["code"],
    status: json["status"] == null ? null : json["status"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "code": code == null ? null : code,
    "status": status == null ? null : status,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class Datum {
  Datum({
    this.timings,
    this.date,
    this.meta,
  });

  Timings? timings;
  Date? date;
  Meta? meta;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    timings: json["timings"] == null ? null : Timings.fromMap(json["timings"]),
    date: json["date"] == null ? null : Date.fromMap(json["date"]),
    meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
  );

  Map<String, dynamic> toMap() => {
    "timings": timings == null ? null : timings!.toMap(),
    "date": date == null ? null : date!.toMap(),
    "meta": meta == null ? null : meta!.toMap(),
  };
}

class Date {
  Date({
    this.readable,
    this.timestamp,
    this.gregorian,
    this.hijri,
  });

  String? readable;
  String? timestamp;
  Gregorian? gregorian;
  Hijri? hijri;

  factory Date.fromMap(Map<String, dynamic> json) => Date(
    readable: json["readable"] == null ? null : json["readable"],
    timestamp: json["timestamp"] == null ? null : json["timestamp"],
    gregorian: json["gregorian"] == null ? null : Gregorian.fromMap(json["gregorian"]),
    hijri: json["hijri"] == null ? null : Hijri.fromMap(json["hijri"]),
  );

  Map<String, dynamic> toMap() => {
    "readable": readable == null ? null : readable,
    "timestamp": timestamp == null ? null : timestamp,
    "gregorian": gregorian == null ? null : gregorian!.toMap(),
    "hijri": hijri == null ? null : hijri!.toMap(),
  };
}

class Gregorian {
  Gregorian({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
  });

  String? date;
  String? format;
  String? day;
  GregorianWeekday? weekday;
  GregorianMonth? month;
  String? year;
  Designation? designation;

  factory Gregorian.fromMap(Map<String, dynamic> json) => Gregorian(
    date: json["date"] == null ? null : json["date"],
    format: json["format"] == null ? null : json["format"],
    day: json["day"] == null ? null : json["day"],
    weekday: json["weekday"] == null ? null : GregorianWeekday.fromMap(json["weekday"]),
    month: json["month"] == null ? null : GregorianMonth.fromMap(json["month"]),
    year: json["year"] == null ? null : json["year"],
    designation: json["designation"] == null ? null : Designation.fromMap(json["designation"]),
  );

  Map<String, dynamic> toMap() => {
    "date": date == null ? null : date,
    "format": format == null ? null : format,
    "day": day == null ? null : day,
    "weekday": weekday == null ? null : weekday!.toMap(),
    "month": month == null ? null : month!.toMap(),
    "year": year == null ? null : year,
    "designation": designation == null ? null : designation!.toMap(),
  };
}

class Designation {
  Designation({
    this.abbreviated,
    this.expanded,
  });

  String? abbreviated;
  String? expanded;

  factory Designation.fromMap(Map<String, dynamic> json) => Designation(
    abbreviated: json["abbreviated"] == null ? null : json["abbreviated"],
    expanded: json["expanded"] == null ? null : json["expanded"],
  );

  Map<String, dynamic> toMap() => {
    "abbreviated": abbreviated == null ? null : abbreviated,
    "expanded": expanded == null ? null : expanded,
  };
}

class GregorianMonth {
  GregorianMonth({
    this.number,
    this.en,
  });

  int? number;
  String? en;

  factory GregorianMonth.fromMap(Map<String, dynamic> json) => GregorianMonth(
    number: json["number"] == null ? null : json["number"],
    en: json["en"] == null ? null : json["en"],
  );

  Map<String, dynamic> toMap() => {
    "number": number == null ? null : number,
    "en": en == null ? null : en,
  };
}

class GregorianWeekday {
  GregorianWeekday({
    this.en,
  });

  String? en;

  factory GregorianWeekday.fromMap(Map<String, dynamic> json) => GregorianWeekday(
    en: json["en"] == null ? null : json["en"],
  );

  Map<String, dynamic> toMap() => {
    "en": en == null ? null : en,
  };
}

class Hijri {
  Hijri({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
    this.holidays,
  });

  String? date;
  String? format;
  String? day;
  HijriWeekday? weekday;
  HijriMonth? month;
  String? year;
  Designation? designation;
  List<String>? holidays;

  factory Hijri.fromMap(Map<String, dynamic> json) => Hijri(
    date: json["date"] == null ? null : json["date"],
    format: json["format"] == null ? null : json["format"],
    day: json["day"] == null ? null : json["day"],
    weekday: json["weekday"] == null ? null : HijriWeekday.fromMap(json["weekday"]),
    month: json["month"] == null ? null : HijriMonth.fromMap(json["month"]),
    year: json["year"] == null ? null : json["year"],
    designation: json["designation"] == null ? null : Designation.fromMap(json["designation"]),
    holidays: json["holidays"] == null ? null : List<String>.from(json["holidays"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "date": date == null ? null : date,
    "format": format == null ? null : format,
    "day": day == null ? null : day,
    "weekday": weekday == null ? null : weekday!.toMap(),
    "month": month == null ? null : month!.toMap(),
    "year": year == null ? null : year,
    "designation": designation == null ? null : designation!.toMap(),
    "holidays": holidays == null ? null : List<dynamic>.from(holidays!.map((x) => x)),
  };
}

class HijriMonth {
  HijriMonth({
    this.number,
    this.en,
    this.ar,
  });

  int? number;
  String? en;
  String? ar;

  factory HijriMonth.fromMap(Map<String, dynamic> json) => HijriMonth(
    number: json["number"] == null ? null : json["number"],
    en: json["en"] == null ? null : json["en"],
    ar: json["ar"] == null ? null : json["ar"],
  );

  Map<String, dynamic> toMap() => {
    "number": number == null ? null : number,
    "en": en == null ? null : en,
    "ar": ar == null ? null : ar,
  };
}

class HijriWeekday {
  HijriWeekday({
    this.en,
    this.ar,
  });

  String? en;
  String? ar;

  factory HijriWeekday.fromMap(Map<String, dynamic> json) => HijriWeekday(
    en: json["en"] == null ? null : json["en"],
    ar: json["ar"] == null ? null : json["ar"],
  );

  Map<String, dynamic> toMap() => {
    "en": en == null ? null : en,
    "ar": ar == null ? null : ar,
  };
}

class Meta {
  Meta({
    this.latitude,
    this.longitude,
    this.timezone,
    this.method,
    this.latitudeAdjustmentMethod,
    this.midnightMode,
    this.school,
    this.offset,
  });

  double? latitude;
  double? longitude;
  String? timezone;
  Method? method;
  String? latitudeAdjustmentMethod;
  String? midnightMode;
  String? school;
  Map<String, int>? offset;

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
    latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
    longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
    timezone: json["timezone"] == null ? null : json["timezone"],
    method: json["method"] == null ? null : Method.fromMap(json["method"]),
    latitudeAdjustmentMethod: json["latitudeAdjustmentMethod"] == null ? null : json["latitudeAdjustmentMethod"],
    midnightMode: json["midnightMode"] == null ? null : json["midnightMode"],
    school: json["school"] == null ? null : json["school"],
    offset: json["offset"] == null ? null : Map.from(json["offset"]).map((k, v) => MapEntry<String, int>(k, v)),
  );

  Map<String, dynamic> toMap() => {
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "timezone": timezone == null ? null : timezone,
    "method": method == null ? null : method!.toMap(),
    "latitudeAdjustmentMethod": latitudeAdjustmentMethod == null ? null : latitudeAdjustmentMethod,
    "midnightMode": midnightMode == null ? null : midnightMode,
    "school": school == null ? null : school,
    "offset": offset == null ? null : Map.from(offset!).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

class Method {
  Method({
    this.id,
    this.name,
    this.params,
    this.location,
  });

  int? id;
  String? name;
  Params? params;
  Location? location;

  factory Method.fromMap(Map<String, dynamic> json) => Method(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    params: json["params"] == null ? null : Params.fromMap(json["params"]),
    location: json["location"] == null ? null : Location.fromMap(json["location"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "params": params == null ? null : params!.toMap(),
    "location": location == null ? null : location!.toMap(),
  };
}

class Location {
  Location({
    this.latitude,
    this.longitude,
  });

  double? latitude;
  double? longitude;

  factory Location.fromMap(Map<String, dynamic> json) => Location(
    latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
    longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
  };
}

class Params {
  Params({
    this.fajr,
    this.isha,
  });

  int? fajr;
  int? isha;

  factory Params.fromMap(Map<String, dynamic> json) => Params(
    fajr: json["Fajr"] == null ? null : json["Fajr"],
    isha: json["Isha"] == null ? null : json["Isha"],
  );

  Map<String, dynamic> toMap() => {
    "Fajr": fajr == null ? null : fajr,
    "Isha": isha == null ? null : isha,
  };
}

class Timings {
  Timings({
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.sunset,
    this.maghrib,
    this.isha,
    this.imsak,
    this.midnight,
    this.firstthird,
    this.lastthird,
  });

  String? fajr;
  String? sunrise;
  String? dhuhr;
  String? asr;
  String? sunset;
  String? maghrib;
  String? isha;
  String? imsak;
  String? midnight;
  String? firstthird;
  String? lastthird;

  factory Timings.fromMap(Map<String, dynamic> json) => Timings(
    fajr: json["Fajr"] == null ? null : json["Fajr"],
    sunrise: json["Sunrise"] == null ? null : json["Sunrise"],
    dhuhr: json["Dhuhr"] == null ? null : json["Dhuhr"],
    asr: json["Asr"] == null ? null : json["Asr"],
    sunset: json["Sunset"] == null ? null : json["Sunset"],
    maghrib: json["Maghrib"] == null ? null : json["Maghrib"],
    isha: json["Isha"] == null ? null : json["Isha"],
    imsak: json["Imsak"] == null ? null : json["Imsak"],
    midnight: json["Midnight"] == null ? null : json["Midnight"],
    firstthird: json["Firstthird"] == null ? null : json["Firstthird"],
    lastthird: json["Lastthird"] == null ? null : json["Lastthird"],
  );

  Map<String, dynamic> toMap() => {
    "Fajr": fajr == null ? null : fajr,
    "Sunrise": sunrise == null ? null : sunrise,
    "Dhuhr": dhuhr == null ? null : dhuhr,
    "Asr": asr == null ? null : asr,
    "Sunset": sunset == null ? null : sunset,
    "Maghrib": maghrib == null ? null : maghrib,
    "Isha": isha == null ? null : isha,
    "Imsak": imsak == null ? null : imsak,
    "Midnight": midnight == null ? null : midnight,
    "Firstthird": firstthird == null ? null : firstthird,
    "Lastthird": lastthird == null ? null : lastthird,
  };
}
