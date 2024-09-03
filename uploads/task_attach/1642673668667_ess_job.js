var cron = require('node-cron');
cron.schedule('* * 8 * * *', () => {
    //  0 09 * * * everyday @ 9 o'clock in the morning 
    console.log('running a task every minute');
});