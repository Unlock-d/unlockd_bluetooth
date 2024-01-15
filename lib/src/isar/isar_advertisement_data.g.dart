// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_advertisement_data.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IsarAdvertisementDataSchema = Schema(
  name: r'IsarAdvertisementData',
  id: 2433089476489940352,
  properties: {
    r'advName': PropertySchema(
      id: 0,
      name: r'advName',
      type: IsarType.string,
    ),
    r'connectable': PropertySchema(
      id: 1,
      name: r'connectable',
      type: IsarType.bool,
    ),
    r'isarManufacturerData': PropertySchema(
      id: 2,
      name: r'isarManufacturerData',
      type: IsarType.objectList,
      target: r'IsarManufacturerData',
    ),
    r'isarServiceData': PropertySchema(
      id: 3,
      name: r'isarServiceData',
      type: IsarType.objectList,
      target: r'IsarServiceData',
    ),
    r'serviceUuids': PropertySchema(
      id: 4,
      name: r'serviceUuids',
      type: IsarType.stringList,
    ),
    r'txPowerLevel': PropertySchema(
      id: 5,
      name: r'txPowerLevel',
      type: IsarType.long,
    )
  },
  estimateSize: _isarAdvertisementDataEstimateSize,
  serialize: _isarAdvertisementDataSerialize,
  deserialize: _isarAdvertisementDataDeserialize,
  deserializeProp: _isarAdvertisementDataDeserializeProp,
);

int _isarAdvertisementDataEstimateSize(
  IsarAdvertisementData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.advName.length * 3;
  bytesCount += 3 + object.isarManufacturerData.length * 3;
  {
    final offsets = allOffsets[IsarManufacturerData]!;
    for (var i = 0; i < object.isarManufacturerData.length; i++) {
      final value = object.isarManufacturerData[i];
      bytesCount +=
          IsarManufacturerDataSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.isarServiceData.length * 3;
  {
    final offsets = allOffsets[IsarServiceData]!;
    for (var i = 0; i < object.isarServiceData.length; i++) {
      final value = object.isarServiceData[i];
      bytesCount +=
          IsarServiceDataSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.serviceUuids.length * 3;
  {
    for (var i = 0; i < object.serviceUuids.length; i++) {
      final value = object.serviceUuids[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _isarAdvertisementDataSerialize(
  IsarAdvertisementData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.advName);
  writer.writeBool(offsets[1], object.connectable);
  writer.writeObjectList<IsarManufacturerData>(
    offsets[2],
    allOffsets,
    IsarManufacturerDataSchema.serialize,
    object.isarManufacturerData,
  );
  writer.writeObjectList<IsarServiceData>(
    offsets[3],
    allOffsets,
    IsarServiceDataSchema.serialize,
    object.isarServiceData,
  );
  writer.writeStringList(offsets[4], object.serviceUuids);
  writer.writeLong(offsets[5], object.txPowerLevel);
}

IsarAdvertisementData _isarAdvertisementDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarAdvertisementData();
  object.advName = reader.readString(offsets[0]);
  object.connectable = reader.readBool(offsets[1]);
  object.isarManufacturerData = reader.readObjectList<IsarManufacturerData>(
        offsets[2],
        IsarManufacturerDataSchema.deserialize,
        allOffsets,
        IsarManufacturerData(),
      ) ??
      [];
  object.isarServiceData = reader.readObjectList<IsarServiceData>(
        offsets[3],
        IsarServiceDataSchema.deserialize,
        allOffsets,
        IsarServiceData(),
      ) ??
      [];
  object.serviceUuids = reader.readStringList(offsets[4]) ?? [];
  object.txPowerLevel = reader.readLongOrNull(offsets[5]);
  return object;
}

P _isarAdvertisementDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readObjectList<IsarManufacturerData>(
            offset,
            IsarManufacturerDataSchema.deserialize,
            allOffsets,
            IsarManufacturerData(),
          ) ??
          []) as P;
    case 3:
      return (reader.readObjectList<IsarServiceData>(
            offset,
            IsarServiceDataSchema.deserialize,
            allOffsets,
            IsarServiceData(),
          ) ??
          []) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IsarAdvertisementDataQueryFilter on QueryBuilder<
    IsarAdvertisementData, IsarAdvertisementData, QFilterCondition> {
  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> advNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'advName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> advNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'advName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> advNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'advName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> advNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'advName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> advNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'advName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> advNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'advName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
          QAfterFilterCondition>
      advNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'advName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
          QAfterFilterCondition>
      advNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'advName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> advNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'advName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> advNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'advName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> connectableEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'connectable',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> isarManufacturerDataLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'isarManufacturerData',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> isarManufacturerDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'isarManufacturerData',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> isarManufacturerDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'isarManufacturerData',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> isarManufacturerDataLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'isarManufacturerData',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> isarManufacturerDataLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'isarManufacturerData',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> isarManufacturerDataLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'isarManufacturerData',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> isarServiceDataLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'isarServiceData',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> isarServiceDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'isarServiceData',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> isarServiceDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'isarServiceData',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> isarServiceDataLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'isarServiceData',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> isarServiceDataLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'isarServiceData',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> isarServiceDataLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'isarServiceData',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> serviceUuidsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serviceUuids',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> serviceUuidsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serviceUuids',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> serviceUuidsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serviceUuids',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> serviceUuidsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serviceUuids',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> serviceUuidsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'serviceUuids',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> serviceUuidsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'serviceUuids',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
          QAfterFilterCondition>
      serviceUuidsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serviceUuids',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
          QAfterFilterCondition>
      serviceUuidsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serviceUuids',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> serviceUuidsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serviceUuids',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> serviceUuidsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serviceUuids',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> serviceUuidsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'serviceUuids',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> serviceUuidsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'serviceUuids',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> serviceUuidsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'serviceUuids',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> serviceUuidsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'serviceUuids',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> serviceUuidsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'serviceUuids',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> serviceUuidsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'serviceUuids',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> txPowerLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'txPowerLevel',
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> txPowerLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'txPowerLevel',
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> txPowerLevelEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'txPowerLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> txPowerLevelGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'txPowerLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> txPowerLevelLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'txPowerLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
      QAfterFilterCondition> txPowerLevelBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'txPowerLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarAdvertisementDataQueryObject on QueryBuilder<
    IsarAdvertisementData, IsarAdvertisementData, QFilterCondition> {
  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
          QAfterFilterCondition>
      isarManufacturerDataElement(FilterQuery<IsarManufacturerData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'isarManufacturerData');
    });
  }

  QueryBuilder<IsarAdvertisementData, IsarAdvertisementData,
          QAfterFilterCondition>
      isarServiceDataElement(FilterQuery<IsarServiceData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'isarServiceData');
    });
  }
}
