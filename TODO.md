# TODO
- repo
  - Thorough readme with goals/plans/pictures
- firmware
  - increase timer accuracy
  - enable watchdog timer
- operating system
  - decrease boot time
  - expose patch folder over usb
  - components
    - key-driver
      - replace libc with existing safe wrappers
      - implement velocity calculations
      - read inputs from buttons/controls on keyboard
    - keystation
      - expose an api for other components to control the system
      - expose the same api over a second usb serial port 
      - absorb patch-loader functionality
      - support rootfs updating/switching
      - support boot partition updating
    - key-controller
      - absorb screen responsibility
      - read inputs next to screen
      - show UI to control the system
      - show screensaver when UI hasn't updated in a while (OLED burn in prevention)
- hardware
  - connect buttons on OLED board
  - connect buttons+led on keyboard
  - find ADC for analog controls
  - replace keys with an isomorphic layout
    - replicate key mechanism in CAD
    - janko
    - flat bars