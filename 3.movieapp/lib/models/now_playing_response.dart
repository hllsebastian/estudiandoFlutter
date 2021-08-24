// To parse this JSON data, do
//
//     final nowPlayingResponse = nowPlayingResponseFromMap(jsonString);

import 'dart:convert';

import 'models.dart';

class NowPlayingResponse { //constructor
    NowPlayingResponse({
       required this.dates,
       required this.page,
       required this.results,
       required this.totalPages,
       required this.totalResults,
    });

    Dates dates; // propiedades
    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    // factory constructor para pasar la instancia de Json a un Map
    factory NowPlayingResponse.fromJson(String str) => NowPlayingResponse.fromMap(json.decode(str));

    // toma la instancia de la clase y la convierte en Map, pero no es necesario
    //String toJson() => json.encode(toMap());

    factory NowPlayingResponse.fromMap(Map<String, dynamic> json) => NowPlayingResponse(
        dates: Dates.fromMap(json["dates"]),
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

                                  //este mapa no es necesario, es para enviar
                                  //una peticion HTTP
    /* Map<String, dynamic> toMap() => {
        "dates": dates.toMap(),
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
        "total_pages": totalPages,
        "total_results": totalResults,
    }; */
}

class Dates {
    Dates({
       required this.maximum,
       required this.minimum,
    });

    DateTime maximum;
    DateTime minimum;

    factory Dates.fromJson(String str) => Dates.fromMap(json.decode(str));

    factory Dates.fromMap(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );
}


