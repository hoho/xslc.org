$.BEM.decl('b-stuff-item')
    .onMod('js',
        function($super, mod, val, prev) {
            if (val !== 'inited') { return; }

            var a = this.find('a'),
                inner = this.find('%b-stuff-item(inner)');
            a.click(function(e) { e.stopImmediatePropagation(); });
            inner
                .click(function() { window.location.href = a.attr('href'); })
                .mousedown(function() { inner.bemMod('pressed', 'yes'); })
                .on('mouseup mouseleave', function() { inner.bemMod('pressed', ''); });
        });
