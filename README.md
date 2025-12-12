# MvJPrimedListening

## EN

This is an [mpv](https://mpv.io/) script that makes immersion into complex (i+n) input comprehensible via an [MvJ](https://www.skool.com/mattvsjapan/about) primed listening technique. It's primarily aimed at beginners who want to acquire a target language while consuming and heavily benefiting from foreign language content made by natives for natives. The approach is useful not only for MvJ practitioners, but also in context of other immersion-first language acquisition methods. For example, it's worth considering on Refold [Stage 1](https://refold.la/roadmap/stage-1/overview/).

The idea behind the script is to organize video playback in mpv as follows:
1. You're watching TL (Target Language) video content with NL (Native Language) subs.
2. Whenever a new line appears, it's shown.
3. Video is paused for 1-4s (depending on a line length) for you to read.
4. You read the NL-sub, which preloads the meaning into your brain, specifically, short-term memory.
5. The subtitle line is hidden.
6. After an extra 300ms pause playback resumes and you hear the TL audio.
7. Brain automatically maps the meaning to the TL-audio and acquires the language.

### Setup instructions:
1. Download and put the mvj-primed-listening.lua file into mpv [scripts directory](https://mpv.io/manual/stable/#files) (for GNU/Linux: ~/.config/mpv/scripts/).
2. If you want the MvJ primed listening mode to be turned on by default add `mvj-primed-listening=yes` parameter to you mpv.conf (for GNU/Linux: ~/.config/mpv/mpv.conf).
3. Whenever you want to turn this mode on or off, use Alt+P shortcut in mpv.

## UK

Це cкрипт для [mpv](https://mpv.io/), який робить занурення в складний (i+n) мовний вхід зрозумілим за допомогою техніки слухання з підтримками [MvJ](https://www.skool.com/mattvsjapan/about). Він в першу чергу призначений для початківців, які хочуть опанувати мову, споживаючи та отримуючи значну користь від іноземного контенту, створеного носіями мови для носіїв. Цей підхід корисний не тільки для практикуючих MvJ, але й в контексті інших методів освоєння мови, що базуються на зануренні. Наприклад, він вартий розгляду на [Стадії 1](https://telegra.ph/Stad%D1%96ya-1-Zakladayemo-Osnovu-10-14) у Refold.

Ідея скрипту полягає в організації відтворення відео в mpv наступним чином:
1. Ви дивитеся відеовміст на ЦМ (Цільовій Мові) з субтитрами на РМ (Рідній Мові).
2. Кожен раз, коли з'являється новий рядок, він відображається.
3. Відео призупиняється на 1-4 секунди (залежно від довжини рядка) для читання.
4. Ви читаєте субтитри на РМ, що завантажує значення у ваш мозок, а саме в короткотермінову пам'ять.
5. Рядок субтитрів приховується.
6. Після додаткової 300-мілісекундної паузи відтворення продовжується, і ви чуєте аудіо на ЦМ.
7. Мозок автоматично співставляє значення з аудіо на ЦМ і освоює мову.

### Інструкції з налаштування:
1. Завантажте та помістіть файл mvj-primed-listening.lua в [директорію для скриптів](https://mpv.io/manual/stable/#files) mpv (для GNU/Linux: ~/.config/mpv/scripts/).
2. Якщо хочете, щоб режим слухання з підтримками MvJ був увімкнений замовчуванням, додайте параметр `mvj-primed-listening=yes` до вашого файлу mpv.conf (для GNU/Linux: ~/.config/mpv/mpv.conf).
3. При потребі увімкнути або вимкнути цей режим, використовуйте комбінацію клавіш Alt+P в mpv.
