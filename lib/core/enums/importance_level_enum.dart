enum ImportanceLevel{extreme,very,pretty,normal,less}

List<ImportanceLevel> get importanceLevelValuesInImportanceOrder{
  return [
    ImportanceLevel.extreme,
    ImportanceLevel.very,
    ImportanceLevel.pretty,
    ImportanceLevel.normal,
    ImportanceLevel.less
  ];
}