/* Magic Mirror Config Sample */

var config = {
  address: "",
  port: 8080,
  ipWhitelist: [],
  language: "en",
  timeFormat: 24,
  units: "metric",
  modules: [
    {
      module: "helloworld",
      position: "top_left",
      config: {
        text: "MMM-HASS"
      }
    },
    {
      module: "MMM-HASS",
      position: "top_left",
      config: {
        host: "hassio/homeassistant",
        port: "",
        hassiotoken: true,
        devices: [
          { 
            deviceLabel: "Kaffetrakter",
            deviceReadings: [
            {
              sensor: "script.1550882211073",
              icon: "fa fa-coffee"
            }
            ]
          },
          { 
            deviceLabel: "Kaffetrakter",
            deviceReadings: [
            {
              sensor: "script.1550882211073",
              icon: "fa fa-coffee"
            }
            ]
          },
          { 
            deviceLabel: "Kaffetrakter",
            deviceReadings: [
            {
              sensor: "script.1550882211073",
              icon: "fa fa-coffee"
            }
            ]
          }
        ]
      }
    }, 
    {
      module: "helloworld",
      position: "middle_center",
      config: {
      text: "MM2 Demo"
      }
    }
  ]
};

/*************** DO NOT EDIT THE LINE BELOW ***************/
if (typeof module !== "undefined") {module.exports = config;}
