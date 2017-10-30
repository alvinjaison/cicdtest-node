var time = require('time');
exports.handler = (event, context, callback) => {
    var currentTime = new time.Date(); 
    currentTime.setTimezone("America/Los_Angeles");
    console.log("Old Test yes.");
    callback(null, {
        statusCode: '200',
        body: 'The time in Los Angeles is: ' + currentTime.toString(),
    });
};