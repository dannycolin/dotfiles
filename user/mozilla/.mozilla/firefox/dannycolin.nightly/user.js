// -----------------------------------------------------------------------------
// user.js
//
// This file overrides preferences in prefs.js
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// General settings
// -----------------------------------------------------------------------------

user_pref("browser.aboutConfig.showWarning", false);
user_pref("browser.tabs.closeWindowWithLastTab", false);

user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);

// Compact theme
user_pref("extensions.activeThemeID", "firefox-compact-dark@mozilla.org");
user_pref("browser.uidensity", 1);

// List of website pinning in Top Sites
user_pref("browser.newtabpage.activity-stream.default.sites", "");

// Devtools
user_pref("devtools.cache.disabled", true);
user_pref("devtools.chrome.enabled", true);
user_pref("devtools.debugger.remote-enabled", true);
user_pref("devtools.theme", "dark");

// Load userChrome.css
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// -----------------------------------------------------------------------------
// Nightly Settings
// -----------------------------------------------------------------------------

// Fission
user_pref("fission.autostart", true);
user_pref("fission.sessionHistoryInParent", true);

// WebRender
user_pref("gfx.webrender.all", true);

// Proton redesign
user_pref("browser.proton.enabled", true);
user_pref("browser.proton.tabs.enabled", true);
user_pref("browser.proton.appmenu.enabled", true);
user_pref("browser.proton.toolbar.enabled", true);

