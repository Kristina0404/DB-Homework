-- Разблокировать юзеров из France и Germany с положительным балансом

db.users.updateMany(
    {
        country: { $in: ['France','Germany'] },
        $inc: { balance: {$gte:0},
        is_blocked:true}  
    },
    {$unset:{is_blocked:null}}
)

--Вывести названия двух произвольных треков

db.tracks.aggregate([
{
    $sample:{size :2}
}
])

--Вывести юзеров, у которых есть треки

db.users.aggregate([{
    $lookup:{
        from: 'tracks',
        localField:'_id',
        foreignField:'author_id',
        as: 'tracks'
    }
},
{$match:{'tracks':{$ne:[]}}}])

--Используя метод aggregate(), вывести ко-во юзеров без треков

db.users.aggregate([{
    $lookup :{
        from:'tracks',
        localField: '_id',
        foreignField:'author_id',
        as:'tracks'
        }
},

{$match:{'tracks':[]}},
{$count:'users'}
])