## Stories Data

Stories Data — общий пакет данных для экосистемы “Сказки для детей”. Пакет реализует модели данных, REST-клиент и репозитории для взаимодействия с сервером. Используется как зависимость в других проектах для унификации логики и структуры данных.

## Архитектура и структура проекта

```
lib
 ┣ core
 ┃ ┣ utils
 ┃ ┃ ┗ logger.dart
 ┃ ┣ constans.dart
 ┃ ┣ di_stories_data.dart
 ┃ ┗ endpoints.dart
 ┣ data
 ┃ ┣ dio_client.dart
 ┃ ┣ rest_client.dart
 ┃ ┗ rest_client.g.dart
 ┣ domain
 ┃ ┗ period.dart
 ┣ models
 ┃ ┣ category_model.dart
 ┃ ┣ category_model.g.dart
 ┃ ┣ category_type_model.dart
 ┃ ┣ category_type_model.g.dart
 ┃ ┣ index.dart
 ┃ ┣ story_model.dart
 ┃ ┗ story_model.g.dart
 ┣ repositories
 ┃ ┣ category_repository.dart
 ┃ ┣ category_type_repository.dart
 ┃ ┣ index.dart
 ┃ ┣ search_repository.dart
 ┃ ┣ story_categories_repository.dart
 ┃ ┣ story_popular_repository.dart
 ┃ ┗ story_repository.dart
 ┣ index.dart
 ┣ main.dart
 ┗ stories_data.dart
```

 ## Технологии:

- Язык: Dart
- HTTP клиент: Dio + Retrofit
- Сериализация: json_serializable
- DI: get_it
- Логирование: logger
- Конфигурация окружения: dotenv
- Сравнение объектов: equatable
- Генерация кода: build_runner

## Связанные репозитории:

[Серверное приложение](https://github.com/RfMakar/stories_server)  
[Клиентское приложение](https://github.com/RfMakar/stories_client)  
[Админ приложение](https://github.com/RfMakar/stories_admin)  
[Пакет данных](https://github.com/RfMakar/stories_data) 

## Автор
**Максим Макарчук**
