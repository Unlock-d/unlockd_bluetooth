// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_characteristic_properties.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

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
