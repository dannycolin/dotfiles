// user.js
//
// This file overrides preferences in prefs.js

// Show/Hide about:config warning
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

// Disable tab preview
userpref("browser.tabs.hoverPreview.enabled", false);

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

// Hide weather
user_pref("browser.newtabpage.activity-stream.showWeather", false);

// ------------------------------
// Firefox Awesomebar
// ------------------------------

user_pref("browser.urlbar.showSearchSuggestionsFirst", false);

// Hide suggestions for the following elements
user_pref("browser.urlbar.suggest.history", false);
user_pref("browser.urlbar.suggest.topsites", false);
user_pref("browser.urlbar.suggest.searches", false);
user_pref("browser.urlbar.suggest.recentsearches", false);
user_pref("browser.urlbar.suggest.clipboard", false);

// Hide "search with" banner in awesomebar
user_pref("browser.urlbar.tabToSearch.onboard.interactionsLeft", 0);

// Enable calculator and unit conversion
user_pref("browser.urlbar.suggest.calculator", true);
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

// --------------------------------------------------------
// Firefox Sidebar Revamp Project
// --------------------------------------------------------
user_pref("sidebar.revamp", false);
user_pref("sidebar.verticalTabs", false);

// --------------------------------------------------------
// Reader Mode: Improved Text Menu
// https://blog.nightly.mozilla.org/2024/06/03/in-a-nutshell-these-weeks-in-firefox-issue-162/
// --------------------------------------------------------
user_pref("reader.improved_text_menu.enabled", true);

// --------------------------------------------------------
// ScotchBonnet button / This time search with menu in addressbar
// --------------------------------------------------------
user_pref("browser.urlbar.scotchBonnet.enableOverride", false);
