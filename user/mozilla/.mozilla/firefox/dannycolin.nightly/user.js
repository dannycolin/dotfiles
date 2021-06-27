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

user_pref("browser.newtabpage.activity-stream.default.sites", "");
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);

user_pref("browser.tabs.closeWindowWithLastTab", false);
user_pref("browser.tabs.drawInTitlebar", false);

user_pref("browser.toolbars.bookmarks.visibility", "never");

// browser.uidensity
//
//  0 - default
//  1 - compact (deprecated with bug 1693028)
//  2 - touch
user_pref("browser.uidensity", 1);

user_pref("browser.urlbar.showSearchSuggestionsFirst", false);
user_pref("browser.urlbar.suggest.history", false);
user_pref("browser.urlbar.suggest.topsites", false);

user_pref("extensions.activeThemeID", "firefox-compact-dark@mozilla.org");

// Load userChrome.css
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// Disable middle mouse click paste
user_pref("middlemouse.paste", false);

// -----------------------------------------------------------------------------
// Devtools
// -----------------------------------------------------------------------------
user_pref("devtools.cache.disabled", true);
user_pref("devtools.chrome.enabled", true);
user_pref("devtools.debugger.remote-enabled", true);
user_pref("devtools.theme", "dark");

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
user_pref("browser.proton.contextmenus.enabled", true);
user_pref("browser.proton.doorhangers.enabled", true);
user_pref("browser.proton.infobars.enabled", true);
user_pref("browser.proton.modals.enabled", true);
user_pref("browser.proton.places-tooltip.enabled", true);
user_pref("browser.proton.tabs.enabled", true);
user_pref("browser.proton.toolbar.enabled", true);
user_pref("browser.proton.urlbar.enabled", true);
user_pref("browser.aboutwelcome.design", "proton");

