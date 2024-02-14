// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar.dart';

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

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarBluetoothConfigCollection on Isar {
  IsarCollection<IsarBluetoothConfig> get isarBluetoothConfigs =>
      this.collection();
}

const IsarBluetoothConfigSchema = CollectionSchema(
  name: r'IsarBluetoothConfig',
  id: 2573151655210068383,
  properties: {
    r'adapterState': PropertySchema(
      id: 0,
      name: r'adapterState',
      type: IsarType.byte,
      enumMap: _IsarBluetoothConfigadapterStateEnumValueMap,
    ),
    r'isScanningNow': PropertySchema(
      id: 1,
      name: r'isScanningNow',
      type: IsarType.bool,
    )
  },
  estimateSize: _isarBluetoothConfigEstimateSize,
  serialize: _isarBluetoothConfigSerialize,
  deserialize: _isarBluetoothConfigDeserialize,
  deserializeProp: _isarBluetoothConfigDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'systemDevices': LinkSchema(
      id: 783536616162488305,
      name: r'systemDevices',
      target: r'IsarBluetoothDevice',
      single: false,
      linkName: r'config',
    ),
    r'scanResults': LinkSchema(
      id: -7230737069462294903,
      name: r'scanResults',
      target: r'IsarScanResult',
      single: false,
      linkName: r'config',
    )
  },
  embeddedSchemas: {},
  getId: _isarBluetoothConfigGetId,
  getLinks: _isarBluetoothConfigGetLinks,
  attach: _isarBluetoothConfigAttach,
  version: '3.1.0+1',
);

int _isarBluetoothConfigEstimateSize(
  IsarBluetoothConfig object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _isarBluetoothConfigSerialize(
  IsarBluetoothConfig object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.adapterState.index);
  writer.writeBool(offsets[1], object.isScanningNow);
}

IsarBluetoothConfig _isarBluetoothConfigDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarBluetoothConfig();
  object.adapterState = _IsarBluetoothConfigadapterStateValueEnumMap[
          reader.readByteOrNull(offsets[0])] ??
      UnlockdBluetoothAdapterState.unknown;
  object.id = id;
  object.isScanningNow = reader.readBool(offsets[1]);
  return object;
}

P _isarBluetoothConfigDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_IsarBluetoothConfigadapterStateValueEnumMap[
              reader.readByteOrNull(offset)] ??
          UnlockdBluetoothAdapterState.unknown) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarBluetoothConfigadapterStateEnumValueMap = {
  'unknown': 0,
  'unavailable': 1,
  'unauthorized': 2,
  'turningOn': 3,
  'on': 4,
  'turningOff': 5,
  'off': 6,
};
const _IsarBluetoothConfigadapterStateValueEnumMap = {
  0: UnlockdBluetoothAdapterState.unknown,
  1: UnlockdBluetoothAdapterState.unavailable,
  2: UnlockdBluetoothAdapterState.unauthorized,
  3: UnlockdBluetoothAdapterState.turningOn,
  4: UnlockdBluetoothAdapterState.on,
  5: UnlockdBluetoothAdapterState.turningOff,
  6: UnlockdBluetoothAdapterState.off,
};

Id _isarBluetoothConfigGetId(IsarBluetoothConfig object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarBluetoothConfigGetLinks(
    IsarBluetoothConfig object) {
  return [object.systemDevices, object.scanResults];
}

void _isarBluetoothConfigAttach(
    IsarCollection<dynamic> col, Id id, IsarBluetoothConfig object) {
  object.id = id;
  object.systemDevices.attach(
      col, col.isar.collection<IsarBluetoothDevice>(), r'systemDevices', id);
  object.scanResults
      .attach(col, col.isar.collection<IsarScanResult>(), r'scanResults', id);
}

extension IsarBluetoothConfigQueryWhereSort
    on QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QWhere> {
  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarBluetoothConfigQueryWhere
    on QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QWhereClause> {
  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterWhereClause>
      idBetween(
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

extension IsarBluetoothConfigQueryFilter on QueryBuilder<IsarBluetoothConfig,
    IsarBluetoothConfig, QFilterCondition> {
  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      adapterStateEqualTo(UnlockdBluetoothAdapterState value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adapterState',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      adapterStateGreaterThan(
    UnlockdBluetoothAdapterState value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'adapterState',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      adapterStateLessThan(
    UnlockdBluetoothAdapterState value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'adapterState',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      adapterStateBetween(
    UnlockdBluetoothAdapterState lower,
    UnlockdBluetoothAdapterState upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'adapterState',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      isScanningNowEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isScanningNow',
        value: value,
      ));
    });
  }
}

extension IsarBluetoothConfigQueryObject on QueryBuilder<IsarBluetoothConfig,
    IsarBluetoothConfig, QFilterCondition> {}

extension IsarBluetoothConfigQueryLinks on QueryBuilder<IsarBluetoothConfig,
    IsarBluetoothConfig, QFilterCondition> {
  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      systemDevices(FilterQuery<IsarBluetoothDevice> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'systemDevices');
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      systemDevicesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'systemDevices', length, true, length, true);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      systemDevicesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'systemDevices', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      systemDevicesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'systemDevices', 0, false, 999999, true);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      systemDevicesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'systemDevices', 0, true, length, include);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      systemDevicesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'systemDevices', length, include, 999999, true);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      systemDevicesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'systemDevices', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      scanResults(FilterQuery<IsarScanResult> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'scanResults');
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      scanResultsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'scanResults', length, true, length, true);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      scanResultsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'scanResults', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      scanResultsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'scanResults', 0, false, 999999, true);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      scanResultsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'scanResults', 0, true, length, include);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      scanResultsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'scanResults', length, include, 999999, true);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      scanResultsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'scanResults', lower, includeLower, upper, includeUpper);
    });
  }
}

