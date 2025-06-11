# Sakila Datenbank Analyse

**Kurze Antworten:**

1. **Tabellen**: DVD-Verleihsystem mit Filmen, Schauspielern, Kunden, Verleihvorgängen
2. **Beziehungen**: 
   - `rental` verknüpft Kunden mit Filmen
   - `payment` gehört zu `rental`
3. **Datenumfang**: 
   - 1000+ Filme
   - 16000+ Verleihvorgänge
4. **Zweck**: Modelliert einen DVD-Verleihshop mit komplettem Workflow von Ausleihe bis Rückgabe

**Business Prozess:**
1. Kunde sucht Film (film)
2. Mitarbeiter erfasst Ausleihe (rental)
3. System verwaltet Zahlung (payment)
4. Bei Rückgabe Update (return_date in rental)