var time = require('time');
exports.handler = (event, context, callback) => {
    var currentTime = new time.Date(); 
    currentTime.setTimezone("Asia/Calcutta");
    console.log("Old Test - Yes.");
    callback(null, {
        statusCode: '202',
        body: 'The time in Trivandrum is: ' + currentTime.toString(),
    });
};