extension IsarBluetoothConfigQuerySortBy
    on QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QSortBy> {
  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterSortBy>
      sortByAdapterState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adapterState', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterSortBy>
      sortByAdapterStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adapterState', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterSortBy>
      sortByIsScanningNow() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isScanningNow', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterSortBy>
      sortByIsScanningNowDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isScanningNow', Sort.desc);
    });
  }
}

extension IsarBluetoothConfigQuerySortThenBy
    on QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QSortThenBy> {
  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterSortBy>
      thenByAdapterState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adapterState', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterSortBy>
      thenByAdapterStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adapterState', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterSortBy>
      thenByIsScanningNow() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isScanningNow', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterSortBy>
      thenByIsScanningNowDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isScanningNow', Sort.desc);
    });
  }
}

extension IsarBluetoothConfigQueryWhereDistinct
    on QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QDistinct> {
  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QDistinct>
      distinctByAdapterState() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'adapterState');
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QDistinct>
      distinctByIsScanningNow() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isScanningNow');
    });
  }
}

extension IsarBluetoothConfigQueryProperty
    on QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QQueryProperty> {
  QueryBuilder<IsarBluetoothConfig, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarBluetoothConfig, UnlockdBluetoothAdapterState,
      QQueryOperations> adapterStateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'adapterState');
    });
  }

  QueryBuilder<IsarBluetoothConfig, bool, QQueryOperations>
      isScanningNowProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isScanningNow');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarBluetoothDescriptorCollection on Isar {
  IsarCollection<IsarBluetoothDescriptor> get isarBluetoothDescriptors =>
      this.collection();
}

const IsarBluetoothDescriptorSchema = CollectionSchema(
  name: r'IsarBluetoothDescriptor',
  id: 2284011941880992469,
  properties: {
    r'contents': PropertySchema(
      id: 0,
      name: r'contents',
      type: IsarType.longList,
    ),
    r'descriptorUuid': PropertySchema(
      id: 1,
      name: r'descriptorUuid',
      type: IsarType.string,
    ),
    r'lastValue': PropertySchema(
      id: 2,
      name: r'lastValue',
      type: IsarType.longList,
    )
  },
  estimateSize: _isarBluetoothDescriptorEstimateSize,
  serialize: _isarBluetoothDescriptorSerialize,
  deserialize: _isarBluetoothDescriptorDeserialize,
  deserializeProp: _isarBluetoothDescriptorDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'characteristic': LinkSchema(
      id: -3698085199506275601,
      name: r'characteristic',
      target: r'IsarBluetoothCharacteristic',
      single: true,
      linkName: r'isarDescriptors',
    )
  },
  embeddedSchemas: {},
  getId: _isarBluetoothDescriptorGetId,
  getLinks: _isarBluetoothDescriptorGetLinks,
  attach: _isarBluetoothDescriptorAttach,
  version: '3.1.0+1',
);

int _isarBluetoothDescriptorEstimateSize(
  IsarBluetoothDescriptor object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.contents.length * 8;
  bytesCount += 3 + object.descriptorUuid.length * 3;
  bytesCount += 3 + object.lastValue.length * 8;
  return bytesCount;
}

void _isarBluetoothDescriptorSerialize(
  IsarBluetoothDescriptor object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLongList(offsets[0], object.contents);
  writer.writeString(offsets[1], object.descriptorUuid);
  writer.writeLongList(offsets[2], object.lastValue);
}

IsarBluetoothDescriptor _isarBluetoothDescriptorDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarBluetoothDescriptor();
  object.contents = reader.readLongList(offsets[0]) ?? [];
  object.descriptorUuid = reader.readString(offsets[1]);
  object.id = id;
  return object;
}

P _isarBluetoothDescriptorDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongList(offset) ?? []) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLongList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarBluetoothDescriptorGetId(IsarBluetoothDescriptor object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarBluetoothDescriptorGetLinks(
    IsarBluetoothDescriptor object) {
  return [object.characteristic];
}

void _isarBluetoothDescriptorAttach(
    IsarCollection<dynamic> col, Id id, IsarBluetoothDescriptor object) {
  object.id = id;
  object.characteristic.attach(
      col,
      col.isar.collection<IsarBluetoothCharacteristic>(),
      r'characteristic',
      id);
}

extension IsarBluetoothDescriptorQueryWhereSort
    on QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor, QWhere> {
  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarBluetoothDescriptorQueryWhere on QueryBuilder<
    IsarBluetoothDescriptor, IsarBluetoothDescriptor, QWhereClause> {
  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
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

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
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

extension IsarBluetoothDescriptorQueryFilter on QueryBuilder<
    IsarBluetoothDescriptor, IsarBluetoothDescriptor, QFilterCondition> {
  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
      QAfterFilterCondition> contentsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contents',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
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

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
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

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
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

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
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

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
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

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
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

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
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

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
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

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
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

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
      QAfterFilterCondition> descriptorUuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descriptorUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
      QAfterFilterCondition> descriptorUuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descriptorUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
      QAfterFilterCondition> descriptorUuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descriptorUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
      QAfterFilterCondition> descriptorUuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descriptorUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
      QAfterFilterCondition> descriptorUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descriptorUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
      QAfterFilterCondition> descriptorUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descriptorUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
          QAfterFilterCondition>
      descriptorUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descriptorUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
          QAfterFilterCondition>
      descriptorUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descriptorUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
      QAfterFilterCondition> descriptorUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descriptorUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
      QAfterFilterCondition> descriptorUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descriptorUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
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

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
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

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
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

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
      QAfterFilterCondition> lastValueElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastValue',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
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

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
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

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
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

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
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

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
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

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
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

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
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

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
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

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
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

extension IsarBluetoothDescriptorQueryObject on QueryBuilder<
    IsarBluetoothDescriptor, IsarBluetoothDescriptor, QFilterCondition> {}

extension IsarBluetoothDescriptorQueryLinks on QueryBuilder<
    IsarBluetoothDescriptor, IsarBluetoothDescriptor, QFilterCondition> {
  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
          QAfterFilterCondition>
      characteristic(FilterQuery<IsarBluetoothCharacteristic> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'characteristic');
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor,
      QAfterFilterCondition> characteristicIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'characteristic', 0, true, 0, true);
    });
  }
}

