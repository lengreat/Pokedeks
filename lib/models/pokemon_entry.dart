import 'dart:convert';

class PokemonEntry {
    PokemonEntry({
        required this.entryNumber,
        required this.pokemonSpecies,
    });

    int entryNumber;
    Region pokemonSpecies;

    factory PokemonEntry.fromJson(String str) => PokemonEntry.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PokemonEntry.fromMap(Map<String, dynamic> json) => PokemonEntry(
        entryNumber: json["entry_number"],
        pokemonSpecies: Region.fromMap(json["pokemon_species"]),
    );

    Map<String, dynamic> toMap() => {
        "entry_number": entryNumber,
        "pokemon_species": pokemonSpecies.toMap(),
    };
}

class Region {
    Region({
        required this.name,
        required this.url,
    });

    String name;
    String url;

    factory Region.fromJson(String str) => Region.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Region.fromMap(Map<String, dynamic> json) => Region(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
    };
}