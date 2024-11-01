local locale = GetLocale()

LocalizationTable = {
    NEW_TIME_PLAYED_MSG = {
        default = "New gametime recorded for this character.",
        frFR = "Nouveau temps de jeu enregistré pour ce personnage.",
        deDE = "Neue Spielzeit für diesen Charakter aufgezeichnet.",
        esES = "Nuevo tiempo de juego registrado para este personaje.",
        ruRU = "Новое время игры записано для этого персонажа.",
        zhCN = "为这个角色记录的新游戏时间。",
        koKR = "이 캐릭터에 대해 새 게임 시간을 기록했습니다."
    },
    ACCEPTED_COMMANDS_MSG = {
        default = "Allowed commands for Playeded :",
        frFR = "Commandes acceptées pour Playeded :",
        deDE = "Erlaubte Befehle für Playeded:",
        esES = "Comandos permitidos para Playeded:",
        ruRU = "Разрешенные команды для Playeded:",
        zhCN = "Playeded 的允许命令：",
        koKR = "Playeded에 대한 허용된 명령어:"
    },
    INFO_ALL_COMMAND_MSG = {
        default = "Display overall gametime.",
        frFR = "Affiche le temps de jeu total.",
        deDE = "Gesamtspielzeit anzeigen.",
        esES = "Mostrar el tiempo de juego total.",
        ruRU = "Отобразить общее время игры.",
        zhCN = "显示总游戏时间。",
        koKR = "총 게임 시간을 표시합니다."
    },
    INFO_SERVER_COMMAND_MSG = {
        default = "Display gametime on this server.",
        frFR = "Affiche le temps de jeu sur ce serveur.",
        deDE = "Spielzeit auf diesem Server anzeigen.",
        esES = "Mostrar el tiempo de juego en este servidor.",
        ruRU = "Показать время игры на этом сервере.",
        zhCN = "显示此服务器上的游戏时间。",
        koKR = "이 서버의 게임 시간을 표시합니다."
    },
    INFO_RESETALL_COMMAND_MSG = {
        default = "Reset saved overall gametime.",
        frFR = "Réinitialise le temps de jeu total enregistré.",
        deDE = "Gespeicherte Gesamtspielzeit zurücksetzen.",
        esES = "Restablecer el tiempo de juego total guardado.",
        ruRU = "Сбросить сохраненное общее время игры.",
        zhCN = "重置保存的总游戏时间。",
        koKR = "저장된 총 게임 시간을 초기화합니다."
    },
    RESETALL_CONFIRMATION_MSG = {
        default = "Overall gametime have been reset.",
        frFR = "Tous les temps de jeux ont été réinitialisés.",
        deDE = "Die gesamte Spielzeit wurde zurückgesetzt.",
        esES = "Se ha restablecido todo el tiempo de juego.",
        ruRU = "Общее время игры было сброшено.",
        zhCN = "所有游戏时间已重置。",
        koKR = "모든 게임 시간이 초기화되었습니다."
    },
    OVERALL_PLAYEDTIME_DISPLAY_MSG = {
        default = "You played %s on this account.",
        frFR = "Vous avez joué %s sur ce compte.",
        deDE = "Sie haben %s auf diesem Konto gespielt.",
        esES = "Has jugado %s en esta cuenta.",
        ruRU = "Вы играли %s на этой учетной записи.",
        zhCN = "您在此帐户上玩了 %s。",
        koKR = "이 계정에서 %s를 플레이했습니다."
    },
    SERVER_PLAYEDTIME_DISPLAY_MSG = {
        default = "You played %s on %s.",
        frFR = "Vous avez joué %s sur le serveur %s.",
        deDE = "Sie haben %s auf dem Server %s gespielt.",
        esES = "Has jugado %s en el servidor %s.",
        ruRU = "Вы играли %s на сервере %s.",
        zhCN = "您在服务器 %s 上玩了 %s。",
        koKR = "%s 서버에서 %s를 플레이했습니다."
    },
    DAY = {
        default = "day",
        frFR = "jour",
        deDE = "Tag",
        esES = "día",
        ruRU = "день",
        zhCN = "天",
        koKR = "일"
    },
    DAYS = {
        default = "days",
        frFR = "jours",
        deDE = "Tage",
        esES = "días",
        ruRU = "дней",
        zhCN = "天",
        koKR = "일"
    },
    HOUR = {
        default = "hour",
        frFR = "heure",
        deDE = "Stunde",
        esES = "hora",
        ruRU = "час",
        zhCN = "小时",
        koKR = "시간"
    },
    HOURS = {
        default = "hours",
        frFR = "heures",
        deDE = "Stunden",
        esES = "horas",
        ruRU = "часов",
        zhCN = "小时",
        koKR = "시간"
    },
    MINUTE = {
        default = "minute",
        frFR = "minute",
        deDE = "Minute",
        esES = "minuto",
        ruRU = "минута",
        zhCN = "分钟",
        koKR = "분"
    },
    MINUTES = {
        default = "minutes",
        frFR = "minutes",
        deDE = "Minuten",
        esES = "minutos",
        ruRU = "минут",
        zhCN = "分钟",
        koKR = "분"
    },
    SECOND = {
        default = "second",
        frFR = "seconde",
        deDE = "Sekunde",
        esES = "segundo",
        ruRU = "секунда",
        zhCN = "秒",
        koKR = "초"
    },
    SECONDS = {
        default = "seconds",
        frFR = "secondes",
        deDE = "Sekunden",
        esES = "segundos",
        ruRU = "секунд",
        zhCN = "秒",
        koKR = "초"
    },
    SERVER = {
        default = "Server",
        frFR = "Serveur",
        deDE = "Server",
        esES = "Servidor",
        ruRU = "Сервер",
        zhCN = "服务器",
        koKR = "서버"
    }
}

function GetLocalizedText(key)
    -- local translations = LocalizationTable[locale] or LocalizationTable["default"]
    return LocalizationTable[key][locale] or LocalizationTable[key]["default"] or key
end