extension IsarBluetoothDescriptorQuerySortBy
    on QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor, QSortBy> {
  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor, QAfterSortBy>
      sortByDescriptorUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptorUuid', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor, QAfterSortBy>
      sortByDescriptorUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptorUuid', Sort.desc);
    });
  }
}

extension IsarBluetoothDescriptorQuerySortThenBy on QueryBuilder<
    IsarBluetoothDescriptor, IsarBluetoothDescriptor, QSortThenBy> {
  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor, QAfterSortBy>
      thenByDescriptorUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptorUuid', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor, QAfterSortBy>
      thenByDescriptorUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptorUuid', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension IsarBluetoothDescriptorQueryWhereDistinct on QueryBuilder<
    IsarBluetoothDescriptor, IsarBluetoothDescriptor, QDistinct> {
  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor, QDistinct>
      distinctByContents() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contents');
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor, QDistinct>
      distinctByDescriptorUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descriptorUuid',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, IsarBluetoothDescriptor, QDistinct>
      distinctByLastValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastValue');
    });
  }
}

extension IsarBluetoothDescriptorQueryProperty on QueryBuilder<
    IsarBluetoothDescriptor, IsarBluetoothDescriptor, QQueryProperty> {
  QueryBuilder<IsarBluetoothDescriptor, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, List<int>, QQueryOperations>
      contentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contents');
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, String, QQueryOperations>
      descriptorUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descriptorUuid');
    });
  }

  QueryBuilder<IsarBluetoothDescriptor, List<int>, QQueryOperations>
      lastValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastValue');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarBluetoothDeviceCollection on Isar {
  IsarCollection<IsarBluetoothDevice> get isarBluetoothDevices =>
      this.collection();
}

const IsarBluetoothDeviceSchema = CollectionSchema(
  name: r'IsarBluetoothDevice',
  id: -5441148380203195866,
  properties: {
    r'advName': PropertySchema(
      id: 0,
      name: r'advName',
      type: IsarType.string,
    ),
    r'isarConnectionState': PropertySchema(
      id: 1,
      name: r'isarConnectionState',
      type: IsarType.byte,
      enumMap: _IsarBluetoothDeviceisarConnectionStateEnumValueMap,
    ),
    r'isarRssi': PropertySchema(
      id: 2,
      name: r'isarRssi',
      type: IsarType.long,
    ),
    r'mtuNow': PropertySchema(
      id: 3,
      name: r'mtuNow',
      type: IsarType.long,
    ),
    r'platformName': PropertySchema(
      id: 4,
      name: r'platformName',
      type: IsarType.string,
    ),
    r'remoteId': PropertySchema(
      id: 5,
      name: r'remoteId',
      type: IsarType.string,
    )
  },
  estimateSize: _isarBluetoothDeviceEstimateSize,
  serialize: _isarBluetoothDeviceSerialize,
  deserialize: _isarBluetoothDeviceDeserialize,
  deserializeProp: _isarBluetoothDeviceDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'config': LinkSchema(
      id: -1767006862236188093,
      name: r'config',
      target: r'IsarBluetoothConfig',
      single: true,
    ),
    r'result': LinkSchema(
      id: 1185798061306918438,
      name: r'result',
      target: r'IsarScanResult',
      single: true,
      linkName: r'isarBluetoothDevice',
    ),
    r'isarBluetoothServices': LinkSchema(
      id: -8463776439203429377,
      name: r'isarBluetoothServices',
      target: r'IsarBluetoothService',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _isarBluetoothDeviceGetId,
  getLinks: _isarBluetoothDeviceGetLinks,
  attach: _isarBluetoothDeviceAttach,
  version: '3.1.0+1',
);

int _isarBluetoothDeviceEstimateSize(
  IsarBluetoothDevice object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.advName.length * 3;
  bytesCount += 3 + object.platformName.length * 3;
  bytesCount += 3 + object.remoteId.length * 3;
  return bytesCount;
}

void _isarBluetoothDeviceSerialize(
  IsarBluetoothDevice object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.advName);
  writer.writeByte(offsets[1], object.isarConnectionState.index);
  writer.writeLong(offsets[2], object.isarRssi);
  writer.writeLong(offsets[3], object.mtuNow);
  writer.writeString(offsets[4], object.platformName);
  writer.writeString(offsets[5], object.remoteId);
}

IsarBluetoothDevice _isarBluetoothDeviceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarBluetoothDevice();
  object.advName = reader.readString(offsets[0]);
  object.id = id;
  object.isarConnectionState =
      _IsarBluetoothDeviceisarConnectionStateValueEnumMap[
              reader.readByteOrNull(offsets[1])] ??
          UnlockdBluetoothConnectionState.disconnected;
  object.isarRssi = reader.readLong(offsets[2]);
  object.mtuNow = reader.readLong(offsets[3]);
  object.platformName = reader.readString(offsets[4]);
  object.remoteId = reader.readString(offsets[5]);
  return object;
}

