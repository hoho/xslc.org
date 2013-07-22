$(function() {
    // Find blocks with JavaScript enabled and set js=inited modifier (so,
    // blocks could react to this modifier's change to initialize and
    // deinitialize themselves.
    $('.js').bemMod('js', 'inited');
});
