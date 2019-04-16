# Zadanie domowe ze standardów tworzenia oprogramowania (czwarty wykład)

Szogun jest ostatnio strasznie niecierpliwy. W czasie jak dodawaliśmy obsługę standardu JSON:API do projektu dołączył nowy programista. Został poproszony o stworzenie bazy najemników (model `Mercenary`) i kontrolera, który pozwala ich zatrudniać `WarriorsController`. Niestety kod który zostawił pozostawia wiele do życzenia.

![tenor-31084919](vendor/images/tenor-31084919.gif)

Tym razem nie musisz już dodawać nowych funkcjonalności. Szogun poprosił Cię o zrobienie dwóch rzeczy:

1. Przejrzyj projekt, znajdź miejsca które naruszają zasady pisania czystego kodu i zastosuj tam dobre praktyki, według Twojego uznania.
2. Stwórz listę naniesionych poprawek z wyjaśnieniami dlaczego uważasz taki sposób rozwiązania za słuszny.

To zadanie nie ma dobrych i złych rozwiązań. Ten sam kod można napisać na wiele sposobów, więc najważniejsze jest dobre uzasadnienie wprowadzonych zmian.

Jeśli potrzebujesz inspiracji to możesz zacząć od spojrzenia na metodę `attack` wojowników. Jeśli wojownik nie będzie miał broni to metoda podniesie wyjątek. Użycie `NullObject` może pomóc rozwiązać ten problem. Podobny problem może pojawić się z `mercenary` na wojowniku - czasami będzie ale niektórzy wojownicy będą tam mieli `nil`.

![tenor-249225230](vendor/images/tenor-249225230.gif)

W kontrolerze najemników pracy będzie trochę więcej. Niestaranny kod powoduje powstawanie bugów, które objawiają się niespodziewanymi błędami walidacji, pustymi odpowiedziami itd. Zastanów się jak ten kod powinien działać, dodaj brakujące funkcjonalności i popraw błędy, które utrudniają używanie aplikacji. Przy okazji zastosuj tam zasady SOLID i znane Ci wzorce projektowe.

Powodzenia

