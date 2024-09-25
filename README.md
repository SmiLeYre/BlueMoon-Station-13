# BlueMoon Station
[![CI Suite](https://github.com/BlueMoon-Labs/MOLOT-BlueMoon-Station/workflows/CI%20Suite/badge.svg)](https://github.com/BlueMoon-Labs/MOLOT-BlueMoon-Station//actions?query=workflow%3A%22CI+Suite%22) [![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/BlueMoon-Labs/MOLOT-BlueMoon-Station/pulls) [![HitCount](https://hits.dwyl.com/BlueMoon-Labs/MOLOT-BlueMoon-Station.svg)](https://hits.dwyl.com/BlueMoon-Labs/MOLOT-BlueMoon-Station) [![Одумайся](https://camo.githubusercontent.com/557504a5326b02363676cd365a4ec29e50199149db8e9d5afed26e2b99c7dc26/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f7374617274253230776974682d7768792533462d627269676874677265656e2e7376673f7374796c653d666c6174)](https://www.youtube.com/watch?v=doA9R9k4C9s)

[![Discord](https://img.shields.io/badge/Discord-%235865F2.svg?style=for-the-badge&logo=discord&logoColor=white)](https://discord.gg/e6pRWzMVMA) [![Boosty](https://img.shields.io/badge/sponsor-30363D?style=for-the-badge&logo=GitHub-Sponsors&logoColor=#EA4AAA)](https://boosty.to/bluemoon-ss13) [![Wiki](https://img.shields.io/badge/Wikipedia-%23000000.svg?style=for-the-badge&logo=wikipedia&logoColor=white)](https://wiki.ss13-bluemoon.ru/wiki/Заглавная_страница)

[![forinfinityandbyond](https://user-images.githubusercontent.com/5211576/29499758-4efff304-85e6-11e7-8267-62919c3688a9.gif)](https://www.reddit.com/r/SS13/comments/5oplxp/what_is_the_main_problem_with_byond_as_an_engine/dclbu1a) [![forthebadge](https://forthebadge.com/images/badges/ctrl-c-ctrl-v.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/works-on-my-machine.svg)](https://forthebadge.com)

**BlueMoon** - русскоязычный сервер по нишевой игре **[Space Station 13](https://ru.wikipedia.org/wiki/Space_Station_13)**. Основное внимание на нашем сервере уделяется свободе самовыражения, а также веселой, расслабленной и дружелюбной атмосфере.

Лидер и главный мейнтейнер проекта - **[SmiLeY](https://github.com/SmiLeYre)**.

**BlueMoon** является форком **[S.P.L.U.R.T. Station](https://github.com/SPLURT-Station/S.P.L.U.R.T-Station-13)**, который является форком **[Sandstorm Station](https://github.com/SandPoot/Sandstorm-Station-13)**, который является форком **[Citadel Station](https://github.com/Citadel-Station-13/Citadel-Station-13)**, который является форком **[/tg/station](https://tgstation13.org/phpBB/viewforum.php?f=60)**. Забавно, да?

* **Наш Discord** - <https://discord.gg/e6pRWzMVMA>
* **Наше Wiki** - <https://wiki.ss13-bluemoon.ru/wiki/Заглавная_страница>
* **Поддержать Проект** - <https://boosty.to/bluemoon-ss13>

> [!CAUTION]
> Сервер, как и репозиторий, могут содержать материалы, не подходящие для всех возрастов. Просматривая любую часть репозитория, предлагая правки или заходя на наши веб-ресурсы, вы подтверждаете, что вам **минимум 18 лет**.

## СКАЧИВАНИЕ

Для установки кодовой базы сервера вы можете воспользоваться достаточно подробным [руководством от разработчиков /tg/station](http://www.tgstation13.org/wiki/Downloading_the_source_code), с поправкой на скачивание из нашего репозитория.

Самым простым путём скачивания, не требующим сторонних программ, является скачивание ZIP-архива. Нажмите вверху на кнопку **<> Code**, после чего выберите опцию **Download ZIP**. После этого архив нужно будет распаковать, используя любой доступный архиватор.

Для более продвинутой работы с репозиторием настоятельно рекомендуется установить **[Git](https://git-scm.com/)** и использовать его функционал.

## РАЗВЁРТЫВАНИЕ СЕРВЕРА
**На данный момент стабильной является работа сервера лишь на платформе Microsoft Windows. На платформе GNU/Linux возможны серьёзные проблемы и баги.**

Установите  [BYOND](https://www.byond.com/download). Если вы уже скачали кодовую базу, как указано выше, используйте [Build.bat](Build.bat) в корне репозитория, чтобы скомпилировать его в **tgstation.dmb**. После этого, скомпилированный **tgstation.dmb** может быть запущен через **DreamDaemon**.

Также теоретически возможна компиляция через обычный **DreamMaker**, однако это может вызвать ошибки, преимущественно с TGUI.

Помните, что, в соответствии с [лицензией GNU AGPL v3](#лицензия) вы должны выложить свой код в открытый доступ, если хостите сервер для кого-то, кроме ограниченной группы друзей. Подробнее можете прочитать в файле [LICENSE](LICENSE) в корне репозитория.

Будет хорошей идеей настроить конфиги в соответствии с вашими требованиями, особенно [config/admins.txt](config/admins.txt), [config/admin_ranks.txt](config/admin_ranks.txt) и некоторые другие файлы в папках [config/](config) и [data/](data).

Также, если вашей целью является хостинг достаточно крупного сервера, обратите внимание на технологию [TGS (/tg/station Server)](https://github.com/tgstation/tgstation-server), а также не забудьте [развернуть базу данных](#база-данных).

## КАРТЫ

Система ротации карт добавляет разнообразия в игровой процесс, включается она в [config.txt](config/config.txt), а находящиеся в ней карты определяются в [maps.txt](config/maps.txt). Загрузка карт происходит динамически во время загрузки сервера. Сами карты находятся в папке [_maps](_maps).

В настоящий момент в ротации находятся:
* **BoxStation**
* **MetaStation**
* **DeltaStation**
* **Peace Syndicate Station**
* **Festive Station**
* **Kilo Station**
* **OmegaStation**
* **PubbyStation**
* **LayeniaStation**
* **Tau Station**
* **Cog Station**
* **Smexi Station**

Если вы желаете заняться маппингом, настоятельно рекомендуем использовать инструмент [StrongDMM](https://github.com/SpaiR/StrongDMM).

*Если вы занимаетесь разработкой и часто тестируете свои изменения на локальном сервере, задумайтесь о включении Low Memory Mode, раскомментировав ``//#define LOWMEMORYMODE`` в [_maps/_basemap.dm](_maps/_basemap.dm). Это отключит загрузку секторов космоса помимо ЦК и станции, а также заменит карту на легковесную RuntimeStation, что значительно ускорит загрузку подсистем.*

## БАЗА ДАННЫХ

Для корректной работы базы данных необходим [Mariadb Server 10.2 и выше](https://mariadb.org/). Использование других СУБД (таких как SQLite, например) может вызвать ошибки.

База данных необходима для корректной работы библиотеки, статистики, админских нотесов, банов и многого другого, особенно - связанного с администрированием. Отредактируйте [/config/dbconfig.txt](/config/dbconfig.txt), и воспользуйтесь SQL-схемами в [/SQL/tgstation_schema.sql](/SQL/tgstation_schema.sql) (или [/SQL/tgstation_schema_prefix.sql](/SQL/tgstation_schema_prefix.sql), если вам нужны таблицы с префиксами).

Рекомендуем воспользоваться более подробными [инструкциями от разработчиков /tg/station](https://www.tgstation13.org/wiki/Downloading_the_source_code#Setting_up_the_database).

## IRC-БОТ

В репозиторий включен python3 IRC-бот, который может отправлять админхелпы на определённый IRC-канал/сервер, подробнее в папке [/tools/minibot](/tools/minibot).

## РАЗРАБОТКА

Ознакомьтесь с [CONTRIBUTING.md](.github/CONTRIBUTING.md).

## ЛИЦЕНЗИЯ

Весь код после коммита [commit 333c566b88108de218d882840e61928a9b759d8f on 2014/31/12 at 4:38 PM PST](https://github.com/tgstation/tgstation/commit/333c566b88108de218d882840e61928a9b759d8f) лицензирован под [GNU AGPL v3](http://www.gnu.org/licenses/agpl-3.0.html).

Весь код перед коммитом [commit 333c566b88108de218d882840e61928a9b759d8f on 2014/31/12 at 4:38 PM PST](https://github.com/tgstation/tgstation/commit/333c566b88108de218d882840e61928a9b759d8f) лицензирован под [GNU GPL v3](https://www.gnu.org/licenses/gpl-3.0.html).
*(Так же, как и различные инструменты, если в их README не указано другое.)*

Ознакомьтесь с файлами [LICENSE](LICENSE) и [GPLv3.txt](GPLv3.txt), если вам нужно больше информации.

**TGS3 API** лицензирован в качестве подпроекта под лицензией [MIT](https://ru.wikipedia.org/wiki/%D0%9B%D0%B8%D1%86%D0%B5%D0%BD%D0%B7%D0%B8%D1%8F_MIT).

**TGUI-клиент** лицензирован в качестве подпроекта под лицензией [MIT](https://ru.wikipedia.org/wiki/%D0%9B%D0%B8%D1%86%D0%B5%D0%BD%D0%B7%D0%B8%D1%8F_MIT).

Шрифт **Font Awesome**, используемый в TGUI, лицензирован под [SIL Open Font License v1.1](https://ru.wikipedia.org/wiki/SIL_Open_Font_License).

**Ассеты TGUI** лицензированы под [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).

**Все иконки, изображения и звуки** лицензированы под [Creative Commons 3.0 BY-SA license](https://creativecommons.org/licenses/by-sa/3.0/), в случае, если не указано другое.

Anytime you want to make changes to a map it's imperative you use the [Map Merging tools](http://tgstation13.org/wiki/Map_Merger)

## AWAY MISSIONS

/tg/station supports loading away missions however they are disabled by default.

Map files for away missions are located in the _maps/RandomZLevels directory. Each away mission includes it's own code definitions located in /code/modules/awaymissions/mission_code. These files must be included and compiled with the server beforehand otherwise the server will crash upon trying to load away missions that lack their code.

To enable an away mission open `config/awaymissionconfig.txt` and uncomment one of the .dmm lines by removing the #. If more than one away mission is uncommented then the away mission loader will randomly select one the enabled ones to load.

## SQL SETUP

The SQL backend requires a Mariadb server running 10.2 or later. Mysql is not supported but Mariadb is a drop in replacement for mysql. SQL is required for the library, stats tracking, admin notes, and job-only bans, among other features, mostly related to server administration. Your server details go in /config/dbconfig.txt, and the SQL schema is in /SQL/tgstation_schema.sql and /SQL/tgstation_schema_prefix.sql depending on if you want table prefixes.  More detailed setup instructions are located here: https://www.tgstation13.org/wiki/Downloading_the_source_code#Setting_up_the_database

## WEB/CDN RESOURCE DELIVERY

Web delivery of game resources makes it quicker for players to join and reduces some of the stress on the game server.

1. Edit compile_options.dm to set the `PRELOAD_RSC` define to `0`
1. Add a url to config/external_rsc_urls pointing to a .zip file containing the .rsc.
	* If you keep up to date with /tg/ you could reuse /tg/'s rsc cdn at http://tgstation13.download/byond/tgstation.zip. Otherwise you can use cdn services like CDN77 or cloudflare (requires adding a page rule to enable caching of the zip), or roll your own cdn using route 53 and vps providers.
	* Regardless even offloading the rsc to a website without a CDN will be a massive improvement over the in game system for transferring files.

## IRC BOT SETUP

Included in the repository is a python3 compatible IRC bot capable of relaying adminhelps to a specified
IRC channel/server, see the /tools/minibot folder for more

## CONTRIBUTING

Please see [CONTRIBUTING.md](.github/CONTRIBUTING.md)

## LICENSE

All code after [commit 333c566b88108de218d882840e61928a9b759d8f on 2014/31/12 at 4:38 PM PST](https://github.com/tgstation/tgstation/commit/333c566b88108de218d882840e61928a9b759d8f) is licensed under [GNU AGPL v3](http://www.gnu.org/licenses/agpl-3.0.html).

All code before [commit 333c566b88108de218d882840e61928a9b759d8f on 2014/31/12 at 4:38 PM PST](https://github.com/tgstation/tgstation/commit/333c566b88108de218d882840e61928a9b759d8f) is licensed under [GNU GPL v3](https://www.gnu.org/licenses/gpl-3.0.html).
(Including tools unless their readme specifies otherwise.)

See LICENSE and GPLv3.txt for more details.

The TGS3 API is licensed as a subproject under the MIT license.

See the footers of code/\_\_DEFINES/server\_tools.dm, code/modules/server\_tools/st\_commands.dm, and code/modules/server\_tools/st\_inteface.dm for the MIT license.

tgui clientside is licensed as a subproject under the MIT license.
Font Awesome font files, used by tgui, are licensed under the SIL Open Font License v1.1
tgui assets are licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).

All assets including icons and sound are under a [Creative Commons 3.0 BY-SA license](https://creativecommons.org/licenses/by-sa/3.0/) unless otherwise indicated.
