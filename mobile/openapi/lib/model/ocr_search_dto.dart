//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OcrSearchDto {
  /// Returns a new [OcrSearchDto] instance.
  OcrSearchDto({
    required this.ocr,
    this.isArchived,
    this.isFavorite,
    this.isNotInAlbum,
    this.page,
    this.personIds = const [],
    required this.query,
    this.size,
    this.type,
  });

  String? ocr;

  bool? isArchived;

  bool? isFavorite;

  bool? isNotInAlbum;

  /// Minimum value: 1
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? page;

  List<String> personIds;

  String query;

  /// Minimum value: 1
  /// Maximum value: 1000
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? size;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AssetTypeEnum? type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OcrSearchDto &&
          other.ocr == ocr &&
          other.isArchived == isArchived &&
          other.isFavorite == isFavorite &&
          other.isNotInAlbum == isNotInAlbum &&
          other.query == query &&
          other.size == size &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (ocr == null ? 0 : ocr!.hashCode) +
      (isArchived == null ? 0 : isArchived!.hashCode) +
      (isFavorite == null ? 0 : isFavorite!.hashCode) +
      (isNotInAlbum == null ? 0 : isNotInAlbum!.hashCode) +
      (query.hashCode) +
      (size == null ? 0 : size!.hashCode) +
      (type == null ? 0 : type!.hashCode);

  @override
  String toString() =>
      'OcrSearchDto[ocr=$ocr, isArchived=$isArchived, isFavorite=$isFavorite, isNotInAlbum=$isNotInAlbum, query=$query, size=$size, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.ocr != null) {
      json[r'ocr'] = this.ocr;
    } else {
      //  json[r'ocr'] = null;
    }
    if (this.isArchived != null) {
      json[r'isArchived'] = this.isArchived;
    } else {
      //  json[r'isArchived'] = null;
    }
    if (this.isFavorite != null) {
      json[r'isFavorite'] = this.isFavorite;
    } else {
      //  json[r'isFavorite'] = null;
    }
    if (this.isNotInAlbum != null) {
      json[r'isNotInAlbum'] = this.isNotInAlbum;
    } else {
      //  json[r'isNotInAlbum'] = null;
    }
    if (this.query != null) {
      json[r'query'] = this.query;
    } else {
      //  json[r'query'] = null;
    }
    if (this.size != null) {
      json[r'size'] = this.size;
    } else {
      //  json[r'size'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      //  json[r'type'] = null;
    }
    if (this.isNotInAlbum != null) {
      json[r'isNotInAlbum'] = this.isNotInAlbum;
    } else {
      //  json[r'isNotInAlbum'] = null;
    }
    if (this.page != null) {
      json[r'page'] = this.page;
    } else {
      //  json[r'page'] = null;
    }
    if (this.personIds != null) {
      json[r'personIds'] = this.personIds;
    } else {
      //  json[r'personIds'] = null;
    }
    if (this.query != null) {
      json[r'query'] = this.query;
    } else {
      //  json[r'query'] = null;
    }
    if (this.size != null) {
      json[r'size'] = this.size;
    } else {
      //  json[r'size'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      //  json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [OcrSearchDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OcrSearchDto? fromJson(dynamic value) {
    upgradeDto(value, "OcrSearchDto");
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Get query value and return null if it's not present since it's required
      final queryValue = mapValueOfType<String>(json, r'query');
      if (queryValue == null) {
        return null;
      }

      return OcrSearchDto(
        ocr: mapValueOfType<String>(json, r'ocr'),
        isArchived: mapValueOfType<bool>(json, r'isArchived'),
        isFavorite: mapValueOfType<bool>(json, r'isFavorite'),
        isNotInAlbum: mapValueOfType<bool>(json, r'isNotInAlbum'),
        query: queryValue, // Now we know this is non-null
        size: json[r'size'] != null ? num.parse('${json[r'size']}') : null,
        type: AssetTypeEnum.fromJson(json[r'type']),
        page: json[r'page'] != null ? num.parse('${json[r'page']}') : null,
        personIds: json[r'personIds'] is Iterable
            ? (json[r'personIds'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<OcrSearchDto> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OcrSearchDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OcrSearchDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OcrSearchDto> mapFromJson(dynamic json) {
    final map = <String, OcrSearchDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OcrSearchDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OcrSearchDto-objects as value to a dart map
  static Map<String, List<OcrSearchDto>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<OcrSearchDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OcrSearchDto.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'query',
  };
}