P _isarBluetoothDeviceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (_IsarBluetoothDeviceisarConnectionStateValueEnumMap[
              reader.readByteOrNull(offset)] ??
          UnlockdBluetoothConnectionState.disconnected) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarBluetoothDeviceisarConnectionStateEnumValueMap = {
  'disconnected': 0,
  'connected': 1,
};
const _IsarBluetoothDeviceisarConnectionStateValueEnumMap = {
  0: UnlockdBluetoothConnectionState.disconnected,
  1: UnlockdBluetoothConnectionState.connected,
};

Id _isarBluetoothDeviceGetId(IsarBluetoothDevice object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarBluetoothDeviceGetLinks(
    IsarBluetoothDevice object) {
  return [object.config, object.result, object.isarBluetoothServices];
}

void _isarBluetoothDeviceAttach(
    IsarCollection<dynamic> col, Id id, IsarBluetoothDevice object) {
  object.id = id;
  object.config
      .attach(col, col.isar.collection<IsarBluetoothConfig>(), r'config', id);
  object.result
      .attach(col, col.isar.collection<IsarScanResult>(), r'result', id);
  object.isarBluetoothServices.attach(
      col,
      col.isar.collection<IsarBluetoothService>(),
      r'isarBluetoothServices',
      id);
}

extension IsarBluetoothDeviceQueryWhereSort
    on QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QWhere> {
  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarBluetoothDeviceQueryWhere
    on QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QWhereClause> {
  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterWhereClause>
      idBetween(
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

extension IsarBluetoothDeviceQueryFilter on QueryBuilder<IsarBluetoothDevice,
    IsarBluetoothDevice, QFilterCondition> {
  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      advNameEqualTo(
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

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      advNameGreaterThan(
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

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      advNameLessThan(
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

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      advNameBetween(
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

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      advNameStartsWith(
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

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      advNameEndsWith(
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

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      advNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'advName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      advNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'advName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      advNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'advName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      advNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'advName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarConnectionStateEqualTo(UnlockdBluetoothConnectionState value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarConnectionState',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarConnectionStateGreaterThan(
    UnlockdBluetoothConnectionState value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarConnectionState',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarConnectionStateLessThan(
    UnlockdBluetoothConnectionState value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarConnectionState',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarConnectionStateBetween(
    UnlockdBluetoothConnectionState lower,
    UnlockdBluetoothConnectionState upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarConnectionState',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarRssiEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarRssi',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarRssiGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarRssi',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarRssiLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarRssi',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarRssiBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarRssi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      mtuNowEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mtuNow',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      mtuNowGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mtuNow',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      mtuNowLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mtuNow',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      mtuNowBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mtuNow',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      platformNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'platformName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      platformNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'platformName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      platformNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'platformName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      platformNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'platformName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      platformNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'platformName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      platformNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'platformName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      platformNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'platformName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      platformNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'platformName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      platformNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'platformName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      platformNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'platformName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      remoteIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      remoteIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      remoteIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      remoteIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remoteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      remoteIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      remoteIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      remoteIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      remoteIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }
}

extension IsarBluetoothDeviceQueryObject on QueryBuilder<IsarBluetoothDevice,
    IsarBluetoothDevice, QFilterCondition> {}

extension IsarBluetoothDeviceQueryLinks on QueryBuilder<IsarBluetoothDevice,
    IsarBluetoothDevice, QFilterCondition> {
  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      config(FilterQuery<IsarBluetoothConfig> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'config');
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      configIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'config', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      result(FilterQuery<IsarScanResult> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'result');
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      resultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'result', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarBluetoothServices(FilterQuery<IsarBluetoothService> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'isarBluetoothServices');
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarBluetoothServicesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'isarBluetoothServices', length, true, length, true);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarBluetoothServicesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'isarBluetoothServices', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarBluetoothServicesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'isarBluetoothServices', 0, false, 999999, true);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarBluetoothServicesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'isarBluetoothServices', 0, true, length, include);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarBluetoothServicesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'isarBluetoothServices', length, include, 999999, true);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarBluetoothServicesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'isarBluetoothServices', lower, includeLower, upper, includeUpper);
    });
  }
}

extension IsarBluetoothDeviceQuerySortBy
    on QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QSortBy> {
  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      sortByAdvName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advName', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      sortByAdvNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advName', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      sortByIsarConnectionState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarConnectionState', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      sortByIsarConnectionStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarConnectionState', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      sortByIsarRssi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarRssi', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      sortByIsarRssiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarRssi', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      sortByMtuNow() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mtuNow', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      sortByMtuNowDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mtuNow', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      sortByPlatformName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platformName', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      sortByPlatformNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platformName', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }
}

extension IsarBluetoothDeviceQuerySortThenBy
    on QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QSortThenBy> {
  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByAdvName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advName', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByAdvNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advName', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByIsarConnectionState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarConnectionState', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByIsarConnectionStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarConnectionState', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByIsarRssi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarRssi', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByIsarRssiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarRssi', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByMtuNow() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mtuNow', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByMtuNowDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mtuNow', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByPlatformName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platformName', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByPlatformNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platformName', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }
}

extension IsarBluetoothDeviceQueryWhereDistinct
    on QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QDistinct> {
  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QDistinct>
      distinctByAdvName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'advName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QDistinct>
      distinctByIsarConnectionState() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isarConnectionState');
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QDistinct>
      distinctByIsarRssi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isarRssi');
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QDistinct>
      distinctByMtuNow() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mtuNow');
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QDistinct>
      distinctByPlatformName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'platformName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QDistinct>
      distinctByRemoteId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }
}

