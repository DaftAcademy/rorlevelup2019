# Zadanie domowe z baz danych (drugi wykład)

Szogun jest całkiem zadowolony z istniejącego API. Okazuje się jednak, że do sprawnego prowadzenia bitew, będzie potrzebował jeszcze kilku dodatkowych funkcjonalności.

Część z nich powinna być bardzo prosta, bo została już zaimplementowana podczas wykładu:

- Okazuje się, że czasami przy tworzeniu nowego klanu Szogun zapomni, że już istnieje klan o takiej samej nazwie. Zadbaj o odpowiednie walidowanie unikalności nazw.
- Szogun wie, że jego samurajowie są bardzo dobrymi wojownikami, ale chciałby wzmocnić swoje klany innymi wojownikami. Po całej Japonii krążą opowieści o szarży husarii w bitwie pod Sekigaharą. Napisz odpowiednie migracje i stwórz modele pozwalające rekrutować husarzy lub inne, wybrane przez Ciebie jednostki, do klanów. Zadbaj o to, żeby każda typ wojownika umiał atakować w odpowiedni sposób - stwórz metody `attack` na odpowiednich modelach. Nie musisz ograniczać się tylko do husarzy. Szogun na pewno będzie mile zaskoczony nowymi łucznikami oraz artylerią. 
- Nasi wojownicy nudzą się, bo nie można przydzielić im żadnej pracy. Stwórz kilka typów budowli (mury, wieże, bramy, warownie) do których będziemy mogli przypisywać wojowników. Każdy wojownik może być przypisany tylko do jednego budynku, ale w jednym budynku może być wielu wojowników. Nie chcemy przecież, żeby jeden samuraj musiał sam bronić całego zamku :smiley:

![castle](vendor/images/castle.gif)

Dwie następne funkcjonalności wymagają już nieco więcej samodzielnej pracy:

- Z czasem, gdy klany zaczęły rosnąć, Szogunowi zaczęli mylić się wojownicy. Poprosił Cię, aby uniemożliwość istnienie dwóch wojowników o tym samym imieniu. Oczywiście reguła ta dotyczy tylko żywych, więc poległych można zastąpić nowym wojownikiem o tym samy imiemiu.

  - Jeśli chcesz podjąć się zadania nieco trudniejszego, ogranicz unikalność imienia tylko do wojowników wewnątrz jednego klanu.

- Na sam koniec zostało chyba najważniejsze zadanie. Zupełnie zapomnieliśmy, że wojownicy do walki potrzebują mieć jakąś broń :flushed: Stwórz odpowiednie migracje, modele i metody, które pozwolą na realizację następujących wymagań:
  - Każda broń jest jednego z trzech rodzajów: magiczna (`magical`), biała (`melee`) i miotająca (`ranged`). 

  - Każdy wojownik umie walczyć tylko jednym rodzajem broni i musi mieć swój prywatny egzemplarz. 

  - Każda sztuka broni ma swój własny zasięg i obrażenia, które są uwzględnione w metodzie `calculate_damage`. Metoda ta przyjmuje odległość w jakiej jest przeciwnik i zwraca zadane obrażenia. Na przykład, miecz zada 100% możliwych obrażeń w odległości do 2 metrów, ale powyżej już 0%. Metodę możemy zatem zaimplementować w następujący sposób:

    ```ruby
    def calculate_damage(distance)
      return 0 if distance > range

      damage * (1 - distance / range)
    end
    ```

    Łuk z kolei będzie mniej skuteczny na bliższe odległości. Wzory obliczające obrażenia możesz napisać według własnego uznania.

![archery](vendor/images/archery.gif)

---

Potrzebne funkcjonalności dodaj do implementacji, która znajduje się w tym folderze. Jest to jednocześnie przykładowe rozwiązanie pierwszej pracy domowej, więc możesz porównać ze swoimi pomysłami z zeszłego typodnia :raised_hands:

