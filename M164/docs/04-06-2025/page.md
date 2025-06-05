# 04.06.2025

```
                          +-------------+
                          |   HAFEN     |
                          +-------------+
                          | id (PK)     |
                          | name        |
                          | parent_id   |<---+
                          +-------------+    |
                                ^            |
                                |            | rekursive m:1
                                +------------+

                              1 |        | *  
                          +-------------+        +----------------+
                          | LIEGEPLATZ  |        |     BOOT       |
                          +-------------+        +----------------+
                          | id (PK)     |        | id (PK)        |
                          | hafen_id FK |<------<| hafen_id (FK)  |
                          +-------------+        | name           |
                                                 | typ ENUM       |
                                                 +----------------+
                                                      ^      
                                                      |      
                       +----------------+-------------+-------------+----------------+
                       |                |                           |                |
                       |                |                           |                |
             +----------------+   +----------------+       +----------------+   +----------------+
             |   VONBIS       |   |  BESITZT       |       |  REPARIERT     |   |  PERSON        |
             +----------------+   +----------------+       +----------------+   +----------------+
             | boot_id (FK)   |   | person_id (PK) |       | person_id (FK) |   | id (PK)        |
             | liegeplatz_id  |   | boot_id (FK)   |       | boot_id (FK)   |   | name           |
             | von (DATE)     |   +----------------+       +----------------+   +----------------+
             | bis (DATE)     |
             +----------------+

*Liegeplatz --< VONBIS >-- Boot        (c:c Beziehung mit Zeitintervall)
*Person    --< BESITZT >-- Boot        (m:0..1 Beziehung)
*Person    --< REPARIERT >-- Boot      (m:n Beziehung)

Vererbung (Boot):
            +----------------+         +----------------+
            |  MOTORBOOT     |         |  SEGELBOOT     |
            +----------------+         +----------------+
            | boot_id (PK/FK)|         | boot_id (PK/FK)|
            | ps             |         | segelfläche    |
            +----------------+         +----------------+

```
Legende:

* PK = Primärschlüssel
* FK = Fremdschlüssel
* --< und >-- = Beziehungen (1:n oder m:n)
* ^ = Vererbung (is-a)
* | L = Links (Darstellung einer Beziehung)
* c:c = zeitlich gebundene Beziehung via VonBis
* m:n = viele-zu-viele
* m:1, m:0..1 etc. = Kardinalitäten