extension IsarBluetoothDeviceQueryProperty
    on QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QQueryProperty> {
  QueryBuilder<IsarBluetoothDevice, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarBluetoothDevice, String, QQueryOperations>
      advNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'advName');
    });
  }

  QueryBuilder<IsarBluetoothDevice, UnlockdBluetoothConnectionState,
      QQueryOperations> isarConnectionStateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarConnectionState');
    });
  }

  QueryBuilder<IsarBluetoothDevice, int, QQueryOperations> isarRssiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarRssi');
    });
  }

  QueryBuilder<IsarBluetoothDevice, int, QQueryOperations> mtuNowProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mtuNow');
    });
  }

  QueryBuilder<IsarBluetoothDevice, String, QQueryOperations>
      platformNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'platformName');
    });
  }

  QueryBuilder<IsarBluetoothDevice, String, QQueryOperations>
      remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarBluetoothServiceCollection on Isar {
  IsarCollection<IsarBluetoothService> get isarBluetoothServices =>
      this.collection();
}

const IsarBluetoothServiceSchema = CollectionSchema(
  name: r'IsarBluetoothService',
  id: 3436405946443986691,
  properties: {
    r'serviceUuid': PropertySchema(
      id: 0,
      name: r'serviceUuid',
      type: IsarType.string,
    )
  },
  estimateSize: _isarBluetoothServiceEstimateSize,
  serialize: _isarBluetoothServiceSerialize,
  deserialize: _isarBluetoothServiceDeserialize,
  deserializeProp: _isarBluetoothServiceDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'device': LinkSchema(
      id: -6177908682823583364,
      name: r'device',
      target: r'IsarBluetoothDevice',
      single: true,
      linkName: r'isarBluetoothServices',
    ),
    r'isarCharacteristics': LinkSchema(
      id: 5859115804143440459,
      name: r'isarCharacteristics',
      target: r'IsarBluetoothCharacteristic',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _isarBluetoothServiceGetId,
  getLinks: _isarBluetoothServiceGetLinks,
  attach: _isarBluetoothServiceAttach,
  version: '3.1.0+1',
);

int _isarBluetoothServiceEstimateSize(
  IsarBluetoothService object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.serviceUuid.length * 3;
  return bytesCount;
}

void _isarBluetoothServiceSerialize(
  IsarBluetoothService object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.serviceUuid);
}

IsarBluetoothService _isarBluetoothServiceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarBluetoothService();
  object.id = id;
  object.serviceUuid = reader.readString(offsets[0]);
  return object;
}

P _isarBluetoothServiceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarBluetoothServiceGetId(IsarBluetoothService object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarBluetoothServiceGetLinks(
    IsarBluetoothService object) {
  return [object.device, object.isarCharacteristics];
}

void _isarBluetoothServiceAttach(
    IsarCollection<dynamic> col, Id id, IsarBluetoothService object) {
  object.id = id;
  object.device
      .attach(col, col.isar.collection<IsarBluetoothDevice>(), r'device', id);
  object.isarCharacteristics.attach(
      col,
      col.isar.collection<IsarBluetoothCharacteristic>(),
      r'isarCharacteristics',
      id);
}

extension IsarBluetoothServiceQueryWhereSort
    on QueryBuilder<IsarBluetoothService, IsarBluetoothService, QWhere> {
  QueryBuilder<IsarBluetoothService, IsarBluetoothService, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarBluetoothServiceQueryWhere
    on QueryBuilder<IsarBluetoothService, IsarBluetoothService, QWhereClause> {
  QueryBuilder<IsarBluetoothService, IsarBluetoothService, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<IsarBluetoothService, IsarBluetoothService, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService, QAfterWhereClause>
      idBetween(
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

extension IsarBluetoothServiceQueryFilter on QueryBuilder<IsarBluetoothService,
    IsarBluetoothService, QFilterCondition> {
  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
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

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
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

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
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

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> serviceUuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serviceUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> serviceUuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serviceUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> serviceUuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serviceUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> serviceUuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serviceUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> serviceUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'serviceUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> serviceUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'serviceUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
          QAfterFilterCondition>
      serviceUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serviceUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
          QAfterFilterCondition>
      serviceUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serviceUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> serviceUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serviceUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> serviceUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serviceUuid',
        value: '',
      ));
    });
  }
}

extension IsarBluetoothServiceQueryObject on QueryBuilder<IsarBluetoothService,
    IsarBluetoothService, QFilterCondition> {}

extension IsarBluetoothServiceQueryLinks on QueryBuilder<IsarBluetoothService,
    IsarBluetoothService, QFilterCondition> {
  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> device(FilterQuery<IsarBluetoothDevice> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'device');
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> deviceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'device', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
          QAfterFilterCondition>
      isarCharacteristics(FilterQuery<IsarBluetoothCharacteristic> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'isarCharacteristics');
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> isarCharacteristicsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'isarCharacteristics', length, true, length, true);
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> isarCharacteristicsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'isarCharacteristics', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> isarCharacteristicsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'isarCharacteristics', 0, false, 999999, true);
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> isarCharacteristicsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'isarCharacteristics', 0, true, length, include);
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> isarCharacteristicsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'isarCharacteristics', length, include, 999999, true);
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> isarCharacteristicsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'isarCharacteristics', lower, includeLower, upper, includeUpper);
    });
  }
}

extension IsarBluetoothServiceQuerySortBy
    on QueryBuilder<IsarBluetoothService, IsarBluetoothService, QSortBy> {
  QueryBuilder<IsarBluetoothService, IsarBluetoothService, QAfterSortBy>
      sortByServiceUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceUuid', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService, QAfterSortBy>
      sortByServiceUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceUuid', Sort.desc);
    });
  }
}

