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
        text: "Data from Home Assistant:"
      }
    },
    {
      module: "clock",
      position: "top_right"
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
            deviceLabel: "Front door",
            deviceReadings: [
            {
              sensor: "binary_sensor.front_door"
            }
            ]
          },
          { 
            deviceLabel: "Speedtest",
            deviceReadings: [
            {
              sensor: "sensor.speedtest_download"
            }
            ]
          },
          { 
            deviceLabel: "Published Hass.io version",
            deviceReadings: [
            {
              sensor: "sensor.published_hass_io_version"
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
      text: "WELCOME"
      }
    },
    {
      module: "helloworld",
      position: "middle_center",
      config: {
      text: "MagicMirror² - Community Hass.io Add-on"
      }
    }
  ]
};

/*************** DO NOT EDIT THE LINE BELOW ***************/
if (typeof module !== "undefined") {module.exports = config;}
