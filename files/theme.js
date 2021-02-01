/**
 * This file is loaded (blocking) right before the closing "head" tag.
 */

// Set the default theme. See frontend/src/mixin.js for possible values.
setTheme('Darkly');

// Add other code below this line - e.g. for user tracking

var _paq = window._paq = window._paq || [];
_paq.push(['trackPageView']);
_paq.push(['enableLinkTracking']);
(function() {
    var u="//hello.tian-space.net/";
    _paq.push(['setTrackerUrl', u+'helloP']);
    _paq.push(['setSiteId', '2']);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.src=u+'helloJ'; s.parentNode.insertBefore(g,s);
})();
