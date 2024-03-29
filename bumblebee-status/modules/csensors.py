# -*- coding: UTF-8 -*-
# pylint: disable=C0111,R0903

"""Displays sensor temperature

Parameters:
    * sensors.path: path to temperature file (default /sys/class/thermal/thermal_zone0/temp).
    * sensors.json: if set to 'true', interpret sensors.path as JSON 'path' in the output
      of 'sensors -j' (i.e. <key1>/<key2>/.../<value>), for example, path could
      be: 'coretemp-isa-00000/Core 0/temp1_input' (defaults to 'false')
    * sensors.match: (fallback) Line to match against output of 'sensors -u' (default: temp1_input)
    * sensors.match_pattern: (fallback) Line to match against before temperature is read (no default)
    * sensors.match_number: (fallback) which of the matches you want (default -1: last match).
    * sensors.show_freq: whether to show CPU frequency. (default: true)


contributed by `mijoharas <https://github.com/mijoharas>`_ - many thanks!
"""

import util.format
import util.cli
import core.input
import core.widget
import core.module
import re
import json
import logging

log = logging.getLogger(__name__)


class Module(core.module.Module):
    def __init__(self, config, theme):
        super().__init__(config, theme, core.widget.Widget(self.temperature))

        self._temperature = "unknown"
        self._mhz = "n/a"
        self._match_number = int(self.parameter("match_number", "-1"))
        self._match_pattern = self.parameter("match_pattern", None)
        self._pattern = re.compile(
            r"^\s*{}:\s*([\d.]+)$".format(self.parameter("match",
                                                         "temp1_input")),
            re.MULTILINE,
        )
        self._json = util.format.asbool(self.parameter("json", False))
        self._freq = util.format.asbool(self.parameter("show_freq", True))
        core.input.register(self, button=core.input.LEFT_MOUSE, cmd="xsensors")
        self.determine_method()

    def determine_method(self):
        if self.parameter("path") != None and self._json == False:
            self.use_sensors = False  # use thermal zone
        else:
            # try to use output of sensors -u
            try:
                output = util.cli.execute("sensors -u")
                self.use_sensors = True
                log.debug("Sensors command available")
            except FileNotFoundError as e:
                log.info(
                    "Sensors command not available, using /sys/class/thermal/thermal_zone*/"
                )
                self.use_sensors = False

    def _get_temp_from_sensors(self):
        if self._json == True:
            try:
                output = json.loads(util.cli.execute("sensors -j"))
                for key in self.parameter("path").split("/"):
                    output = output[key]
                return int(float(output))
            except Exception as e:
                logging.error("unable to read sensors: {}".format(str(e)))
                return "unknown"
        else:
            output = util.cli.execute("sensors -u")
            if self._match_pattern:
                temp_pattern = self.parameter("match", "temp1_input")
                match = re.search(
                    r"{}.+{}:\s*([\d.]+)$".format(self._match_pattern,
                                                  temp_pattern),
                    output.replace("\n", ""),
                )
                if match:
                    return int(float(match.group(1)))
                else:
                    return "unknown"
            match = self._pattern.findall(output)
            if match:
                return int(float(match[self._match_number]))
        return "unknown"

    def get_temp(self):
        if self.use_sensors:
            temperature = self._get_temp_from_sensors()
            log.debug("Retrieve temperature from sensors -u")
        else:
            try:
                temperature = open(
                    self.parameter(
                        "path", "/sys/class/thermal/thermal_zone0/temp")
                ).read()[:2]
                log.debug("retrieved temperature from /sys/class/")
                # TODO: Iterate through all thermal zones to determine the correct one and use its value
                # https://unix.stackexchange.com/questions/304845/discrepancy-between-number-of-cores-and-thermal-zones-in-sys-class-thermal

            except IOError:
                temperature = "unknown"
                log.info(
                    "Can not determine temperature, please install lm-sensors")

        return temperature

    def get_mhz(self):
        mhz = None
        try:
            output = open(
                "/sys/devices/system/cpu/cpufreq/policy0/scaling_cur_freq"
            ).read()
            mhz = int(float(output) / 1000.0)
        except:
            output = open("/proc/cpuinfo").read()
            m = re.search(r"cpu MHz\s+:\s+(\d+)", output)
            if m:
                mhz = int(m.group(1))
            else:
                m = re.search(r"BogoMIPS\s+:\s+(\d+)", output)
                if m:
                    return "{} BogoMIPS".format(int(m.group(1)))
        if not mhz:
            return "n/a"

        if mhz < 1000:
            return "{} MHz".format(mhz)
        else:
            return "{:0.01f} GHz".format(float(mhz) / 1000.0)

    def temperature(self, _):
        if self._freq:
            return "{}°C @ {}".format(self._temperature, self._mhz)
        else:
            return "{}°C".format(self._temperature)

    def update(self):
        self._temperature = self.get_temp()
        if self._freq:
            self._mhz = self.get_mhz()

    def state(self, widget):
        return self.threshold_state(self.get_temp(), 60, 80)

# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
