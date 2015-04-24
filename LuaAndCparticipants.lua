-- http://kodomo.fbb.msu.ru/wiki/Main/LuaAndC/Participants

local participants = {
    {'Александра Галицына', 'agalicina', 'agalitsyna',
        'https://github.com/agalitsyna/LOF.git', group=401},
    {'Анна Колупаева', 'kolupaeva', 'AnyaKol',
        'https://github.com/AnyaKol/Lua_C', group=102},
    {'Андрей Сигорских', 'crescent8547', 'CarolusRex8547',
        'https://github.com/Talianash/GlobinDetector-2015',
        group=101},
    {'Иван Русинов', 'is_rusinov', 'isrusin', },
    {'Игорь Поляков', 'ranhummer', 'RanHum', cw=6, group=102},
    {'Борис Нагаев', 'bnagaev', 'starius',
        'https://github.com/LuaAndC/LuaAndC'},
    {'Татьяна Шугаева', 'talianash', 'Talianash',
        'https://github.com/Talianash/GlobinDetector-2015',
        cw=5, group=102},
    {'Дарья Диброва', 'udavdasha', 'udavdasha', },
    {'Павел Долгов', '', 'zer0main',
        {'https://github.com/zer0main/battleship',
         'https://github.com/zer0main/bin_game_mvc',
         'https://github.com/zer0main/hamster_ball'}},
    {'Роман Кудрин', 'explover', 'explover', cw=4, group=102},
    {'Анастасия Князева', 'nknjasewa', 'nknjasewa', group=102},
    {'Иван Ильницкий', 'ilnitsky', 'ilnitsky', group=101},
    {'Наталия Кашко', 'nataliya.kashko', 'natilika',
        cw=5, group=102},
    {'Дмитрий Пензар', 'darkvampirewolf', 'dmitrypenzar1996',
    'https://github.com/dmitrypenzar1996/Trees_Construction_Visualization.git',
        cw=9, group=201},
    {'Александр Злобин', 'alexander.zlobin', 'AlxTheEvil',
        group=202},
    {'Кирилл Просвиров', 'prosvirov.k', 'Akado2009',
        cw=11, group=202},
    {'Михаил Молдован', 'mikemoldovan', 'mikemoldovan',
        cw=5, group=202},
    {'Андрей Демкив', 'andrei-demkiv', 'Andrei-demkiv',
        cw=4, group=202},
    {'Анна Валяева', 'kuararo', 'kirushka', cw=3, group=201},
    {'Игорь Дианкин', 'diankin', 'Warrdale', cw=3, group=102},
    {'Владислав Горбатенко', 'vladislaw_aesc', 'ubiquinone',
        group=101},
    {'Дарья Николаева', 'chlamidomonas', 'chlamidomonas',
        group=101},
}

-- sort by group and then by name
table.sort(participants, function(a, b)
    local a_group = a.group or 999
    local b_group = b.group or 999
    local a_firstname, a_lastname = a[1]:match('(%S+) (%S+)')
    local b_firstname, b_lastname = b[1]:match('(%S+) (%S+)')
    return a_group < b_group or
        (a_group == b_group and a_lastname < b_lastname)
end)

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

print("||Группа||Имя, тесты||Github||Учебные проекты||[[/../cw|Контрольная]]||")
for _, participant in ipairs(participants) do
    local name, kodomo, github, projecturls =
        unpack(participant)
    local group = participant.group or ' '
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
    else
        projectlinks = {' '}
    end
    print(("||%s||%s %s||%s||%s||%s||"):format(
        group, kodomolink, quizlink, githublink,
        table.concat(projectlinks, ', '), mark))
end
