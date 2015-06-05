#! /usr/bin/python3

from gi.repository import Gtk, GLib

class Programmino:
    def __init__(self):
        print(self, "è stato creato")
        self.finestra = Gtk.Window()
        self.finestra.show()
        self.finestra.connect("delete-event", self.esci)
        
        self.crea_pulsante()
    
    def crea_pulsante(self):
        pulsante = Gtk.Button("Pigiami")
        self.finestra.add(pulsante)
        pulsante.show()
        pulsante.connect("clicked", self.pigiato)
    
    def parti(self):
        self.loop = GLib.MainLoop()
        self.loop.run()

    def pigiato(self, *args):
        messaggio = Gtk.MessageDialog(title="Ahia",
                                      text="Non così forte!!",
                                      parent=self.finestra)
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
