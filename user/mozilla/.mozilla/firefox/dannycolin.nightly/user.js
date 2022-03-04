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

