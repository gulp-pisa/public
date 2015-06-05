#! /usr/bin/python3

from gi.repository import Gtk, GLib

class Programmino:
    def __init__(self):
        print(self, "è stato creato")
        self.ui = Gtk.Builder()
        self.ui.add_from_file("finestra.glade")
        self.ui.connect_signals(self)

    def parti(self):
        self.loop = GLib.MainLoop()
        self.loop.run()
    
    def pigiato(self, *args):
        messaggio = self.ui.get_object("messagedialog1")
        messaggio.run()

    def esci(self, *args):
        if not hasattr(self, "loop"):
            print("Non posso uscire, non sono mai partito")
            return
        print("OK, esco")
        self.loop.quit()


if __name__ == '__main__':
    p = Programmino()
    p.parti()
