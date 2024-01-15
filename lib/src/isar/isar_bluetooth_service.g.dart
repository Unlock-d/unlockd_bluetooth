// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_bluetooth_service.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

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
    ),
    r'uuid': PropertySchema(
      id: 1,
      name: r'uuid',
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
  bytesCount += 3 + object.uuid.length * 3;
  return bytesCount;
}

void _isarBluetoothServiceSerialize(
  IsarBluetoothService object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.serviceUuid);
  writer.writeString(offsets[1], object.uuid);
}

IsarBluetoothService _isarBluetoothServiceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarBluetoothService();
  object.id = id;
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
    case 1:
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

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> uuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> uuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> uuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> uuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> uuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> uuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
          QAfterFilterCondition>
      uuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
          QAfterFilterCondition>
      uuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService,
      QAfterFilterCondition> uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
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

  QueryBuilder<IsarBluetoothService, IsarBluetoothService, QAfterSortBy>
      sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService, QAfterSortBy>
      sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
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

  QueryBuilder<IsarBluetoothService, IsarBluetoothService, QAfterSortBy>
      thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothService, IsarBluetoothService, QAfterSortBy>
      thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
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

  QueryBuilder<IsarBluetoothService, IsarBluetoothService, QDistinct>
      distinctByUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
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

  QueryBuilder<IsarBluetoothService, String, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}
