# Introducing the GTK2KeyPress gem

    #!/usr/bin/env ruby

    # file: keypress_event.rb

    require 'gtk2'
    require 'gtk2keypress'

    window = Gtk::Window.new

    window.add(Gtk::Label.new("Press Key!"))

    key = Gtk2KeyPress.new window

    def key.on_keydown(e)
      puts 'key down ' + e.name
    end

    def key.on_keyup(e)
      puts 'key up ' + e.name
    end

    window.set_default_size(100, 100).show_all

    Gtk.main

The above example demonstrates using the gtk2keypress gem within a GTK2 application. When a key is pressed down or up the on_keydown or on_keyup event is triggered.

## Resources

* Capturing a key press event in a GTK2 application http://www.jamesrobertson.eu/snippets/2016/feb/04/capturing-a-key-press-event-in-a-gtk2-application.html

gtk2 gtk2keypress gem event trigger

