// user.js
//
// This file overrides preferences in prefs.js

// Hide about:config warning
user_pref("browser.aboutConfig.showWarning", false);

// ???
user_pref("browser.discovery.enabled", false);

// Hide widgets about:newtab
user_pref("browser.newtabpage.activity-stream.default.sites", "");
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);

// Keep Firefox open when closing the last tab
user_pref("browser.tabs.closeWindowWithLastTab", false);

// Do not merge tabbar and titlebar
user_pref("browser.tabs.drawInTitlebar", false);

// Always hide bookmarks toolbar
user_pref("browser.toolbars.bookmarks.visibility", "never");

// Show bookmarks at the top in awesomebar
user_pref("browser.urlbar.showSearchSuggestionsFirst", false);

// Hide history and topsites in awesomebar
user_pref("browser.urlbar.suggest.history", false);
user_pref("browser.urlbar.suggest.topsites", false);

// Hide "search with" banner in awesomebar
user_pref("browser.urlbar.tabToSearch.onboard.interactionsLeft", 0);

// Enable calculator and unit conversions in awesomebar
user_pref("browser.urlbar.suggest.calculator", true);
user_pref("browser.urlbar.unitConversion.enabled", true);

// Disable middle mouse click pasting
user_pref("middlemouse.paste", false);

// Load userChrome.css
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// Disable cache in devtools
user_pref("devtools.cache.disabled", true);

// Enable Browser Toolbox
user_pref("devtools.chrome.enabled", true);
user_pref("devtools.debugger.remote-enabled", true);

// Enable  color-mix in devtools
user_pref("layout.css.color-mix.enabled", true);

// Fission
user_pref("fission.autostart", true);
user_pref("fission.sessionHistoryInParent", true);

// WebRender
user_pref("gfx.webrender.all", true);

// VA-API
//
// On Fedora, you need to install:
// - libva
// - libva-intel-driver
// - libva-vdpau-driver
// - libva-utils (optional)   Use `vainfo` to see if the drivers are properly
//                            working.
// - igt-gpu-tools            Use `sudo intel_gpu_top` while playing a video
//                            to see if it is hardware accelerated.
// - intel-gmmlib
// - intel-media-driver
// - mesa-vdpau
// - vdpauinfo
//
// You also need to install `h264ify` on addons.mozilla.org to force youtube
// to use h264 instead of VP8/VP9.
user_pref("media.ffmpeg.vaapi.enabled", true);

// Global Privacy Control
user_pref("privacy.globalprivacycontrol.enabled", true);
user_pref("privacy.globalprivacycontrol.functionality.enabled", true);

// OffCanvas2D
//
// Temporarily disable the half implemented new OffCanvas2D API in Firefox to
// fix the broken embedded images in Element Web
//
// - https://bugzilla.mozilla.org/show_bug.cgi?id=801176
// - https://github.com/matrix-org/matrix-react-sdk/pull/7440
user_pref("gfx.offscreencanvas.enabled", false);

// Use the refactored Screenshot tool
user_pref("screenshots.browser.component.enabled", true);

// Firefox View: Next
//
// https://bugzilla.mozilla.org/show_bug.cgi?id=1827393
user_oref("browser.tabs.firefox-view-next", true);
