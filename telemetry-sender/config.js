/*global module, require */

module.exports = (function() {
    'use strict';

    return {
        mqtt: {
            url: "mqtt://m21.cloudmqtt.com",
            options: {
                port: 10947,
                username: "elMeter",
                password: ""
            },
            getTopic: function(meterId) {
                return 'ustug/' + meterId + '/el-power/meter/readings';
            }
        }
    };

}());
