# Button 03 — Outlined

**Уровень сложности:** ⭐☆☆☆☆  
**Фреймворк:** UIKit  
**iOS:** 15+

## Что делает
Кнопка с прозрачным фоном и цветной рамкой. При нажатии рамка и текст становятся полупрозрачными.

## Ключевые техники
- `UIButton.Configuration.plain()` – стиль без фона
- `config.background.strokeColor` и `strokeWidth` – настройка рамки
- Анимация через `configurationUpdateHandler` (или через `layer` в legacy)


## Как запустить
Запустить проект, в главном меню выбрать **"Outlined"**.

## Что изучишь
- Создание кнопки с обводкой (outline) современным способом
- Управление состоянием `highlighted` через конфигурацию
- Принцип работы `background.strokeColor` и отличие от `layer.borderColor`
