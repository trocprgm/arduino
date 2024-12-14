import os
import time
from flask import Flask, request, redirect
from twilio.twiml.messaging_response import MessagingResponse
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

GPIO.setup(18, GPIO.OUT, initial=GPIO.LOW)


app = Flask(__name__)

@app.route("/sms", methods=['GET', 'POST'])


def sms_reply():
	message_body = request.form['Body']
	resp = MessagingResponse()
	
	if message_body == "on" or message_body == "On":
		resp.message("status: on")
		GPIO.output(18, GPIO.HIGH)
	elif message_body == "off" or message_body == "Off":
		resp.message("status: off")
		GPIO.output(18, GPIO.LOW)
	else:
		resp.message("unacceptable command")
		
	return str(resp)

if __name__ == "__main__":
	app.run(debug=True)
	a = True
