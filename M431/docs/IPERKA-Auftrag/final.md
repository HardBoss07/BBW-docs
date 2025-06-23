# Information

## Familien Management Website

Webseite soll einem erlauben für ein Team verschiedene Aufträge zu erstellen, diese Aufträge auch wiederholend einzustellen. (z.B. Recycling in die Garage räumen nachfüllen, täglich)
Für Wetter abhängige Aufträge (z.B. mit dem Hund laufen gehen) wird eine Wetter API aufgerufen.
Webseite läuft über GitHub Pages mit einer Google Firebase Datenbank.

Wetter API: https://open-meteo.com
Datenbank: https://firebase.google.com

## Checkliste
| Kriterium                                   | Erledigt |
|---------------------------------------------|----------|
| 1. Wer will was von wem?                    | Ja       |
| 2. Wie lautet der Auftrag oder die Aufgabe? | Ja       |
| 3. Wozu dient das Produkt?                  | Ja       |
| 4. Wie muss es sein?                        | Ja       |
| 5. Wer nutzt es?                            | Ja       |
| 6. Wann muss es beendet sein?               | Nein     |

1. Wer: Vater, Wem: Mir (Matteo Bosshard), Was: Familien Management App ähnlich wie Bring (Einkaufslisten App)
2. Familien Management App
3. Zur Verwaltung von Ämtlis in einer Familie
4. Benutzerfreundlich, Simpel, WebApp für Mobile und Desktop, 
5. Meine Familie
6. Von Lehrer noch nicht festgelegt

# Planung

## Checkliste
| Kriterium                                             | Erledigt |
|-------------------------------------------------------|----------|
| 1. Welche Prioritäten hat der Auftrag?                | Ja       |
| 2. Welche Ressourcen stehen zur Verfügung?            | Ja       |
| 3. Wer bearbeitet welche Teilaufgaben?                | Ja       |
| 4. Ist die zeitliche Planung realistisch?             | Ja       |
| 5. Sind die Meilensteine zeitlich definiert?          | Ja       |
| 6. Welches sind die Prüfkriterien?                    | Ja       |

## 1. Prioritat
Der Auftrag hat eine Medium hohe Priorität, zumindest um eine einfache Familien Management WebApp zu gestalten

## 2. Ressourcen
Abgesehen von der Wetter API und dem Cloud Datenbank Service Firebase stehen mir keine weiteren Ressourcen zur Verfügung. Eventuell GitHup Pages zum Hosten der Website, jedoch ist dies nicht garantiert, weil GitHub Pages kein Server Side Code auslöst.

## 3. Teilaufgaben
Die Teilaufgaben liegen alleine bei mir, da ich alleine arbeite

## 4. Zeitplanung

| Aufgabe                                           | End-Datum            |
|---------------------------------------------------|----------------------|
| Grundlegende Komponente erstellen                 | 28.05.2025           |
| Implementierung der Komponente                    | 01.06.2025           |
| Testen der Komponente                             | 03.06.2025           |
| Implementierung zum Speichern zur Datenbank       | 06.06.2025           |
| Simples Styling zur Website erstellen             | 10.06.2025           |
| Abgabe                                            | Noch nicht definiert |


Realistisch: Ja

## 5. Meilensteine definieren

Die Meilensteine sind in der Zeitplanung definiert.

## 6. Prüfkriterien

Speichert die App nach dem Erstellen eines neuen Auftrages den Auftrag in der Datenbank?
Kann der aktuelle Status eines Auftrages geändert werden? (z.B. von Angefangen -> Erledigt)

# Entscheidung

## Verworfene Idee
### Auflistung der Ämtli statt Kanban-Board
Zuerst habe ich mir überlegt, eine simple Liste aller Aufgaben zu erstellen. Jedoch fande ich den spielerischen Aspekt von einem Kanban-Board deutlich besser. Es wirkt weniger strickt und monoton, die Aufgaben von Stufe zu Stufe mit Drag-And-Drop zu verschieben, statt über ein Hamburger-/Dropdown-Menü die Stufe zu ändern. Mit stufe meine ich, ob die Aufgabe abgeschlossen oder noch nicht gestartet ist. 

## Checkliste

