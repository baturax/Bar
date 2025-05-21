#!/usr/bin/env python3
import os
import subprocess
import time
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

current_process = None

class ChangeHandler(FileSystemEventHandler):
    def on_modified(self, event):
        global current_process
        
        if not event.is_directory:
            self.run_commands()

    def run_commands(self):
        global current_process
        
        if current_process:
            current_process.kill()
            current_process.wait()
        
        try:
            subprocess.run("clear", shell=True, check=True)
            subprocess.run("ninja -C ../../buildDir/", shell=True, check=True)
            
            current_process = subprocess.Popen(
                "./../../buildDir/src/wallpaper/baiwallpaper",
                shell=True
            )
        except subprocess.CalledProcessError as e:
            print(f"Hata oluştu: {e}")

if __name__ == "__main__":
    path = "."
    
    event_handler = ChangeHandler()
    observer = Observer()
    observer.schedule(event_handler, path, recursive=True)
    
    try:
        observer.start()
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
        
        if current_process:
            current_process.kill()
    observer.join()
