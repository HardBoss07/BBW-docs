# Notizen

## 19.02.2025
### Übungen gelöst
- 10.3.5 Weitere Übungen zu Normalformen

### Normalformen
1. Alle Attribute sind atomar -> keine Listen oder Mehrfachwerte
2. Nicht-Schlüssel Attribute müssen vom komplett Primärschlüssel abhängig sein
3. Jedes Attribut muss unabhängig von jedem anderen Attribut sein
4. Keine mehrwertigen Abhängigkeiten
5. Bei der Zerlegung der Tabellen dürfen keine Informationen verloren gehen.

## 05.03.2025
- Welche zwei Eigenschaften hat der Fremdschlüssel?
  - not null
  - unique
- Wieso spielen die gleichen Eigenschaften beim Primärschlüssel für die Definition der Assoziationen keine Rolle?
  - unique: jeder Datensatz muss an einem Identifikator aufrufbar sein
  - not null
- Erklären sie welche Eigenschaften hinter not null und unique stehen?
  - not null: Zelle muss einen Wert haben, die Zahl 0 ist ein Wert
  - unique: Zelle muss einen einzigartigen Wert haben, also kein Wert darf doppelt vorkommen
- Wie kann ich die beiden Eigenschaften bei einem Attribut in der Entwurfansicht konfigurieren?
  - Einstellen ob ein Attribut NULL sein darf oder nicht NULL sein darf
  - Sowie einstellen ob das Attribut einen Unique Index oder nur einen Index hat

### Sonstige Aktivitäten
Einführung zu Datenbankmanipulation ohne Webserver -> Desktop-Programme beziehungsweise Command-Line-Interfaces
DBeaver installiert und wenig damit herum gespielt gemäss Angaben vom Lehrer