
require("dotenv").config();
// var redis = require('redis')
// import redis from 'redis'
// import { createClient } from 'redis';
const { createClient } = require('redis');


    let hostname = process.env.REDIS_HOSTNAME;
    let port = process.env.REDIS_PORT;
    let password = process.env.REDIS_PASSWORD ;


const client = createClient({
    url: `redis://default:${password}@${hostname}:${port}`
 });



 (async () => {
    await client.connect();
})();

client.on('connect', () => console.log('::> Redis Client Connected'));
client.on('error', (err) => console.log('<:: Redis Client Error', err));

module.exports = client
