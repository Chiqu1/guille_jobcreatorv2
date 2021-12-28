// OXMYSQL Wrapper code, all right deserver to them.

const { createPool } = require('mysql2/promise');

const pool = createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'plumeesxlegacy_4f954e',
    charset: 'utf8mb4_unicode_ci',
    multipleStatements: false,
    namedPlaceholders: true,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

const execute = async (query, parameters) => {
    ScheduleResourceTick(GetCurrentResourceName());
    try {
        console.time(query);
        const [result] = await pool.execute(query, parameters);
        console.timeEnd(query);
        return result;
    } catch (error) {
        return console.error(error.message);
    }
}

global.exports("execute", (query, parameters, callback = () => { }) => {
    execute(query, parameters).then((result) => {
        callback(result)
    });

});
