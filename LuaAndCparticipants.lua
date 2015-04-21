-- http://kodomo.fbb.msu.ru/wiki/Main/LuaAndC/Participants

local participants = {
    {'Александра Галицына', 'agalicina', 'agalitsyna', 'https://github.com/agalitsyna/LOF.git'},
    {'Анна Колупаева', 'kolupaeva', 'AnyaKol', 
        'https://github.com/AnyaKol/Lua_C'},
    {'Александра Бойко', 'boyko.s', 'boykos', },
    {'Андрей Сигорских', 'crescent8547', 'CarolusRex8547',
        'https://github.com/Talianash/GlobinDetector-2015'},
    {'Иван Русинов', 'is_rusinov', 'isrusin', },
    {'Игорь Поляков', 'ranhummer', 'RanHum', cw=6},
    {'Борис Нагаев', 'bnagaev', 'starius',
        'https://github.com/LuaAndC/LuaAndC'},
    {'Татьяна Шугаева', 'talianash', 'Talianash',
        'https://github.com/Talianash/GlobinDetector-2015',
        cw=5},
    {'Дарья Диброва', 'udavdasha', 'udavdasha', },
    {'Павел Долгов', '', 'zer0main',
        {'https://github.com/zer0main/battleship',
         'https://github.com/zer0main/bin_game_mvc'}},
    {'Роман Кудрин', 'explover', 'explover', cw=4},
    {'Анастасия Князева', 'nknjasewa', 'nknjasewa', },
    {'Иван Ильницкий', 'ilnitsky', 'ilnitsky', },
    {'Наталия Кашко', 'nataliya.kashko', 'natilika', cw=5},
    {'Дмитрий Пензар', 'darkvampirewolf', 'dmitrypenzar1996',
    'https://github.com/dmitrypenzar1996/Trees_Construction_Visualization.git',
        cw=9},
    {'Злобин Александр', 'alexander.zlobin', 'AlxTheEvil'},
    {'Просвиров Кирилл', 'prosvirov.k', 'Akado2009',
        cw=11},
    {'Михаил Молдован', 'mikemoldovan', 'mikemoldovan', cw=5},
    {'Андрей Демкив', 'andrei-demkiv', 'Andrei-demkiv', cw=4},
    {'Валяева Анна', 'kuararo', 'kirushka', cw=3},
    {'Дианкин Игорь', 'diankin', 'Warrdale', cw=3},
    {'Горбатенко Владислав', 'vladislaw_aesc', 'ubiquinone'},
    {'Николаева Дарья', 'chlamidomonas', 'chlamidomonas'},
}

local unpack = unpack or table.unpack

local function cwMark(cw)
    if cw >= 5 then
        return 'отлично'
    elseif cw == 4 then
        return 'хорошо'
    elseif cw == 3 then
        return 'зачтена'
    else
        return ''
    end
end

print("||Имя, тесты||Github||Учебные проекты||[[/../cw|Контрольная]]||")
for _, participant in ipairs(participants) do
    local name, kodomo, github, projecturls =
        unpack(participant)
    local cw = participant.cw
    local mark = ' '
    if cw then
        mark = ("%d б., %s"):format(cw, cwMark(cw))
    end
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
    local projectlinks = {}
    if projecturls then
        if type(projecturls) == 'string' then
            projecturls = {projecturls}
        end
        assert(type(projecturls) == 'table')
        for _, projecturl in ipairs(projecturls) do
            local projectname = projecturl:match(
                'https://github.com/[^/]+/([^/]+)/?')
            local projectlink = ('[[%s|%s]]')
                :format(projecturl, projectname)
            table.insert(projectlinks, projectlink)
        end
    end
    print(("||%s %s||%s||%s||%s||"):format(kodomolink,
        quizlink, githublink,
        table.concat(projectlinks, ', '), mark))
end
