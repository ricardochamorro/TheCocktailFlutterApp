# The Cocktail Flutter App

## Description

The author wants to show how to use Flutter technology for consuming TheCocktailDB API

## Details

* DAO, Dependency Injection Pattern
* For Dependency Injection, get_it is used
* This app makes use of offline first approach so after you load the data once, then you can use it offline.
* This app uses FloorDB to internally store data

## Steps to build and launch this app into your own android emulator

We will use build_runner to generate files for floorDB and GetIT.

```
$ git clone https://github.com/ricardochamorro/TheCocktailFlutterApp.git
$ cd TheCockTailFlutterApp
$ flutter pub get
$ cd data/
$ flutter pub run build_runner build --delete-conflicting-outputs
$ cd ../domain/
$ flutter pub run build_runner build --delete-conflicting-outputs
$ cd ../view/
$ flutter pub run build_runner build --delete-conflicting-outputs
$ cd ../
$ flutter run
```
