#! /usr/bin/python3

from gi.repository import Gtk, GLib
from leggi_file import leggi_file
from matplotlib.pyplot import hist, savefig

class Interfaccina:
    def __init__(self):
        self.ui = Gtk.Builder()
        self.ui.add_from_file('interfaccina2.glade')
        self.ui.connect_signals(self)
    
    def parti(self):
        self.main_loop = GLib.MainLoop()
        self.main_loop.run()
    
    def analizza(self, *args):
        filechooser = self.ui.get_object('filechooserbutton1')
        path = filechooser.get_filename()
        statistiche = leggi_file(path)
        valori = list(statistiche.values())
        hist(valori)
        savefig('valori.png')
        image = self.ui.get_object('image1')
        image.clear()
        image.set_from_file('valori.png')
        
    def esci(self, *args):
        print("OK, esco")
        self.main_loop.quit()


if __name__ == '__main__':
    i = Interfaccina()
    i.parti()