extension IsarBluetoothServiceQuerySortThenBy
    on QueryBuilder<IsarBluetoothService, IsarBluetoothService, QSortThenBy> {
  QueryBuilder<IsarBluetoothService, IsarBluetoothService, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService, QAfterSortBy>
      thenByServiceUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceUuid', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService, QAfterSortBy>
      thenByServiceUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceUuid', Sort.desc);
    });
  }
}

extension IsarBluetoothServiceQueryWhereDistinct
    on QueryBuilder<IsarBluetoothService, IsarBluetoothService, QDistinct> {
  QueryBuilder<IsarBluetoothService, IsarBluetoothService, QDistinct>
      distinctByServiceUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serviceUuid', caseSensitive: caseSensitive);
    });
  }
}

extension IsarBluetoothServiceQueryProperty on QueryBuilder<
    IsarBluetoothService, IsarBluetoothService, QQueryProperty> {
  QueryBuilder<IsarBluetoothService, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarBluetoothService, String, QQueryOperations>
      serviceUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serviceUuid');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarScanResultCollection on Isar {
  IsarCollection<IsarScanResult> get isarScanResults => this.collection();
}

const IsarScanResultSchema = CollectionSchema(
  name: r'IsarScanResult',
  id: -5655166113946608760,
  properties: {
    r'advertisementData': PropertySchema(
      id: 0,
      name: r'advertisementData',
      type: IsarType.object,
      target: r'IsarAdvertisementData',
    ),
    r'rssi': PropertySchema(
      id: 1,
      name: r'rssi',
      type: IsarType.long,
    )
  },
  estimateSize: _isarScanResultEstimateSize,
  serialize: _isarScanResultSerialize,
  deserialize: _isarScanResultDeserialize,
  deserializeProp: _isarScanResultDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'config': LinkSchema(
      id: 7838791966144850973,
      name: r'config',
      target: r'IsarBluetoothConfig',
      single: true,
    ),
    r'isarBluetoothDevice': LinkSchema(
      id: 5467893657917355572,
      name: r'isarBluetoothDevice',
      target: r'IsarBluetoothDevice',
      single: true,
    )
  },
  embeddedSchemas: {
    r'IsarAdvertisementData': IsarAdvertisementDataSchema,
    r'IsarManufacturerData': IsarManufacturerDataSchema,
    r'IsarServiceData': IsarServiceDataSchema
  },
  getId: _isarScanResultGetId,
  getLinks: _isarScanResultGetLinks,
  attach: _isarScanResultAttach,
  version: '3.1.0+1',
);

int _isarScanResultEstimateSize(
  IsarScanResult object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      IsarAdvertisementDataSchema.estimateSize(object.advertisementData,
          allOffsets[IsarAdvertisementData]!, allOffsets);
  return bytesCount;
}

void _isarScanResultSerialize(
  IsarScanResult object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<IsarAdvertisementData>(
    offsets[0],
    allOffsets,
    IsarAdvertisementDataSchema.serialize,
    object.advertisementData,
  );
  writer.writeLong(offsets[1], object.rssi);
}

IsarScanResult _isarScanResultDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarScanResult();
  object.advertisementData = reader.readObjectOrNull<IsarAdvertisementData>(
        offsets[0],
        IsarAdvertisementDataSchema.deserialize,
        allOffsets,
      ) ??
      IsarAdvertisementData();
  object.id = id;
  object.rssi = reader.readLong(offsets[1]);
  return object;
}

P _isarScanResultDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<IsarAdvertisementData>(
            offset,
            IsarAdvertisementDataSchema.deserialize,
            allOffsets,
          ) ??
          IsarAdvertisementData()) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarScanResultGetId(IsarScanResult object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarScanResultGetLinks(IsarScanResult object) {
  return [object.config, object.isarBluetoothDevice];
}

void _isarScanResultAttach(
    IsarCollection<dynamic> col, Id id, IsarScanResult object) {
  object.id = id;
  object.config
      .attach(col, col.isar.collection<IsarBluetoothConfig>(), r'config', id);
  object.isarBluetoothDevice.attach(col,
      col.isar.collection<IsarBluetoothDevice>(), r'isarBluetoothDevice', id);
}

extension IsarScanResultQueryWhereSort
    on QueryBuilder<IsarScanResult, IsarScanResult, QWhere> {
  QueryBuilder<IsarScanResult, IsarScanResult, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarScanResultQueryWhere
    on QueryBuilder<IsarScanResult, IsarScanResult, QWhereClause> {
  QueryBuilder<IsarScanResult, IsarScanResult, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarScanResult, IsarScanResult, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<IsarScanResult, IsarScanResult, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarScanResult, IsarScanResult, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarScanResult, IsarScanResult, QAfterWhereClause> idBetween(
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

extension IsarScanResultQueryFilter
    on QueryBuilder<IsarScanResult, IsarScanResult, QFilterCondition> {
  QueryBuilder<IsarScanResult, IsarScanResult, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarScanResult, IsarScanResult, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<IsarScanResult, IsarScanResult, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<IsarScanResult, IsarScanResult, QAfterFilterCondition> idBetween(
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

  QueryBuilder<IsarScanResult, IsarScanResult, QAfterFilterCondition>
      rssiEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rssi',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarScanResult, IsarScanResult, QAfterFilterCondition>
      rssiGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rssi',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarScanResult, IsarScanResult, QAfterFilterCondition>
      rssiLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rssi',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarScanResult, IsarScanResult, QAfterFilterCondition>
      rssiBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rssi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarScanResultQueryObject
    on QueryBuilder<IsarScanResult, IsarScanResult, QFilterCondition> {
  QueryBuilder<IsarScanResult, IsarScanResult, QAfterFilterCondition>
      advertisementData(FilterQuery<IsarAdvertisementData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'advertisementData');
    });
  }
}

extension IsarScanResultQueryLinks
    on QueryBuilder<IsarScanResult, IsarScanResult, QFilterCondition> {
  QueryBuilder<IsarScanResult, IsarScanResult, QAfterFilterCondition> config(
      FilterQuery<IsarBluetoothConfig> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'config');
    });
  }

  QueryBuilder<IsarScanResult, IsarScanResult, QAfterFilterCondition>
      configIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'config', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarScanResult, IsarScanResult, QAfterFilterCondition>
      isarBluetoothDevice(FilterQuery<IsarBluetoothDevice> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'isarBluetoothDevice');
    });
  }

  QueryBuilder<IsarScanResult, IsarScanResult, QAfterFilterCondition>
      isarBluetoothDeviceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'isarBluetoothDevice', 0, true, 0, true);
    });
  }
}

