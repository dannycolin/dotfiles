// -----------------------------------------------------------------------------
// user.js
//
// This file overrides preferences in prefs.js
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// General settings
// -----------------------------------------------------------------------------

user_pref("browser.aboutConfig.showWarning", false);

user_pref("browser.discovery.enabled", false);

// Remove widgets on the newtab page
user_pref("browser.newtabpage.activity-stream.default.sites", "");
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);

user_pref("browser.tabs.closeWindowWithLastTab", false);
user_pref("browser.tabs.drawInTitlebar", false);

user_pref("browser.toolbars.bookmarks.visibility", "never");

// Enable compact mode
//
// browser.uidensity
//
//  0 - default
//  1 - compact (deprecated with bug 1693028)
//  2 - touch
user_pref("browser.compactmode.show", true);
user_pref("browser.uidensity", 1);

// Show bookmarks first
user_pref("browser.urlbar.showSearchSuggestionsFirst", false);

// Don't show history or topsites
user_pref("browser.urlbar.suggest.history", false);
user_pref("browser.urlbar.suggest.topsites", false);

// Disable the larger "search with" banner
user_pref("browser.urlbar.tabToSearch.onboard.interactionsLeft", 0);

// Enable arthimetic expressions and unit conversions
user_pref("browser.urlbar.suggest.calculator", true);
user_pref("browser.urlbar.unitConversion.enabled", true);

// Disable middle mouse click paste
user_pref("middlemouse.paste", false);

// Load userChrome.css
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// DoH
user_pref("network.trr.mode", 3);
//user_pref("network.trr.uri", "https://doh.mullvad.net/dns-query");

// -----------------------------------------------------------------------------
// Devtools
// -----------------------------------------------------------------------------
user_pref("devtools.cache.disabled", true);
user_pref("devtools.chrome.enabled", true);
user_pref("devtools.debugger.remote-enabled", true);

// -----------------------------------------------------------------------------
// Nightly Settings
// -----------------------------------------------------------------------------

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
// See:
// - https://bugzilla.mozilla.org/show_bug.cgi?id=801176
// - https://github.com/matrix-org/matrix-react-sdk/pull/7440
user_pref("gfx.offscreencanvas.enabled", false);

