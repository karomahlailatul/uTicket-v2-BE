
require("dotenv").config();
const redis = require('@redis/client')
// import redis from 'redis'

    let hostname = process.env.REDIS_HOSTNAME;
    let port = process.env.REDIS_PORT;
    let password = process.env.REDIS_PASSWORD ;


const client = redis.createClient({
    url: `redis://default:${password}@${hostname}:${port}`
 });


client.on('error', (err) => console.log('Redis Client Error', err));

client.connect();

module.exports = client
