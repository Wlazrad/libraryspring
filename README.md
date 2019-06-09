# Spring Library
Aplikacja do zarządzania czytelnią książek, oparta o stos technologiczny Springa.
Aplikacja umożliwia:
- utworzenie nowego czytelnika,
- usunięcie czytelnika,
- dodanie książki do wypożyczalni,
- usunięcie książki z wypożyczalni,
- wyświetlenie książek,
- wypożyczenie książki przez czytelnika (tylko jeden czytelnik może wypożyczać tę samą książkę w danym momencie, czytelnik z nałożoną karą nie może wypożyczać ksiązek),
- zwrot wypożyczonej książki (wraz z prostym systemem kar za przetrzymanie: do tygodnia stała opłata 2 zł, po tym czasie dochodzi dodatkowe 50 gr za każdy dzień przetrzymania).

### Live demo
- [Library](https://librarywlazrad.herokuapp.com/index)

### REST API
Spring Library posiada REST API z następującymi metodami:
- GET https://librarywlazrad.herokuapp.com/api/books - zwraca listę wszystkich książek

### Uruchomienie aplikacji
Cała konfiguracja zawarta jest w pliku `application.properties`, baza danych użyta w Spring Library umieszczona jest na zewnętrznym serwerze i nie wymaga dodatkowych zmian.
W celu uruchomienia aplikacji na innym środowisku można skorzystać ze Spring Boot Maven plugin, który pozwala na szybką kompilację i bezpośrednie uruchomienie aplikacji z użyciem poniższej komendy:
```
$ mvn spring-boot:run
```

### Login
Konto admina:
admin@gmail.com
hasło : admin
Konto usera:
test@gmail.com
hasło : test
