#!/usr/bin/env ruby

# file: gtk2keypress.rb

# description: Use within a Ruby GTK2 application for triggering on_keypress, 
#              on_keydown, and on_keyup events.


class Gtk2KeyPress

  def initialize(parent, external=nil)

    parent.add_events(Gdk::Event::KEY_PRESS)
    last_keydown, last_keyup = '', ''

    parent.signal_connect("key-press-event") do |w, e|

      last_keyup = ''

      if last_keydown != e.keyval then

        def e.val()
          self.keyval
        end

        def e.name()
          Gdk::Keyval.to_name(self.keyval)
        end

        on_keypress(e)
        external.on_keypress if external and external.respond_to? :on_keypress
        on_keydown(e)
        external.on_keydown if external and external.respond_to? :on_keydown 

      end

      last_keydown = e.keyval
    end


    parent.signal_connect("key-release-event") do |w, e|

      last_keydown = ''

      if e.keyval != last_keyup and e.keyval != last_keydown then        

        def e.val()
          self.keyval
        end

        def e.name()
          Gdk::Keyval.to_name(self.keyval)
        end

        on_keyup(e)
        external.on_keyup if external and external.respond_to?  :on_keyup
      end

      last_keyup = e.keyval

    end

  end

  private

  def on_keypress(e)
  end

  def on_keydown(e)
  end

  def on_keyup(e)
  end
end