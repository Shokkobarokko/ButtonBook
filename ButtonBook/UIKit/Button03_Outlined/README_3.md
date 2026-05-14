# Button 02 — Filled

**Уровень сложности:** ⭐☆☆☆☆  
**Фреймворк:** UIKit  
**iOS:** 15+

## Что делает
Кнопка с синей заливкой, скруглёнными углами и отступами. При нажатии затемняется.

## Ключевые техники
- `UIButton.Configuration` – современный способ настройки (iOS 15+)
- `baseBackgroundColor`, `baseForegroundColor`, `cornerStyle`, `contentInsets`
- `configurationUpdateHandler` – реакция на состояние `.highlighted`
- `titleTextAttributesTransformer` – изменение шрифта

## Как запустить
Запустить проект, в главном меню выбрать **"Filled"**.

## Что изучишь
- Использование `UIButton.Configuration` для создания кастомных кнопок
- Анимация подсветки через обновление конфигурации
- Правильные отступы с `contentInsets`
