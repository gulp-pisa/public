****** README for SolarSystemTour_for1.3.2.celx ******

SYSTEM REQUIREMENTS:
This version of SolarSystemTour requires Celestia 1.3.2 - it will not run with Celestia version 1.3.1 or previous.

SOURCE:
This script is an adaption of Harald Schmidt's SolarSystemTour_v1.1.celx script. The algorithm for loading and moving from object to object is only slightly modified. 

MODIFICATIONS:
Features added to enhance Harald's original script are:
   - a way of specifying multiple systems to tour, including: planetary systems within our solar system (eg. the moons and captured asteroids around Jupiter), extrasolar systems with their planets and other satellites, and fictional solar systems such as Rassilon's beautiful Katalina system (if you have it loaded on your system).
   - the facility to adjust the speed of each tour and to set the tour speed interactively with a keypress
   - the specification of different objects for viewing - such as planets only, planets and moons, asteroids only, comets only, asteroids and comets, spacecraft in solar orbit (but not spacecraft in planetary orbits) or all objects (excluding spacecraft and invisibles), and
   - automatic restoration of the user's original render settings on completion of the script. 

KNOWN ISSUES & WORK-AROUNDS:
   - Tours run at very high speeds (especially tour speed 0) may result in jerky tour progress and stuttering rendering of objects, especially if objects have large texture files. It is worth running high speed tours twice, back-to-back, as rendering will be smoother on the second pass due to graphical data still being available in the cache memory of your computer. 
   - Again, for very high speed tours, objects may occasionally be overshot - especially objects such as spacecraft and small asteroids or moons. The tour will proceed after a brief notification is given of the overshoot. Running the same tour a second time back-to-back with the first tour may eliminate overshoots due to graphical data still being available in the cache memory of your computer. 
   - Selecting a slower tour speed will usually eliminate both these problems. Tour speed 0 ("stupendously fast!") is provided to give a rapid overview of a solar or planetary system, not for smooth viewing of objects within them.

SIMILAR SCRIPTS:
A version of SolarSystemTour is available to run with Celestia 1.3.1. You can download it from 
http://myweb.tiscali.co.uk/timmcmahon/SolarSystemTour_for_1_3_1.zip. 
It has the same functionality as the script designed to run with Celestia 1.3.2, except:
   - there is no automatic restoration of the user's original render settings on completion of the script, and 
   - tour speeds for each individual system can be changed by manually editing the script, not interactively with a keypress when the script is running.

I have also developed a similar script for touring deep space objects - DeepSpaceTour_v1.0.celx, available at 
http://myweb.tiscali.co.uk/timmcmahon/DeepSpaceTour_v1_0.zip
See posts in the Celestia scripting forum for discussion of this script and additional features to be added to it in the future.

CREDITS:
Huge thanks to Harald for the original work, and to Don Goyette for example scripts using the new LUA commands. Thanks also to numerous Celestia forum members for feedback on earlier versions of this script, and especially to Terrier for repeated testing and numerous suggestions for improvement. 

I hope you enjoy SolarSystemTour for Celestia 1.3.2. 

Tim McMahon
tim.mcmahon@tiscali.co.uk

1 April 2004