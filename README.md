# Serie A CLI

A command-line interface project that scrapes data from Transfermarkt.com about the top Italian soccer league: Serie A 2018/2019. Built as portfolio project requirement for Flatiron School Full-stack Web development program.

## Getting Started

Clone the repo and open the folder through the terminal.

### Installing

Go to /bin folder on the terminal and type

```
./soccer
```

This will execute the program and it will show you the current Seria A standings

```
Welcome to Serie A CLI
1. Juventus
2. SSC Napoli
3. Inter
4. AC Milan
5. Atalanta
6. AS Roma
7. Torino
8. Lazio
9. Sampdoria
10. Cagliari Calcio
11. Fiorentina
12. Sassuolo
13. SPAL
14. Parma
15. Genoa
16. Bologna
17. Udinese Calcio
18. FC Empoli
19. Frosinone
20. Chievo Verona
Loading: just wait, magic needs time!
Select team by typing its table ranking
```

You can select your team by typing their ranking.

```
Select team by typing its table ranking
3
```

In this example, this will select "Inter" team 3rd in the current standings. This input will show the following results.

```
Here some details:
Inter is currently valued $635.44mn
Inter players average age is 28,8
They play at Stadio San Siro - Giuseppe Meazza
```

## Built With

* Ruby
* Nokogiri Gem to scrape data

## Authors

* **Andrea Nasuto** - [Github](https://github.com/andreanasuto)


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
