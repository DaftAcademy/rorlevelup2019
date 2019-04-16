
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


# Komentarz do rozwiązania:

`app/models/warriors/samurai`; `app/models/warriors/hussar`:
1. Metod `attack` przeniesiona do klasy bazowej, ponieważ sama treść wiadomości nie wnosi nic nowego. Oczywiście, jeżeli byłoby to istotne, `attack` powinien zostać w klasach potomnych - nie wpłynie to na poprawność działania aplikacji.
2. *NullObject* zastosowany zgodnie z podpowiedzią. Brak przypisanej broni/najemnika nie powinien stanowić już problemu.


`app/models/mercenary`:
1. Kod wygląda jak skopiowany z modelu warrior; dla porządku należy usunąć linijki dotyczące pól niezawartych w `schemie`. Druga możliwość to poprawienie modelu najemnika w bazie danych, by zawierał również pola `join_date` i `death_date` - jednak informacje o ewentualnej dacie śmierci najemnika absolutnie nic nie wnoszą, a data dołączenia nie ma tu racji bytu. Na wszelki wypadek, zamiast całkowitego usunięcie, miejsce w kodzie odnotowałbym do konsultacji z autorem (*TODO*).
2. Dodałem `scope available`, wyświetlające dostępnych najemników


`app/controllers/mercenaries_controller`:
metody:
`index` - pokazuje dostępnych najemników
`show` - pokazuje najemników z połączonymi wojownikami
`employ` - zatrudnia losowego najemnika
`employ_best` - zatrudnia najbardziej doświadczonego najemnika
`employ_cheapest` - zatrudnia najtańszego najemnika
Częsć funkcjonalności przeniesiona do *ServiceObjecta* `MercenaryEmployer`
Zapytania przeniesione do *QueryObjecta* `MercenariesQuery`

Niektóre metody zwracały: `render json: warrior, include: [:mercenary]`,
poprawiłem na: `render json: mercenary, include: [:warrior]`

`app/services/mercenary_employer`:
*ServiceObject*, służy do zatrudniania najemników (call).
Zapytania w *QueryObjectach* `BuildingsQuery` oraz `ClansQuery`. 
W `create_good_weapon` dodałem *NullObjecta* `NullWeapon` jako opcję "else".

`app/nulls/null_mercenary`; `app/nulls/null_weapon`:
*NullObjecty*

`app/queries/*`:
*QueryObjecty*, zazwyczaj głównie do wyszukiwanie obiektu po `id`; bardziej rozwinięty jest `MercenariesQuery`, ponieważ musiał obsłużyć dodatkowo sortowanie i selekcję dostępnych najemników.

2019/04/16: dodałem namespace do `/nulls/*`, `/services/*`, `/queries/*`
