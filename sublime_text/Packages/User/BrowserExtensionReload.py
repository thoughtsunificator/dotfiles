import websocket
try:
		import thread
except ImportError:
		import _thread as thread
import time
import json
import ssl

import sublime, sublime_plugin, os

ws = None
addons = None

class BrowserExtensionReload( sublime_plugin.EventListener ):

	def on_post_save(self, view):
		global ws, addons
		filename = os.path.splitext(view.file_name())[0]
		print("[BrowserExtensionReload] on_post_save")
		cAddon = None
		if addons != None:
			for addon in addons:
				if cAddon != None:
					break
				if addon["path"] in filename:
					cAddon = addon
					break
				for path in addon["watch"]:
					print(path)
					if path in filename:
						cAddon = addon
						break
			if cAddon != None:
				print("[BrowserExtensionReload] sending reload query...")
				ws.send("{ \"query\": \"reload\", \"data\": \""+ cAddon["id"] +"\" }")

def on_message(ws, message):
		global addons
		print("[BrowserExtensionReload] " + message)
		data = json.loads(message)
		if data["query"] == "initialize":
			addons = data["data"]

def on_error(ws, error):
		print("[BrowserExtensionReload] " + error)

def on_close(ws):
		print("[BrowserExtensionReload] ### closed ###")

def on_open(ws):
		print("[BrowserExtensionReload] ### opened ###")
		ws.send("{ \"query\": \"initialize\" }")

def run():
	global ws
	websocket.enableTrace(True)
	ws = websocket.WebSocketApp("ws://127.0.0.1:7879",
														on_message = on_message,
														on_error = on_error,
														on_close = on_close)
	ws.on_open = on_open
	ws.run_forever()

if __name__ == "User.BrowserExtensionReload":
	thread.start_new_thread(run, ())
