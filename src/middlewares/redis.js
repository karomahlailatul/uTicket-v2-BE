const client = require('../config/redis')
const responseHelper  = require('../helper/responseHelper')


// const hitCacheGetProfileUsers = async (req, res, next) => {

//     const email = req.payload.email;

//     const dataListCache = await client.keys('users*')

//     console.log( dataListCache)

//     const getProfileUsers = await client.get(`users/${email}`)
//     if (getProfileUsers) {
//         return responseHelper(res, JSON.parse(getProfileUsers), 200, 'get data success from redis')
//     }
//     next()
// }

const hitCacheGetProfileUsers = async (req, res, next) => {

    const email = req.payload.email;

    const dataListCache = await client.keys('users*')

    console.log( dataListCache)

    const getProfileUsers = await client.get(`users/${email}`)
    if (getProfileUsers) {
        return responseHelper(res, JSON.parse(getProfileUsers), 200, 'get data success from redis')
    }
    next()
}

const deleteCacheProfileUsers = (req, res, next) => {
    const email = req.payload.email;
    client.del(`users/${email}`)
    next()
}



module.exports = {
    hitCacheGetProfileUsers,
    deleteCacheProfileUsers,
}