# Zadanie rekrutacyjne

Do dyspozycji masz zaimplementowaną już klasę `Price`, której możesz użyć w następujący sposób:
```ruby
price_in_euro = Price.new(21, :eur)
price_in_euro.amount # => 21
price_in_euro.currency # => :eur

price_in_usd = Price.new(10.55, :usd)
price_in_usd.amount # => 10.55
price_in_usd.currency # => :usd

invalid_price = Price.new(37, :qwe) # => raises error Price::InvalidCurrency
```
Waluty obsługiwane przez `Price` to `:eur`, `:usd` i `:pln`.

Zaimplementuj klasę `Converter`, której będzie można używać do konwersji tych trzech walut według kursów:
* EUR/PLN - 4.32
* EUR/USD - 1.13
* USD/PLN - 3.81
* USD/EUR - 0.88
* PLN/EUR - 0.23
* PLN/USD - 0.26

`Converter` powinien przyjmować w konstruktorze obiekt klasy `Price` i poprzez metodę `convert_to` działać w następujący sposób:
```ruby
price_in_euro = Price.new(10, :eur)
converter = Converter.new(price_in_euro)
converter.convert_to(:usd) # => 11.3
converter.convert_to(:eur) # => 10
converter.convert_to(:pln) # => 43.2
converter.convert_to(:xxx) # => raises error
```
Kwota zwracana przez obiekt `Converter` powinna być zaokrąglona do dwóch miejsc po przecinku.

Po zaimplementowaniu klasy `Converter` w pliku `converter.rb` [otwórz Pull Request w tym repozytorium](https://help.github.com/articles/creating-a-pull-request/).

Jeśli nie uda Ci się wykonać zadania w całości, nie martw się! Prześlij nam to co udało Ci się zrobić. 🤗

**Powodzenia!**
