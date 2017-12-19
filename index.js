/**
 * @version: 0.8
 * @author: Flicked from online.
 * @desc: A sample Node based Lambda to print the Time of a particaular timezone.
 */
 
var time = require('time');

// Lambda handler.
exports.handler = (event, context, callback) => {

    var currentTime = new time.Date(); 
    currentTime.setTimezone("Asia/Calcutta");

    // I am done.
    callback(null, {
        statusCode: '200',
        body: 'The time in Trivandrum is: ' + currentTime.toString(),
    });

};