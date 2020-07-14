# Hass.io Add-on: qsusb

Qwikswitch QSUSB hub support for Hass.io

## About

This add-on allows for support for the [Qwikswitch](https://qwikswitch.co.za/) QSUSB modem device in Hass.io.
The add-on will communicate via USB port to QSUSB modem that communicates via RF to the Qwikswitch range of products (dimmers, relays).
The [qwikswitch component](https://www.home-assistant.io/components/qwikswitch/) will provide support within Home-assistant. Tested on Hass.io version 0.75 and above on HassOS (1.9) on Raspberry Pi 2.

## Installation

1. Currently the addon should be added as local build. Follow step 1 and step 2 of [Local add-on testing](https://developers.home-assistant.io/docs/add-ons/testing)
2. Install the QSUSB add-on
3. Configure the Qwikswitch devices in the Config section.

## Usage

Start the add-on. The Qwikswitch QS Mobile application will be hosted by default on port 2020 of Hassos. It is not necessary to use the QS Mobile application since Qwikswitch devices are defined already in the config section.

Add the Qwikswitch section as per the [Qwikswitch component](https://www.home-assistant.io/components/qwikswitch/)

## Configuration

The port can be changed from the default value of 2020.

Add the devices in the config section of Hass.io add-on.

Example Configuration:

```yaml
port: '2020'
devices:
  - string: '@129b70/rel/Study lamp'
  - string: '@16aa30/rel/Kitchen lamp'
```

Each device string is divided into 3 parts separated with a forward-slash (/), the first part is the QS device ID/device type/name of device.  The following device types are applicable:

- rel - Relay
- dim - Dimmer
- art - SwitchArt
- tmp - Temperature Sensor
- hum - Humidity Sensor
- gey - Geyser
- bli - Motor/Controller

The entries above will be written to the devices file that are used by the QSUSB software to make devices persistent across upgrades and restarts.

----
