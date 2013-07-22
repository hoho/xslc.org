

/* Begin of ../_src/blocks/i-jquery/i-jquery__bem.js. */
/*!
 * jQuery BEM v0.2.0, https://github.com/hoho/jquery-bem
 * Copyright 2012-2013 Marat Abdullin
 * Released under the MIT license
 */(function(e,t){var n="(?:b\\-|l\\-)",r="__",i="_",s="[\\x20\\t\\r\\n\\f]",o="(?:[a-zA-Z0-9-]|[^\\x00-\\xa0])+",u="([*^$|!]?=)",a="\\{"+s+"*("+o+")"+s+"*(?:"+u+s+"*("+o+"))?"+s+"*\\}",f="undefined",l="object",c="m",h="c",p="b",d=RegExp,v=new d(s,"g"),m="prototype",g=Array[m].slice,y=e.fn,b="",w=",",E,S=e.expr.match,x=e.expr.filter,T={},N=function(e){return typeof e===l},C=function(e,t,n){this._k=e,this._c=e+(t?i+t+(n?i+n:b):b)},k=function(e,t,n,s){this._b=e,this._k=e._k+r+t,this._c=e._k+r+t+(n?i+n+(s?i+s:b):b)},L=function(e,t){return(t=e&&e.className)?N(t)?t.baseVal:t||typeof e.getAttribute!==f&&e.getAttribute("class")||b:b},A=function(e,t,u){return new d("(?:^|"+s+")("+(e||n+o)+")(?:"+r+"("+(t||o)+"))?(?:"+i+"("+(u||o)+")(?:"+i+"("+o+"))?)?(?:"+s+"|$)","g")},O=function(e,t,n,r,i){(r=T[this._k])||(T[this._k]=r=[]);if(N(t))for(i in t)r.push([e+w+i+w+this._c,t[i]]);else r.push([e+w+t+w+this._c,n])},M=function(e,t,n){return n=t.length-1,function r(){if(n>=0){var i=g.call(arguments);return i.unshift(r),t[n--].apply(e,i)}}},_=function(e,t,n,i,s,o,u){return o={},e.replace(v,"  ").replace(A(t,n,i),function(e,i,u,a,f){!t&&!n&&s&&(t=i,n=u),e=i+(u?r+u:b),o[e]||(o[e]=[]),a&&o[e].push({mod:a,val:f||!0})}),t&&(t+=n?r+n:b,o[t]?(u={},u[t]=o[t],o=u):o={}),o},D=function(e,t,n,r){var s={},o,u,a,f=[];s[a=e+w+t+w+n]=!0,a+=i;for(o=0;o<r.length;o++)s[u=a+r[o].mod]=!0,s[u+i+r[o].val]=!0;r=T[n];if(r)for(o=0;o<r.length;o++)u=r[o],u[0]in s&&f.push(u[1]);return f};S.BLOCK=new d("^%("+n+o+"|\\*)"),S.ELEM=new d("^%("+n+o+"|\\*)\\("+s+"*("+o+"|\\*)"+s+"*\\)"),S.MOD=new d("^"+a),x.ELEM=function(e,t){e==="*"&&(e=n+o),t==="*"&&(t=o);var i=new d("(?:^|"+s+"+)"+e+r+t+"(?:"+s+"+|$)");return function(e){return i.test(L(e))}},x.BLOCK=function(e){e==="*"&&(e=n+o);var t=new d("(?:^|"+s+"+)"+e+"(?:"+s+"+|$)");return function(e){return t.test(L(e))}},x.MOD=function(e,t,u){var a=new d("(?:^|"+s+"+)"+n+o+"(?:"+r+o+")?"+i+e+"(?:"+i+"("+o+"))?(?:"+s+"+|$)");return function(e){var n=L(e).match(a),r;return n?(r=n[1]||b,t==="="?r===u:t==="!="?r!==u:t==="^="?u&&r.indexOf(u)===0:t==="*="?u&&r.indexOf(u)>-1:t==="$="?u&&r.substr(r.length-u.length)===u:t==="|="?r===u||r.substr(0,u.length+1)===u+"-":!u):!1}},C[m]=E={onBuild:function(e){return O.call(this,p,p,e),this},onMod:function(e,t){return O.call(this,c,e,t),this},onCall:function(e,t){return O.call(this,h,e,t),this},elem:function(e,t,n){return new k(this,e,t,n)}},k[m]={onMod:E.onMod,onCall:E.onCall,end:function(){return this._b}},e.BEM={decl:function(e,t,n){return new C(e,t,n)},build:function(e,t){var n=g.call(arguments,2),r;return N(t)&&(r=t.mods,t=t.block),M(e,D(p,p,t,r||[])).apply(this,n)}},y.bemCall=function(e){var n,r,i,s,o,u;if(N(e)){if(n=e.block)r=e.elem;e=e.call}if(!e)return;e+=b,i=g.call(arguments,1),s=this.eq(0),o=_(L(s[0]),n,r,t,!0);for(u in o)return M(s,D(h,e,u,o[u])).apply(this,i)},y.bemMod=function(n,r){var s,o,u,a;if(N(n)){if(s=n.block)o=n.elem;n=n.mod}if(!n){e.error("No modifier");return}if(r===t){u=_(L(this[0]),s,o,n,!0);for(a in u)return u=u[a][0],u?u.val||!0:t;return t}return typeof r=="boolean"&&(r=r?!0:b),this.each(function(){var u=_(L(this),s,o),f,l,h,p,d=e(this);for(a in u){h=u[a],p=t;for(l=0;l<h.length;l++)h[l].mod===n&&(p=h[l].val);if(!p&&!r||p===r)return;f=D(c,n,a,h),l=a+i+n,p&&d.removeClass(l+(p===!0?b:i+p)),r&&d.addClass(l+(r===!0?b:i+r)),M(d,f)(n,r?r:t,p)}}),this}})($);
/* End of ../_src/blocks/i-jquery/i-jquery__bem.js. */


/* Begin of ../_src/blocks/i-common/i-common.js. */
$(function() {
    // Find blocks with JavaScript enabled and set js=inited modifier (so,
    // blocks could react to this modifier's change to initialize and
    // deinitialize themselves.
    $('.js').bemMod('js', 'inited');
});

/* End of ../_src/blocks/i-common/i-common.js. */


/* Begin of ../_src/blocks/b-stuff-item/b-stuff-item.js. */
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

/* End of ../_src/blocks/b-stuff-item/b-stuff-item.js. */


/* Begin of ../_src/blocks/b-comments/b-comments.js. */
$.BEM.decl('b-comments')
    .onMod('js',
        function($super, mod, val, prev) {
            if (val !== 'inited') { return; }

            var dsq = document.createElement('script');
            dsq.type = 'text/javascript';
            dsq.async = true;
            dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        });

/* End of ../_src/blocks/b-comments/b-comments.js. */

