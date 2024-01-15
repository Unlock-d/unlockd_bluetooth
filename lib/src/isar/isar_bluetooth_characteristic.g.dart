// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_bluetooth_characteristic.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarBluetoothCharacteristicCollection on Isar {
  IsarCollection<IsarBluetoothCharacteristic>
      get isarBluetoothCharacteristics => this.collection();
}

const IsarBluetoothCharacteristicSchema = CollectionSchema(
  name: r'IsarBluetoothCharacteristic',
  id: 6340988949519071912,
  properties: {
    r'characteristicUuid': PropertySchema(
      id: 0,
      name: r'characteristicUuid',
      type: IsarType.string,
    ),
    r'contents': PropertySchema(
      id: 1,
      name: r'contents',
      type: IsarType.longList,
    ),
    r'isNotifying': PropertySchema(
      id: 2,
      name: r'isNotifying',
      type: IsarType.bool,
    ),
    r'lastValue': PropertySchema(
      id: 3,
      name: r'lastValue',
      type: IsarType.longList,
    ),
    r'properties': PropertySchema(
      id: 4,
      name: r'properties',
      type: IsarType.object,
      target: r'IsarCharacteristicProperties',
    )
  },
  estimateSize: _isarBluetoothCharacteristicEstimateSize,
  serialize: _isarBluetoothCharacteristicSerialize,
  deserialize: _isarBluetoothCharacteristicDeserialize,
  deserializeProp: _isarBluetoothCharacteristicDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'service': LinkSchema(
      id: 5162489958906709349,
      name: r'service',
      target: r'IsarBluetoothService',
      single: true,
      linkName: r'isarCharacteristics',
    ),
    r'isarDescriptors': LinkSchema(
      id: -3557232885701906161,
      name: r'isarDescriptors',
      target: r'IsarBluetoothDescriptor',
      single: false,
    )
  },
  embeddedSchemas: {
    r'IsarCharacteristicProperties': IsarCharacteristicPropertiesSchema
  },
  getId: _isarBluetoothCharacteristicGetId,
  getLinks: _isarBluetoothCharacteristicGetLinks,
  attach: _isarBluetoothCharacteristicAttach,
  version: '3.1.0+1',
);

int _isarBluetoothCharacteristicEstimateSize(
  IsarBluetoothCharacteristic object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.characteristicUuid.length * 3;
  bytesCount += 3 + object.contents.length * 8;
  bytesCount += 3 + object.lastValue.length * 8;
  bytesCount += 3 +
      IsarCharacteristicPropertiesSchema.estimateSize(object.properties,
          allOffsets[IsarCharacteristicProperties]!, allOffsets);
  return bytesCount;
}

void _isarBluetoothCharacteristicSerialize(
  IsarBluetoothCharacteristic object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.characteristicUuid);
  writer.writeLongList(offsets[1], object.contents);
  writer.writeBool(offsets[2], object.isNotifying);
  writer.writeLongList(offsets[3], object.lastValue);
  writer.writeObject<IsarCharacteristicProperties>(
    offsets[4],
    allOffsets,
    IsarCharacteristicPropertiesSchema.serialize,
    object.properties,
  );
}

IsarBluetoothCharacteristic _isarBluetoothCharacteristicDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarBluetoothCharacteristic();
  object.characteristicUuid = reader.readString(offsets[0]);
  object.contents = reader.readLongList(offsets[1]) ?? [];
  object.id = id;
  object.isNotifying = reader.readBool(offsets[2]);
  object.properties = reader.readObjectOrNull<IsarCharacteristicProperties>(
        offsets[4],
        IsarCharacteristicPropertiesSchema.deserialize,
        allOffsets,
      ) ??
      IsarCharacteristicProperties();
  return object;
}

P _isarBluetoothCharacteristicDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLongList(offset) ?? []) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readLongList(offset) ?? []) as P;
    case 4:
      return (reader.readObjectOrNull<IsarCharacteristicProperties>(
            offset,
            IsarCharacteristicPropertiesSchema.deserialize,
            allOffsets,
          ) ??
          IsarCharacteristicProperties()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarBluetoothCharacteristicGetId(IsarBluetoothCharacteristic object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarBluetoothCharacteristicGetLinks(
    IsarBluetoothCharacteristic object) {
  return [object.service, object.isarDescriptors];
}

void _isarBluetoothCharacteristicAttach(
    IsarCollection<dynamic> col, Id id, IsarBluetoothCharacteristic object) {
  object.id = id;
  object.service
      .attach(col, col.isar.collection<IsarBluetoothService>(), r'service', id);
  object.isarDescriptors.attach(col,
      col.isar.collection<IsarBluetoothDescriptor>(), r'isarDescriptors', id);
}

extension IsarBluetoothCharacteristicQueryWhereSort on QueryBuilder<
    IsarBluetoothCharacteristic, IsarBluetoothCharacteristic, QWhere> {
  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarBluetoothCharacteristicQueryWhere on QueryBuilder<
    IsarBluetoothCharacteristic, IsarBluetoothCharacteristic, QWhereClause> {
  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarBluetoothCharacteristicQueryFilter on QueryBuilder<
    IsarBluetoothCharacteristic,
    IsarBluetoothCharacteristic,
    QFilterCondition> {
  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> characteristicUuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'characteristicUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> characteristicUuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'characteristicUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> characteristicUuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'characteristicUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> characteristicUuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'characteristicUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> characteristicUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'characteristicUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> characteristicUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'characteristicUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
          QAfterFilterCondition>
      characteristicUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'characteristicUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
          QAfterFilterCondition>
      characteristicUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'characteristicUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> characteristicUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'characteristicUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> characteristicUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'characteristicUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> contentsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contents',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> contentsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contents',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> contentsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contents',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> contentsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contents',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> contentsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'contents',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> contentsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'contents',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> contentsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'contents',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> contentsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'contents',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> contentsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'contents',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> contentsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'contents',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> isNotifyingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isNotifying',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> lastValueElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastValue',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> lastValueElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastValue',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> lastValueElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastValue',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> lastValueElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> lastValueLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lastValue',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> lastValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lastValue',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> lastValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lastValue',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> lastValueLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lastValue',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> lastValueLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lastValue',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> lastValueLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lastValue',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension IsarBluetoothCharacteristicQueryObject on QueryBuilder<
    IsarBluetoothCharacteristic,
    IsarBluetoothCharacteristic,
    QFilterCondition> {
  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
          QAfterFilterCondition>
      properties(FilterQuery<IsarCharacteristicProperties> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'properties');
    });
  }
}

extension IsarBluetoothCharacteristicQueryLinks on QueryBuilder<
    IsarBluetoothCharacteristic,
    IsarBluetoothCharacteristic,
    QFilterCondition> {
  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> service(FilterQuery<IsarBluetoothService> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'service');
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> serviceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'service', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
          QAfterFilterCondition>
      isarDescriptors(FilterQuery<IsarBluetoothDescriptor> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'isarDescriptors');
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> isarDescriptorsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'isarDescriptors', length, true, length, true);
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> isarDescriptorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'isarDescriptors', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> isarDescriptorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'isarDescriptors', 0, false, 999999, true);
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> isarDescriptorsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'isarDescriptors', 0, true, length, include);
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> isarDescriptorsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'isarDescriptors', length, include, 999999, true);
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterFilterCondition> isarDescriptorsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'isarDescriptors', lower, includeLower, upper, includeUpper);
    });
  }
}

extension IsarBluetoothCharacteristicQuerySortBy on QueryBuilder<
    IsarBluetoothCharacteristic, IsarBluetoothCharacteristic, QSortBy> {
  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterSortBy> sortByCharacteristicUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characteristicUuid', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterSortBy> sortByCharacteristicUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characteristicUuid', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterSortBy> sortByIsNotifying() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNotifying', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterSortBy> sortByIsNotifyingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNotifying', Sort.desc);
    });
  }
}

extension IsarBluetoothCharacteristicQuerySortThenBy on QueryBuilder<
    IsarBluetoothCharacteristic, IsarBluetoothCharacteristic, QSortThenBy> {
  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterSortBy> thenByCharacteristicUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characteristicUuid', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterSortBy> thenByCharacteristicUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characteristicUuid', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterSortBy> thenByIsNotifying() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNotifying', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QAfterSortBy> thenByIsNotifyingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNotifying', Sort.desc);
    });
  }
}

extension IsarBluetoothCharacteristicQueryWhereDistinct on QueryBuilder<
    IsarBluetoothCharacteristic, IsarBluetoothCharacteristic, QDistinct> {
  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QDistinct> distinctByCharacteristicUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'characteristicUuid',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QDistinct> distinctByContents() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contents');
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QDistinct> distinctByIsNotifying() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isNotifying');
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarBluetoothCharacteristic,
      QDistinct> distinctByLastValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastValue');
    });
  }
}

extension IsarBluetoothCharacteristicQueryProperty on QueryBuilder<
    IsarBluetoothCharacteristic, IsarBluetoothCharacteristic, QQueryProperty> {
  QueryBuilder<IsarBluetoothCharacteristic, int, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, String, QQueryOperations>
      characteristicUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'characteristicUuid');
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, List<int>, QQueryOperations>
      contentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contents');
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, bool, QQueryOperations>
      isNotifyingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isNotifying');
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, List<int>, QQueryOperations>
      lastValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastValue');
    });
  }

  QueryBuilder<IsarBluetoothCharacteristic, IsarCharacteristicProperties,
      QQueryOperations> propertiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'properties');
    });
  }
}
