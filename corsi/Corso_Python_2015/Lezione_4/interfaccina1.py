#! /usr/bin/python3

from gi.repository import Gtk, GLib

finestra = Gtk.Window()
finestra.show()

def esci(*args):
    print("OK, esco")
    loop.quit()

finestra.connect("delete-event", esci)

pulsante = Gtk.Button("Pigiami")
finestra.add(pulsante)
pulsante.show()

def pigiato(*args):
    print(args)
    print(args[0] == pulsante)
    messaggio = Gtk.MessageDialog(title="Ahia",
                                  text="Non così forte!!",
                                  parent=finestra)
    messaggio.run()

pulsante.connect("clicked", pigiato)

loop = GLib.MainLoop()
loop.run()
