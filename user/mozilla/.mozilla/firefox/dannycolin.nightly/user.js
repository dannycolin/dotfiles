// user.js
//
// This file overrides preferences in prefs.js

// Hide about:config warning
user_pref("browser.aboutConfig.showWarning", false);

// Load userChrome.css
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// ------------------------------
// General
// ------------------------------

// ???
user_pref("browser.discovery.enabled", false);

// Keep Firefox open when closing the last tab
user_pref("browser.tabs.closeWindowWithLastTab", false);

// Do not merge tabbar and titlebar
user_pref("browser.tabs.drawInTitlebar", false);

// Always hide bookmarks toolbar
user_pref("browser.toolbars.bookmarks.visibility", "never");

// Disable middle mouse click pasting
user_pref("middlemouse.paste", false);

// ------------------------------
// about:newtab
// ------------------------------

// Hide topsites
user_pref("browser.newtabpage.activity-stream.default.sites", "");

// Hide tips
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);

// Hide addons suggestions
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);

// ------------------------------
// Firefox Awesomebar
// ------------------------------
user_pref("browser.urlbar.showSearchSuggestionsFirst", false);
// Hide history
user_pref("browser.urlbar.suggest.history", false);
// Hide topsites
user_pref("browser.urlbar.suggest.topsites", false);
// Do not suggest searching for the current URL in clipboard
user_pref("browser.urlbar.suggest.clipboard", false);
// Hide "search with" banner in awesomebar
user_pref("browser.urlbar.tabToSearch.onboard.interactionsLeft", 0);
// Enable calculator
user_pref("browser.urlbar.suggest.calculator", true);
// Enable unit conversions
user_pref("browser.urlbar.unitConversion.enabled", true);

// --------------------------------------------------------
// Devtools
// --------------------------------------------------------

// Disable cache in devtools
user_pref("devtools.cache.disabled", true);

// Enable Browser Toolbox
user_pref("devtools.chrome.enabled", true);
user_pref("devtools.debugger.remote-enabled", true);

// Enable color-mix in devtools
user_pref("layout.css.color-mix.enabled", true);

// --------------------------------------------------------
// Fission
// --------------------------------------------------------
user_pref("fission.autostart", true);
user_pref("fission.sessionHistoryInParent", true);

// --------------------------------------------------------
// WebRender
// --------------------------------------------------------
user_pref("gfx.webrender.all", true);

// --------------------------------------------------------
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
// --------------------------------------------------------
user_pref("media.ffmpeg.vaapi.enabled", true);

// --------------------------------------------------------
// Global Privacy Control
// --------------------------------------------------------
user_pref("privacy.globalprivacycontrol.enabled", true);
user_pref("privacy.globalprivacycontrol.functionality.enabled", true);

// --------------------------------------------------------
// OffCanvas2D
//
// Temporarily disable the half implemented new OffCanvas2D API in Firefox to
// fix the broken embedded images in Element Web
//
// - https://bugzilla.mozilla.org/show_bug.cgi?id=801176
// - https://github.com/matrix-org/matrix-react-sdk/pull/7440
// --------------------------------------------------------
user_pref("gfx.offscreencanvas.enabled", false);

// --------------------------------------------------------
// Screenshot: Builtin instead of extension
// https://bugzilla.mozilla.org/show_bug.cgi?id=1789727
//
// Status: Enabled by default since 2024-03-05
// --------------------------------------------------------
user_pref("screenshots.browser.component.enabled", true);

// --------------------------------------------------------
// Firefox View: Next
// https://bugzilla.mozilla.org/show_bug.cgi?id=1827393
// --------------------------------------------------------
user_oref("browser.tabs.firefox-view-next", true);

// --------------------------------------------------------
// Firefox Profile Manager 2024
// --------------------------------------------------------
user_pref("browser.profiles.enabled", true);

// --------------------------------------------------------
// Firefox Translations: Translate selected text only
// --------------------------------------------------------
user_pref("browser.translations.select.enable", true);
