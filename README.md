# Hass.io Add-on: qsusb
Qwikswitch QSUSB hub support for Hass.io

### About
This add-on allows for support for the Qwikswitch (https://qwikswitch.co.za/) QSUSB modem device in Hass.io. 
The add-on will communicate via USB port to QSUSB modem that communicates via RF to the Qwikswitch range of products (dimmers, relays).
The qwikswitch component (https://www.home-assistant.io/components/qwikswitch/) will provide support within Home-assistant. Tested on Hass.io version 0.75 and above on HassOS (1.9) on Raspberry Pi 2.

### Installation
1. Add the add-ons repository to your Hass.io instance: `https://github.com/nardusleroux/hassio-qsusb`
2. Install the QSUSB add-on
3. Configure the Qwikswitch devices in the Config section. 


### Usage

Start the add-on. The Qwikswitch QS Mobile application will be hosted by default on port 2020 of Hassos. It is not necessary to use the QS Mobile application since Qwikswitch devices are defined already in the config section.

Add the Qwikswitch section as per the Qwikswitch component (https://www.home-assistant.io/components/qwikswitch/)

### Configuration

Add the devices in the config section of Hass.io add-on.

Example Configuration:
```json
{
  "devices": [
    {
      "string": "@129b70/rel/Study lamp"
    },
    {
      "string": "@16aa30/rel/Kitchen lamp"
    }
  ]
}
```

The entries above will be written to the devices file that are used by the QSUSB software to make devices persistent across upgrades and restarts.

----