| Kriterium                                                              | Erledigt |
|------------------------------------------------------------------------|----------|
| 1. Sind Kompetenzen und Entscheidungswege klar?                        | Mässig   |
| 2. Halten sich alle an die Vereinbarungen?                             | Ja       |
| 3. Ist akzeptiert und kommuniziert, welcher Weg eingeschlagen wird?    | Ja       |
| 4. Ist das Argumentarium erstellt und kommuniziert?                    | Ja       |
| 5. Sind die Abmachungen verhältnismässig und angepasst und verstanden? | Ja       |
| 6. Werden die Ressourcen optimal eingesetzt?                           | Mässig   |

# Realisation

Ich habe die Webseite vollständig umgesetzt und funktionsfähig gestaltet. Man kann neue Einträge erstellen, diese auf einem Kanban-Board per Drag-and-Drop verschieben und verwalten. Der aktuelle Status der Aufgaben wird dabei gespeichert und entsprechend aktualisiert. Zusätzlich wird ein externer Wetter-API-Endpoint eingebunden, um eine einfache, grafische Wettervorschau anzuzeigen. Das Design ist schlicht, aber benutzerfreundlich gehalten und auf Desktop sowie Mobile gut nutzbar. Der Code ist auf meinem GitHub Repository öffentlich einsehbar:
[Link zum Repository](https://github.com/HardBoss07/BBW-docs/tree/main/M431/projekte/iperka-auftrag)

# Kontrolle

Kontrollieren Sie das Projekt, dass die andere Person im "R" realisiert hat.
- Erstellen Sie zu den von Ihnen erstellten Testfällen (im P-Teil) ein Testprotokoll
- Beschreiben Sie, wie Ihnen die Website gefällt
    - Ist die Website so wie Sie sich das vorgestellt haben?
    - Macht die Website das was sie soll?
    - Akzeptieren Sie die Website gemäss ihrer Abnahmekriterien (P-Teil)?
    - Sind die optionalen Features (P-Teil) auch erfüllt?
- Falls Sie während dem R-Teil miteinander gesprochen haben um einen Prototypen der Website zusammen anzuschauen, den Sie dann verbessert haben, beschreiben Sie das.
- Falls etwas nicht funktioniert hat, wurde das von der anderen Person offen kommuniziert?

Beispiel für so eine Beschreibung:
- Erste Version der Website gezeigt, aber Textfeld hatte nach Buchtiteln statt nach Autor*innen gesucht
Nächste Version der Website gezeigt, Darstellung als Text war unübersichtlich, es sollte eine Tabelle sein

| Kriterium                       | Erfüllt |
|---------------------------------|---------|
| Gemäß Vorstellung?              | Ja      |
| Webseite erfüllt, was sie muss? | Ja      |
| Abnahmekriterien erfüllt?       | Ja      |
| Optionale Features erfüllt?     | Ja      |

## Beschreibung
Bei der Webseite kann man einfach neue Tasks erstellen und diese dynamisch auf einem Kanban-Board positionieren. Der Status der Tasks wird dann dynamisch geändert und gespeichert. Als Zusatzfeature wurde eine simple Wettervorschau erstellt, welche ebenfalls gut funktioniert. **Zusammengefasst: Auftrag mit erfolg erledigt.**

# Auswertung

Der Auftrag wurde erfolgreich abgeschlossen und mein Lehrer war mit dem Ergebnis zufrieden. Die wichtigsten Funktionen, wie das Erstellen und Verschieben von Aufgaben im Kanban-Board sowie die Wetteranzeige, funktionieren wie geplant. Die Website ist benutzerfreundlich und erfüllt die gestellten Anforderungen. Auch das zusätzliche Wetter-Feature wurde gut umgesetzt. Insgesamt wurde das Projektziel erreicht.

# Reflexion

Rückblickend hätte ich den Projektverlauf etwas besser strukturieren sollen. Ich habe teilweise die Zeit aus den Augen verloren und dadurch weniger effizient gearbeitet. Für künftige Projekte möchte ich den Ablauf klarer planen und regelmäßiger kontrollieren. Trotzdem bin ich stolz darauf, das Projekt selbstständig umgesetzt und viele neue Erfahrungen gesammelt zu haben.
