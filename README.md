# ip_return
Give you the IP of your raspberry with the minimal display cost, thanks to a LED branched on GPIO_18.
the good initialization of the script is given by two very short blinks (0.2s) seperated by 2s of wait.
Then every number of the IPcode is given by short blinks (0.5s) and separed each other by long blinks(2s).
the IP is given MSB first.
you will receive the initiate sequence and . _ .. _ ... _ ... _ .... _ ..... _ ...... _ ....... _ ......... _ for 123.34.567.90
the script does not handle 0 nor dots. be aware.
