// To parse this JSON data, do
//
//     final pokemonEntries = pokemonEntriesFromMap(jsonString);

import 'dart:convert';
import 'models.dart';

class PokemonEntries {
    PokemonEntries({
        required this.descriptions,
        required this.id,
        required this.isMainSeries,
        required this.name,
        required this.names,
        required this.pokemonEntries,
        required this.region,
        required this.versionGroups,
    });

    List<Description> descriptions;
    int id;
    bool isMainSeries;
    String name;
    List<Name> names;
    List<PokemonEntry> pokemonEntries;//lista de pokemones
    Region region;
    List<Region> versionGroups;

    factory PokemonEntries.fromJson(String str) => PokemonEntries.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PokemonEntries.fromMap(Map<String, dynamic> json) => PokemonEntries(
        descriptions: List<Description>.from(json["descriptions"].map((x) => Description.fromMap(x))),
        id: json["id"],
        isMainSeries: json["is_main_series"],
        name: json["name"],
        names: List<Name>.from(json["names"].map((x) => Name.fromMap(x))),
        pokemonEntries: List<PokemonEntry>.from(json["pokemon_entries"].map((x) => PokemonEntry.fromMap(x))),
        region: Region.fromMap(json["region"]),
        versionGroups: List<Region>.from(json["version_groups"].map((x) => Region.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "descriptions": List<dynamic>.from(descriptions.map((x) => x.toMap())),
        "id": id,
        "is_main_series": isMainSeries,
        "name": name,
        "names": List<dynamic>.from(names.map((x) => x.toMap())),
        "pokemon_entries": List<dynamic>.from(pokemonEntries.map((x) => x.toMap())),
        "region": region.toMap(),
        "version_groups": List<dynamic>.from(versionGroups.map((x) => x.toMap())),
    };
}

class Description {
    Description({
        required this.description,
        required this.language,
    });

    String description;
    Region language;

    factory Description.fromJson(String str) => Description.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Description.fromMap(Map<String, dynamic> json) => Description(
        description: json["description"],
        language: Region.fromMap(json["language"]),
    );

    Map<String, dynamic> toMap() => {
        "description": description,
        "language": language.toMap(),
    };
}



class Name {
    Name({
        required this.language,
        required this.name,
    });

    Region language;
    String name;

    factory Name.fromJson(String str) => Name.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Name.fromMap(Map<String, dynamic> json) => Name(
        language: Region.fromMap(json["language"]),
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "language": language.toMap(),
        "name": name,
    };
}


