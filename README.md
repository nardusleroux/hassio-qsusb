# Hass.io Add-on: qsusb

Qwikswitch QSUSB hub support for Hass.io

## About

This add-on allows for support for the [Qwikswitch](https://qwikswitch.co.za/) QSUSB modem device in Hass.io.
The add-on will communicate via USB port to QSUSB modem that communicates via RF to the Qwikswitch range of products (dimmers, relays).
The [qwikswitch component](https://www.home-assistant.io/components/qwikswitch/) will provide support within Home-assistant. This add-on supports 64bit architectures (aarch64 and x86_64).

## Installation

1. Add the repository to the HomeAssistant Supervisor
   <br>[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fnardusleroux%2Fhassio-qsusb)
   `https://github.com/nardusleroux/hassio-qsusb`. (From the HomeAssistant frontend: *Supervisor* > *Add-on store* > *...* > *Repositories*)
2. Install the *QwikSwitch USB Hub* Addon
3. Configure the Qwikswitch devices in the Config section.

Note: Local install can be done for development: Follow step 1 and step 2 of [Local add-on testing](https://developers.home-assistant.io/docs/add-ons/tutorial)

## Usage

Start the add-on. The Qwikswitch QS Mobile application will be hosted by default on port 2020 of Hassos. It is not necessary to use the QS Mobile application since Qwikswitch devices are defined already in the config section.

Add the Qwikswitch section as per the [Qwikswitch component](https://www.home-assistant.io/components/qwikswitch/)

## Configuration

The default port of 2020 can be mapped to another external port.

Add the devices in the config section of Hass.io add-on.

Example Configuration:

```yaml
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
