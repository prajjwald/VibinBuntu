# VibinBuntu

## 22.04 and beyond... Jammin & Vibin

Alright... what is this repo for really?

[This reddit thread](https://old.reddit.com/r/Ubuntu/comments/twp8oh/viber_doesnt_work_on_ubuntu_2204_please_help/) offers some insight - Viber doesn't (yet) work with Ubuntu 22.04 Jammy, which, to be fair, is still in beta.  The expected release date is April 21st 2022.

I use [Viber Desktop](https://www.viber.com/en/download/) to communicate using Viber when on my lapttop/pc, and ever since upgrading to Jammy, it stopped working.  I tried opening a support ticket with Viber Support, who responded that Linux support was minimal, and that they didn't do many releases.  They *might* do a release in the future.

Fortunately - other folks seem to have run into, ans subsequently solved this issue - the reddit thread I linked above helped me get Viber working on my Jammy installation too.

Since I like automating even the most trivial of tasks, and since what is trivial for me and my fellow Linux enthusiasts might not be as trivial for some of my friends who use Linux (partly due to my convincing them), I figured I'd automate this workaround to get Viber working as a small script.  Hopefully this helps some folks out till we get an officially supported binary from Viber.

Here's an outline of what the script does:
a. Download and instal the Viber deb from their website
b. Download **but not install** the Ubuntu 21.10 libssl deb
  b.i. Extract relevant portions of this deb into /opt/viber/
c. Provide a wrapper script that sets the LD paths correctly to use the Ubuntu 21.10 libssl shared objects.  I couldn't get the .desktop file working when I tried to directly provide LD_PRELOAD and LD_LIBRARY_PATH in the Exec line of the .desktop file, so had to do this workaround instead
d. Provide a .desktop file that invokes the wrapper instead of the Viber provided binary