extension IsarScanResultQuerySortBy
    on QueryBuilder<IsarScanResult, IsarScanResult, QSortBy> {
  QueryBuilder<IsarScanResult, IsarScanResult, QAfterSortBy> sortByRssi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rssi', Sort.asc);
    });
  }

  QueryBuilder<IsarScanResult, IsarScanResult, QAfterSortBy> sortByRssiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rssi', Sort.desc);
    });
  }
}

extension IsarScanResultQuerySortThenBy
    on QueryBuilder<IsarScanResult, IsarScanResult, QSortThenBy> {
  QueryBuilder<IsarScanResult, IsarScanResult, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarScanResult, IsarScanResult, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarScanResult, IsarScanResult, QAfterSortBy> thenByRssi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rssi', Sort.asc);
    });
  }

  QueryBuilder<IsarScanResult, IsarScanResult, QAfterSortBy> thenByRssiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rssi', Sort.desc);
    });
  }
}

extension IsarScanResultQueryWhereDistinct
    on QueryBuilder<IsarScanResult, IsarScanResult, QDistinct> {
  QueryBuilder<IsarScanResult, IsarScanResult, QDistinct> distinctByRssi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rssi');
    });
  }
}

extension IsarScanResultQueryProperty
    on QueryBuilder<IsarScanResult, IsarScanResult, QQueryProperty> {
  QueryBuilder<IsarScanResult, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarScanResult, IsarAdvertisementData, QQueryOperations>
      advertisementDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'advertisementData');
    });
  }

  QueryBuilder<IsarScanResult, int, QQueryOperations> rssiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rssi');
    });
  }
}

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

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IsarCharacteristicPropertiesSchema = Schema(
  name: r'IsarCharacteristicProperties',
  id: -4892580717927563823,
  properties: {
    r'authenticatedSignedWrites': PropertySchema(
      id: 0,
      name: r'authenticatedSignedWrites',
      type: IsarType.bool,
    ),
    r'broadcast': PropertySchema(
      id: 1,
      name: r'broadcast',
      type: IsarType.bool,
    ),
    r'extendedProperties': PropertySchema(
      id: 2,
      name: r'extendedProperties',
      type: IsarType.bool,
    ),
    r'indicate': PropertySchema(
      id: 3,
      name: r'indicate',
      type: IsarType.bool,
    ),
    r'indicateEncryptionRequired': PropertySchema(
      id: 4,
      name: r'indicateEncryptionRequired',
      type: IsarType.bool,
    ),
    r'notify': PropertySchema(
      id: 5,
      name: r'notify',
      type: IsarType.bool,
    ),
    r'notifyEncryptionRequired': PropertySchema(
      id: 6,
      name: r'notifyEncryptionRequired',
      type: IsarType.bool,
    ),
    r'read': PropertySchema(
      id: 7,
      name: r'read',
      type: IsarType.bool,
    ),
    r'write': PropertySchema(
      id: 8,
      name: r'write',
      type: IsarType.bool,
    ),
    r'writeWithoutResponse': PropertySchema(
      id: 9,
      name: r'writeWithoutResponse',
      type: IsarType.bool,
    )
  },
  estimateSize: _isarCharacteristicPropertiesEstimateSize,
  serialize: _isarCharacteristicPropertiesSerialize,
  deserialize: _isarCharacteristicPropertiesDeserialize,
  deserializeProp: _isarCharacteristicPropertiesDeserializeProp,
);

int _isarCharacteristicPropertiesEstimateSize(
  IsarCharacteristicProperties object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _isarCharacteristicPropertiesSerialize(
  IsarCharacteristicProperties object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.authenticatedSignedWrites);
  writer.writeBool(offsets[1], object.broadcast);
  writer.writeBool(offsets[2], object.extendedProperties);
  writer.writeBool(offsets[3], object.indicate);
  writer.writeBool(offsets[4], object.indicateEncryptionRequired);
  writer.writeBool(offsets[5], object.notify);
  writer.writeBool(offsets[6], object.notifyEncryptionRequired);
  writer.writeBool(offsets[7], object.read);
  writer.writeBool(offsets[8], object.write);
  writer.writeBool(offsets[9], object.writeWithoutResponse);
}

IsarCharacteristicProperties _isarCharacteristicPropertiesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarCharacteristicProperties();
  object.authenticatedSignedWrites = reader.readBool(offsets[0]);
  object.broadcast = reader.readBool(offsets[1]);
  object.extendedProperties = reader.readBool(offsets[2]);
  object.indicate = reader.readBool(offsets[3]);
  object.indicateEncryptionRequired = reader.readBool(offsets[4]);
  object.notify = reader.readBool(offsets[5]);
  object.notifyEncryptionRequired = reader.readBool(offsets[6]);
  object.read = reader.readBool(offsets[7]);
  object.write = reader.readBool(offsets[8]);
  object.writeWithoutResponse = reader.readBool(offsets[9]);
  return object;
}

P _isarCharacteristicPropertiesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IsarCharacteristicPropertiesQueryFilter on QueryBuilder<
    IsarCharacteristicProperties,
    IsarCharacteristicProperties,
    QFilterCondition> {
  QueryBuilder<IsarCharacteristicProperties, IsarCharacteristicProperties,
      QAfterFilterCondition> authenticatedSignedWritesEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authenticatedSignedWrites',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarCharacteristicProperties, IsarCharacteristicProperties,
      QAfterFilterCondition> broadcastEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'broadcast',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarCharacteristicProperties, IsarCharacteristicProperties,
      QAfterFilterCondition> extendedPropertiesEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'extendedProperties',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarCharacteristicProperties, IsarCharacteristicProperties,
      QAfterFilterCondition> indicateEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'indicate',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarCharacteristicProperties, IsarCharacteristicProperties,
      QAfterFilterCondition> indicateEncryptionRequiredEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'indicateEncryptionRequired',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarCharacteristicProperties, IsarCharacteristicProperties,
      QAfterFilterCondition> notifyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notify',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarCharacteristicProperties, IsarCharacteristicProperties,
      QAfterFilterCondition> notifyEncryptionRequiredEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notifyEncryptionRequired',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarCharacteristicProperties, IsarCharacteristicProperties,
      QAfterFilterCondition> readEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'read',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarCharacteristicProperties, IsarCharacteristicProperties,
      QAfterFilterCondition> writeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'write',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarCharacteristicProperties, IsarCharacteristicProperties,
      QAfterFilterCondition> writeWithoutResponseEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'writeWithoutResponse',
        value: value,
      ));
    });
  }
}

extension IsarCharacteristicPropertiesQueryObject on QueryBuilder<
    IsarCharacteristicProperties,
    IsarCharacteristicProperties,
    QFilterCondition> {}

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

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IsarServiceDataSchema = Schema(
  name: r'IsarServiceData',
  id: -5477421779193740906,
  properties: {
    r'serviceGuid': PropertySchema(
      id: 0,
      name: r'serviceGuid',
      type: IsarType.string,
    ),
    r'value': PropertySchema(
      id: 1,
      name: r'value',
      type: IsarType.longList,
    )
  },
  estimateSize: _isarServiceDataEstimateSize,
  serialize: _isarServiceDataSerialize,
  deserialize: _isarServiceDataDeserialize,
  deserializeProp: _isarServiceDataDeserializeProp,
);

int _isarServiceDataEstimateSize(
  IsarServiceData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.serviceGuid.length * 3;
  bytesCount += 3 + object.value.length * 8;
  return bytesCount;
}

void _isarServiceDataSerialize(
  IsarServiceData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.serviceGuid);
  writer.writeLongList(offsets[1], object.value);
}

IsarServiceData _isarServiceDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarServiceData();
  object.serviceGuid = reader.readString(offsets[0]);
  object.value = reader.readLongList(offsets[1]) ?? [];
  return object;
}

P _isarServiceDataDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IsarServiceDataQueryFilter
    on QueryBuilder<IsarServiceData, IsarServiceData, QFilterCondition> {
  QueryBuilder<IsarServiceData, IsarServiceData, QAfterFilterCondition>
      serviceGuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serviceGuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarServiceData, IsarServiceData, QAfterFilterCondition>
      serviceGuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serviceGuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarServiceData, IsarServiceData, QAfterFilterCondition>
      serviceGuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serviceGuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarServiceData, IsarServiceData, QAfterFilterCondition>
      serviceGuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serviceGuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarServiceData, IsarServiceData, QAfterFilterCondition>
      serviceGuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'serviceGuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarServiceData, IsarServiceData, QAfterFilterCondition>
      serviceGuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'serviceGuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarServiceData, IsarServiceData, QAfterFilterCondition>
      serviceGuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serviceGuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarServiceData, IsarServiceData, QAfterFilterCondition>
      serviceGuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serviceGuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarServiceData, IsarServiceData, QAfterFilterCondition>
      serviceGuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serviceGuid',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarServiceData, IsarServiceData, QAfterFilterCondition>
      serviceGuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serviceGuid',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarServiceData, IsarServiceData, QAfterFilterCondition>
      valueElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarServiceData, IsarServiceData, QAfterFilterCondition>
      valueElementGreaterThan(
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

  QueryBuilder<IsarServiceData, IsarServiceData, QAfterFilterCondition>
      valueElementLessThan(
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

  QueryBuilder<IsarServiceData, IsarServiceData, QAfterFilterCondition>
      valueElementBetween(
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

  QueryBuilder<IsarServiceData, IsarServiceData, QAfterFilterCondition>
      valueLengthEqualTo(int length) {
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

  QueryBuilder<IsarServiceData, IsarServiceData, QAfterFilterCondition>
      valueIsEmpty() {
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

  QueryBuilder<IsarServiceData, IsarServiceData, QAfterFilterCondition>
      valueIsNotEmpty() {
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

  QueryBuilder<IsarServiceData, IsarServiceData, QAfterFilterCondition>
      valueLengthLessThan(
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

  QueryBuilder<IsarServiceData, IsarServiceData, QAfterFilterCondition>
      valueLengthGreaterThan(
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

  QueryBuilder<IsarServiceData, IsarServiceData, QAfterFilterCondition>
      valueLengthBetween(
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

extension IsarServiceDataQueryObject
    on QueryBuilder<IsarServiceData, IsarServiceData, QFilterCondition> {}
