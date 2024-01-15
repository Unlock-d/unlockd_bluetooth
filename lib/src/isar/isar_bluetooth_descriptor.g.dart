// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_bluetooth_descriptor.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

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
