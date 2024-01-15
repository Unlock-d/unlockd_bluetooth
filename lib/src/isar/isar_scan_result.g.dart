// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_scan_result.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

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
