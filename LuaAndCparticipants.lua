-- http://kodomo.fbb.msu.ru/wiki/Main/LuaAndC/Participants

local participants = {
    {'Александра Галицына', 'agalicina', 'agalitsyna', 'https://github.com/agalitsyna/LOF.git'},
    {'Анна Колупаева', 'kolupaeva', 'AnyaKol', 
        'https://github.com/AnyaKol/Lua_C'},
    {'Александра Бойко', 'boyko.s', 'boykos', 'https://github.com/Talianash/GlobinDetector-2015'},
    {'Андрей Сигорских', 'crescent8547', 'CarolusRex8547',
        'https://github.com/Talianash/GlobinDetector-2015'},
    {'Иван Русинов', 'is_rusinov', 'isrusin', },
    {'Игорь Поляков', 'ranhummer', 'RanHum', },
    {'Борис Нагаев', 'bnagaev', 'starius',
        'https://github.com/LuaAndC/LuaAndC'},
    {'Татьяна Шугаева', 'talianash', 'Talianash',
        'https://github.com/Talianash/GlobinDetector-2015'},
    {'Дарья Диброва', 'udavdasha', 'udavdasha', },
    {'Павел Долгов', '', 'zer0main',
        'https://github.com/zer0main/battleship'},
    {'Роман Кудрин', 'explover', 'explover', },
    {'Анастасия Князева', 'nknjasewa', 'nknjasewa', },
    {'Иван Ильницкий', 'ilnitsky', 'ilnitsky', },
    {'Наталия Кашко', 'nataliya.kashko', 'natilika', },
    {'Дмитрий Пензар', 'darkvampirewolf', 'dmitrypenzar1996', 'https://github.com/dmitrypenzar1996/Trees_Construction_Visualization.git'},
    {'Злобин Александр', 'alexander.zlobin', 'AlxTheEvil'},
    {'Просвиров Кирилл', 'prosvirov.k', 'Akado2009'},
    {'Михаил Молдован', 'mikemoldovan', 'mikemoldovan'},
    {'Андрей Демкив', 'andrei-demkiv', 'Andrei-demkiv'},
    {'Валяева Анна', 'kuararo', 'kirushka'}
}

local unpack = unpack or table.unpack

print("||Имя, тесты||Github||Учебный проект||")
for _, participant in ipairs(participants) do
    local name, kodomo, github, projecturl =
        unpack(participant)
    local kodomolink, quizlink
    if kodomo then
        kodomolink = ('[[http://kodomo.fbb.msu.ru/~%s|%s]]')
            :format(kodomo, name)
        quizlink = ('[[http://kodomoquiz.tk/admin/user/%s|#]]')
            :format(kodomo)
    else
        kodomolink = name
        quizlink = ''
    end
    local githublink = ('[[https://github.com/%s|%s]]')
        :format(github, github)
    local projectlink = ''
    if projecturl then
        local projectname = projecturl:match(
            'https://github.com/[^/]+/([^/]+)/?')
        projectlink = ('[[%s|%s]]')
            :format(projecturl, projectname)
    end
    print(("||%s %s||%s||%s||"):format(kodomolink,
        quizlink, githublink, projectlink))
end
