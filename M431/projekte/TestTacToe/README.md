# TestTacToe - ein TicTacToe-Libraryprojekt um Testen zu üben

Es gibt eine Klasse `TicTacToeCheck` die unvollständig ist.
Dazu gibt es eine Klasse `TicTacToeCheckTest` die die Klasse `TicTacToeCheck` testet, aber auch nicht ausreichend.

Wir editieren beide Klassen bis wir zufrieden sind.

Tests können aus der Klasse `TicTacToeCheckTest` gestartet werden mit Shift-F10 (Run)

## TestTacToe Interface
Die Klasse `TicTacToeCheck` hat 2 Methoden die als Interface der Bibliothek gelten: 
* `hasFinished`
* `whoWon`

Diese können mit Integrationstests (und Unittests) getestet werden.

Dann gibt es mehrere Methoden, die nicht zum Interface gehören, aber getestet werden können (z.B. `checkRows`).
Diese können mit Unittests getestet werden.

Dann gibt es interne (`private`) Methoden, die nicht (direkt) getestet werden können.