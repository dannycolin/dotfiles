### Firefox

To install Firefox Stable, Beta, Delevoper or Nightly on your Debian Stable :

 1. Download the Firefox directly from the official website.
 
 2. Uncompress the archives in the `/opt` folder (system-wide) or in the  home folder (current user only).
 3. Create a .desktop file named `firefox-[version name].desktop` in `/usr/share/applications` (system-wide)or in `.local/share/applications` (current user only). 

**Creating a .desktop file for firefox**

Here is an example of a .desktop file :


    [Desktop Entry]
    Name=Firefox ''Your version''
    Comment=Web Browser
    GenericName=Web Browser
    X-GNOME-FullName=Firefox ''Your version'' Web Browser
    Exec=/path/to/firefox/firefox %u
    Terminal=false
    X-MultipleArgs=false
    Type=Application
    Icon=/path/to/firefox/icon
    Categories=Network;WebBrowser;
    MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
    StartupWMClass=Firefox
    StartupNotify=true

#### Flash Player

 1. Download the latest Adobe Flash Player for Linux from https://get.adobe.com/flashplayer/

    On 64bit systems, it should be: flash_player_npapi_linux.x86_64.tar.gz

    Alternatively, you can download it from: https://get.adobe.com/flashplayer/otherversions/

 2. Unpack the tar.gz file.

    `tar -xzf flash_player_npapi_linux*.tar.gz`

 3. Identify the location of the browser plugins directory, based on your Linux distribution and Firefox version:

    `Debian 9 Stretch (64-Bit): /usr/lib/mozilla/plugins/`

 4. Copy libflashplayer.so to the appropriate browser plugins directory: sudo cp libflashplayer.so <browserpluginlocation>

    `[sudo] cp libflashplayer.so /usr/lib/mozilla/plugins/`

 5. Copy the Flash Player Local Settings configurations files to the /usr directory. 

    `[sudo] cp -r usr/* /usr`

