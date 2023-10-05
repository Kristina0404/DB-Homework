--Вывести ко-во незаблокированных юзеров не из Germany

db.users.countDocuments(
{
    is_blocked: {$ne:true},
    country:{$ne:'Germany'}
})

--Вывести имена юзеров не из Germany

db.users.find({
    country:{$ne:'Germany'}
},
{ fullname:1,_id:0
})

--Уменьшить баланс заблокированных юзеров на 5%

db.users.updateMany(
{
    is_blocked : true
},
{$mul: {balance: 0.95}}
)

--Вывести название треков продолжительностью от 1 до 10 мин

db.tracks.find(
    { duration_secs: { $gte: 1 * 60, $lte: 10 * 60 } },
    { title: 1, _id: 0 }
)

--Разблокировать юзеров из France

db.users.updateMany(
    {
        country:  'France' ,
        is_blocked:true 
    },
     { $unset: { is_blocked: null } }
    
)