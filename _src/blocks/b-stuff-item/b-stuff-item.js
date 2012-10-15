$.BEM.decl('b-stuff-item')
    .onMod('js',
        function($super, mod, val, prev) {
            if (val === 'inited') {
                var a = this.find('a');
                a.click(function(e) { e.stopImmediatePropagation(); });
                this.click(function() { window.location.href = a.attr('href'); });
            }
        });
