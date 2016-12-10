var mqtt = require('mqtt');
var conf = require('./config').mqtt;

var client  = mqtt.connect(conf.url, conf.options);

client.on('connect', function sendMockReadings () {

    client.subscribe(conf.getTopic('+'));

    client.publish(conf.getTopic('34'),
        '{"start":"2016-12-11T00:00:00Z","end":"2016-12-11T24:00:00Z",' +
        '"consumed":12,"generated":10,"units":"kWh"}');

    client.publish(conf.getTopic('31'),
        '{"start":"2016-12-11T00:00:00Z","end":"2016-12-11T24:00:00Z",' +
        '"consumed":5,"generated":3,"units":"kWh"}');

    client.publish(conf.getTopic('29'),
        '{"start":"2016-12-11T00:00:00Z","end":"2016-12-11T24:00:00Z",' +
        '"consumed":18,"generated":0,"units":"kWh"}');

    console.log("data sent");

    // client.end();

});

client.on('message', function (topic, message) {
    console.log(message.toString());
    // client.end();
});

console.log("sending mock electricity consumption data to the Balancer");