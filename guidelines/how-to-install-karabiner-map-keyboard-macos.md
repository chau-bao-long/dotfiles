1. Download https://karabiner-elements.pqrs.org/
2. Copy file `mac_config/custom-caplocks.json` to `~/.config/karabiner/assets/complex_modifications/`
3. Find the Karabiner icon in your menu bar and go to Preferences.
4. Go to Complex Modifications tab and click the Add rule button.
5. See a custom rule called “Post Esc if Caps is tapped, Control if held.” Enable it!
6. Go to parameters tab and change the value of to_if_alone_timeout_milliseconds from 1000 to 500
7. Go to Simple Modifications tab and create 2 new simple modifications.
  - From key caps_lock To key left_control
  - From key escape To key caps_lock
