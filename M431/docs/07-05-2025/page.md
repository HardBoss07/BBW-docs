# Projektjournal: Eigene Kodierung zur Parkplatzverwaltung

## 1. Projektübersicht

### 1.1 Projekttitel
**Entwicklung eines digitalen Kodierungssystems für mietbare Parkplätze**

### 1.2 Projektziel
Ziel ist die Entwicklung einer voll funktionsfähigen WebApp zur Verwaltung und Erkennung von Mietparkplatz-Codes. Diese Codes enthalten Informationen über Ort, Stellplatz, und Mietdauer. Die Anwendung umfasst:
- **Code-Generierung**
- **Code-Validierung**
- **Barcode-Scan (Code 128)**
- **Klartext-Formatierung**

## 2. Nutzen des Projektjournals

Das Projektjournal dient der Dokumentation und Reflexion. Es ermöglicht:
- Nachvollziehbarkeit des Projektablaufs
- Beurteilung des Projektfortschritts
- Reflexion über technische und methodische Entscheidungen
- Übersicht über verwendete Mittel und Funktionen

## 3. Projektverlauf

### 3.1 Startdatum
**16.04.2025**

### 3.2 Projektleitung
**Matteo Bosshard**

### 3.3 Arbeitsschritte

#### 16.04.2025 – Projektstart
- Projektidee formuliert
- Anforderungen an Kodierung definiert

#### 16.04.2025 – Struktur der Kodierung
Kodierung besteht aus 6 Teilen:
1. City-Code (z. B. `WINT` für Winterthur)
2. Parkhaus-Code (z. B. `HB` für Hauptbahnhof)
3. Parkdeck (z. B. `02`)
4. Parkplatznummer (z. B. `103`)
5. Mietstart (z. B. `0425` = April 2025)
6. Mietende (z. B. `0625` = Juni 2025)

Beispielcode: `WINT-NW-02-103-0425-0625`

#### 28.04.2025 – Code-Generator umgesetzt
- Benutzer kann zwischen verschiedenen Code-Formaten wie Code 128, QR-Code und Data Matrix auswählen.
- Die Eingabe des Codes erfolgt über ein Textfeld, in dem der fertige Code direkt eingegeben werden kann.
- Nach der Eingabe wird der Code sofort als entsprechender Barcode angezeigt.

#### 06.05.2025 – Technische Umsetzung gestartet
- Erste Webkomponenten erstellt
- Formatierungslogik in `Formatter.ts` umgesetzt
- Scannerfunktion integriert (Code 128)

#### 06.05.2025 – Validierungslogik in `Decoder.ts`
- Prüfung auf Code-Länge, Format, Wertebereiche (z. B. Monatsgrenzen)
- Ausgabe: `INVALID BARCODE` bei Fehlern

## 4. Besonderheiten und Erweiterungen

- Barcode-Scanner mit Kameraunterstützung
- Echtzeit-Codeprüfung bei Eingabe
- Nutzerfreundliche Oberfläche mit visueller Rückmeldung
- Modularer Codeaufbau (Generator, Formatter, Decoder, UI)

## 5. Technische Umsetzung

### WebApp-Funktionen:

| Funktion            | Beschreibung                                                    |
|---------------------|-----------------------------------------------------------------|
| Code-Generierung    | Benutzer erstellt neuen Code durch Auswahlfelder                |
| Code-Validierung    | Prüfung auf Struktur, Monatswerte und Gesamtlänge               |
| Code-Scanner        | Barcode-Scanner liest Code 128 per Kamera                       |
| Formatierung        | Klartext-Ausgabe mit vollständigen Namen und lesbarer Mietdauer |

### Module:

#### `Formatter.ts`
- Wandelt gültigen Barcode in lesbare Zeilen um
- Zeigt Stadt- und Parkhausnamen
- Formatiert Mietdaten in `Monat Jahr`

#### `Decoder.ts`
- `decode()` prüft Code und ruft `format()` nur bei gültigem Code auf
- `validate()` überprüft:
  - Länge: 24 Zeichen
  - 6 Segmente mit passendem Format
  - Monatsbereich (01–12)

#### Beispielcode `WINT-NW-02-103-0425-0625` ergibt:
```
City Code: WINT (Winterthur)
Parkhaus-Code: HB (Hauptbahnhof)
Parkdeck: 02
Parkplatz: 103
Mietstart: April 2025
Mietende: Juni 2025
```
#### Beispielcode `ZURH-HB-01-048-0725-0126` ergibt:
```
City Code: ZURH (Zürich)
Parkhaus-Code: HB (Hauptbahnhof)
Parkdeck: 01
Parkplatz: 048
Mietstart: Juli 2025
Mietende: Januar 2026
```
#### Beispielcode `BRLN-SO-05-007-0125-0525` ergibt:
```
City Code: BRLN (Berlin)
Parkhaus-Code: SO (Süd)
Parkdeck: 05
Parkplatz: 007
Mietstart: Januar 2025
Mietende: Mai 2025
```

## 6. Reflexion

Die WebApp ist ein vollständiges Tool für die Verwaltung von Parkplatzvermietungen. Die Struktur ist klar verständlich, die Logik zuverlässig und der Nutzen praxisnah. Die Validierung verhindert Eingabefehler, der Scanner erleichtert den Betrieb im Alltag. Besonders hervorzuheben ist die saubere Trennung von Daten, Logik und Präsentation.

## 7. Aktueller Stand

| Teilaufgabe                       | Status        |
|-----------------------------------|---------------|
| Projektidee & Zieldefinition      | Abgeschlossen |
| Kodierungsstruktur entworfen      | Abgeschlossen |
| Validierungslogik entwickelt      | Abgeschlossen |
| Barcode-Scanner implementiert     | Abgeschlossen |
| Formatter zur Code-Interpretation | Abgeschlossen |
| Code-Generierungsmodul            | Abgeschlossen |
| WebApp fertiggestellt             | Abgeschlossen |

## 8. Fazit

Das Projekt wurde erfolgreich umgesetzt. Die WebApp bietet Funktionen zur **Erstellung, Validierung, Anzeige und Erkennung** von Mietparkplatz-Codes. Sie ist modular, erweiterbar und praxistauglich. Das Ziel, ein funktionales und benutzerfreundliches Verwaltungssystem zu entwickeln, wurde vollständig erreicht.

## 9. Zugriff auf die WebApp

Die vollständige Anwendung ist hier verfügbar:

**[WebApp öffnen](https://hardboss07.github.io/barcode-reader/)**

Hinweis: Die Anwendung funktioniert optimal auf iOS und Desktop Geräten mit Kamera und unterstützt diverse Barcode Formate.