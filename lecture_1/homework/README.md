# Zadanie domowe z pierwszego wykładu

Twoim pierwszym zadaniem będzie stworzenie API, które pomoże Szogunowi w zarządzaniu samurajami. W tym folderze znajduje się zainicjowana aplikacja railsowa. Zaimplementuj funkcjonalności potrzebne do spełnienia wymagań Szoguna:

- W systemie będą przechowywane klany, które mają swoją nazwę i należy do nich wielu samurajów. 
- Samuraje posiadają swoje imię, jakość używanego pancerza(0..1000), liczbę stoczonych bitew, datę dołączenia i datę śmierci (null oznacza, że nadal jest żywy).
- API powinno dawać możliwość tworzenia nowych klanów w systemie i wyświetlania wszystkich klanów
- API udostępnia cały CRUD (wyświetlanie, tworzenie, aktualizacja, niszczenie) dla samurajów w klanach (Pamiętaj o odpowiednich zagnieżdżeniach w ścieżkach - nie chcemy, żeby Szogun musiał domyślać się jak wykonać potrzebne akcje!).
- Dodatkowo, endpoint wyświetlający wszystkich samurajów w klanie powinien umożliwiać wyświetlenie tylko żywych lub tylko martwych samurajów w wybranym klanie.
- Należy pamiętać, że Szogun nie lubi oglądać 500-tek w api. Zaimplementuj akcje create i update w taki sposób, aby zwróciły status 422 i error według własnego uznania jeśli coś pójdzie nie tak.