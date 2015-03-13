-- http://kodomo.fbb.msu.ru/wiki/Main/LuaAndC/Participants

local participants = {
    {'Александра Галицина', 'agalicina', 'agalitsyna', },
    {'Анна Колупаева', 'kolupaeva', 'AnyaKol', },
    {'Александра Бойко', 'boyko.s', 'boykos', },
    {'Андрей Сигорских', 'crescent8547', 'CarolusRex8547', },
    {'Иван Русинов', 'is_rusinov', 'isrusin', },
    {'Игорь Поляков', 'ranhummer', 'RanHum', },
    {'Борис Нагаев', 'bnagaev', 'starius', },
    {'Татьяна Шугаева', 'talianash', 'Talianash', },
    {'Дарья Диброва', 'udavdasha', 'udavdasha', },
    {'Павел Долгов', '', 'zer0main', },
    {'Роман Кудрин', 'explover', 'explover', },
    {'Анастасия Князева', 'nknjasewa', 'nknjasewa', },
    {'Иван Ильницкий', 'ilnitsky', 'ilnitsky', },
    {'Наталия Кашко', 'nataliya.kashko', 'natilika', },
}

local unpack = unpack or table.unpack

print("||Имя, тесты||Github||")
for _, participant in ipairs(participants) do
    local name, kodomo, github = unpack(participant)
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
    print(("||%s %s||%s||"):format(kodomolink,
        quizlink, githublink))
end
