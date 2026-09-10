# E-commerce Sales Analysis Case Study 

Tento repozitář obsahuje moje řešení case study pro pozici Data Analyst společnosti Shoptet.

## Obsah

### SQL úkoly
Řešení následujících úloh:
- kontrola duplicitních ProductName
- celková hodnota objednávek podle zemí
- počet objednávek podle dopravce a kategorií (Seafood vs Beverages)
- ER diagram databáze
- dva vlastní analytické SQL dotazy

### Power BI Dashboard
Jednostránkový dashboard vytvořený v Power BI zaměřený na:
- analýzu celkových tržeb, objednávek a prodaného množství,
- porovnání tržeb podle zemí,
- analýzu objednávek kategorií Seafood a Beverages podle dopravce,
- měsíční vývoj tržeb v letech 1996–1997,
- výkon zaměstnanců podle tržeb, počtu objednávek a průměrné hodnoty objednávky,
- práci s datovým modelem, DAX mírami a Power Query transformacemi,
- interaktivní filtrování pomocí slicerů (datum, země, dopravce, kategorie).

## Struktura repozitáře

```text
├── dashboard/
│   └── Sindelerova_dashboard.pbix
│
├── sql/
│   └── analytical_queries.sql
│
├── docs/
│   ├── Sindelerova_ER_diagram.png
│   └── Sindelerova_case_study_summary_1_2_3_5.pdf
│
└── README.md
```

## Použité nástroje
- SQL
- Power BI
- Excel

## Čas zpracování

Přibližně 8–9 hodin celkem, včetně:
- SQL analýzy a tvorby dotazů
- vytvoření ER diagramu
- návrhu Power BI dashboardu a vizualizací
- přípravy struktury repozitáře a dokumentace

## Poznámky

Dashboard byl vytvořen nad vybranými tabulkami z databáze Northwind.

Analýza vycházela zejména z tabulek:
- Orders
- OrderDetails
- Products
- Categories
- Customers
- Shippers
