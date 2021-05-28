power_pin = 4
gpio.mode(power_pin, gpio.OUTPUT)
gpio.write(power_pin, gpio.HIGH)

intr_pin = 5
gpio.mode(intr_pin, gpio.INT, gpio.PULLUP)
function powerTrg()
	print("RTC interrupt, power on")
	gpio.write(power_pin, gpio.HIGH)
end
gpio.trig(intr_pin, "down", powerTrg)

shutdown_pin = 3
gpio.mode(shutdown_pin, gpio.INT)
function shutdownTrg()
	print("GPIO interrupt, power off")
	gpio.write(power_pin, gpio.LOW)
end
gpio.trig(shutdown_pin, "low", shutdownTrg)
