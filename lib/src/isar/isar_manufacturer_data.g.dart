// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_manufacturer_data.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IsarManufacturerDataSchema = Schema(
  name: r'IsarManufacturerData',
  id: 5940548335174185571,
  properties: {
    r'manufacturerId': PropertySchema(
      id: 0,
      name: r'manufacturerId',
      type: IsarType.long,
    ),
    r'value': PropertySchema(
      id: 1,
      name: r'value',
      type: IsarType.longList,
    )
  },
  estimateSize: _isarManufacturerDataEstimateSize,
  serialize: _isarManufacturerDataSerialize,
  deserialize: _isarManufacturerDataDeserialize,
  deserializeProp: _isarManufacturerDataDeserializeProp,
);

int _isarManufacturerDataEstimateSize(
  IsarManufacturerData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.value.length * 8;
  return bytesCount;
}

void _isarManufacturerDataSerialize(
  IsarManufacturerData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.manufacturerId);
  writer.writeLongList(offsets[1], object.value);
}

IsarManufacturerData _isarManufacturerDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarManufacturerData();
  object.manufacturerId = reader.readLong(offsets[0]);
  object.value = reader.readLongList(offsets[1]) ?? [];
  return object;
}

P _isarManufacturerDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLongList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IsarManufacturerDataQueryFilter on QueryBuilder<IsarManufacturerData,
    IsarManufacturerData, QFilterCondition> {
  QueryBuilder<IsarManufacturerData, IsarManufacturerData,
      QAfterFilterCondition> manufacturerIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'manufacturerId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarManufacturerData, IsarManufacturerData,
      QAfterFilterCondition> manufacturerIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'manufacturerId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarManufacturerData, IsarManufacturerData,
      QAfterFilterCondition> manufacturerIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'manufacturerId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarManufacturerData, IsarManufacturerData,
      QAfterFilterCondition> manufacturerIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'manufacturerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarManufacturerData, IsarManufacturerData,
      QAfterFilterCondition> valueElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarManufacturerData, IsarManufacturerData,
      QAfterFilterCondition> valueElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarManufacturerData, IsarManufacturerData,
      QAfterFilterCondition> valueElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarManufacturerData, IsarManufacturerData,
      QAfterFilterCondition> valueElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarManufacturerData, IsarManufacturerData,
      QAfterFilterCondition> valueLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'value',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarManufacturerData, IsarManufacturerData,
      QAfterFilterCondition> valueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'value',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarManufacturerData, IsarManufacturerData,
      QAfterFilterCondition> valueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'value',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarManufacturerData, IsarManufacturerData,
      QAfterFilterCondition> valueLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'value',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarManufacturerData, IsarManufacturerData,
      QAfterFilterCondition> valueLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'value',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarManufacturerData, IsarManufacturerData,
      QAfterFilterCondition> valueLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'value',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension IsarManufacturerDataQueryObject on QueryBuilder<IsarManufacturerData,
    IsarManufacturerData, QFilterCondition> {}
