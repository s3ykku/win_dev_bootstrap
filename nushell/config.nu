# config.nu
#
# Installed by:
# version = "0.112.2"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

use ~/.cache/starship/init.nu

alias ll = ls -l
alias v = nvim
alias c = clear

# Переключатель темы Nushell: false = Tokyo Night, true = Kanagawa.
let use_kanagawa_theme = true

let theme_tokyo_night = {
    # Базовые элементы
    separator: "#565f89"      # Цвет разделителей (Grey)
    leading_trailing_space_bg: { attr: n }
    header: { fg: "#7aa2f7" attr: b } # Заголовки таблиц (Blue)
    empty: "#7dcfff"          # Пустые значения (Cyan)
    bool: "#ff9e64"           # Булевы значения (Orange)
    int: "#ff9e64"            # Числа (Orange)
    filesize: "#7dcfff"       # Размер файлов (Cyan)
    duration: "#9ece6a"       # Длительность (Green)
    date: "#bb9af7"           # Дата (Magenta)
    string: "#9ece6a"         # Строки (Green)
    row_index: "#545c7e"      # Индексы строк (Dark Blue)
    hints: "#565f89"          # Подсказки (Comments)

    # Подсветка синтаксиса (Shapes) - то, что ты видишь при вводе
    shape_external: "#7dcfff"     # Команды (.exe, системы) - Cyan
    shape_internalcall: "#7aa2f7" # Внутренние команды Nu - Blue
    shape_externalarg: "#9ece6a"  # Аргументы - Green
    shape_flag: { fg: "#bb9af7" attr: b } # Флаги (--help) - Magenta
    shape_string: "#9ece6a"       # Текст в кавычках - Green
    shape_variable: "#bb9af7"     # Переменные - Magenta
    shape_operator: "#89ddff"     # Операторы (+, -, |) - Sky Blue
    shape_filepath: "#73daca"     # Пути к файлам - Teal
    shape_list: "#7dcfff"         # Списки - Cyan
    shape_garbage: { fg: "#f7768e" attr: b } # Ошибки ввода - Red
}

let theme_kanagawa = {
    # Базовые элементы
    separator: "#54546d"
    leading_trailing_space_bg: { attr: n }
    header: { fg: "#7e9cd8" attr: b }
    empty: "#7aa89f"
    bool: "#ffa066"
    int: "#ffa066"
    filesize: "#7aa89f"
    duration: "#98bb6c"
    date: "#957fb8"
    string: "#98bb6c"
    row_index: "#727169"
    hints: "#727169"

    # Подсветка синтаксиса (Shapes)
    shape_external: "#7e9cd8"
    shape_internalcall: "#7e9cd8"
    shape_externalarg: "#c8c093"
    shape_flag: { fg: "#957fb8" attr: b }
    shape_string: "#98bb6c"
    shape_variable: "#d27e99"
    shape_operator: "#7aa89f"
    shape_filepath: "#7aa89f"
    shape_list: "#e6c384"
    shape_garbage: { fg: "#e82424" attr: b }
}

let active_color_config = if $use_kanagawa_theme { $theme_kanagawa } else { $theme_tokyo_night }

$env.config = {
    show_banner: false
    
    # Вот этот блок отвечает за цвета
    color_config: $active_color_config

    table: {
        mode: rounded # чтобы таблицы были как в Neovim
    }
}

# Переключение на старую версию Go
def --env setoldgo [] {
    $env.GOTOOLCHAIN = "go1.20"
    print "Go toolchain set to 1.20"
}

# Переключение на локальную версию Go
def --env setdefgo [] {
    $env.GOTOOLCHAIN = "local"
    print "Go toolchain set to local"
}

# Дефолтный конфиг Starship
def --env st-def [] {
    $env.STARSHIP_CONFIG = ("~/.config/starship.toml" | path expand);
    exec nu
}

# Обертка над yazi для сохранения CWD при выходе
def --env y [...args] {
    let tmp = (mktemp -t "yazi-cwd.XXXXXX")
    ^yazi ...$args --cwd-file $tmp
    let cwd = (open $tmp)
    if $cwd != $env.PWD and ($cwd | path exists) {
        cd $cwd
    }
    rm -fp $tmp
}

# Блочно-квадратный конфиг Starship
def --env st-block [] {
    $env.STARSHIP_CONFIG = ("~/.config/starship_blocks.toml" | path expand);
    exec nu
}

$env.config.shell_integration.osc133 = false
