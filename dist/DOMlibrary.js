/*! domhelper-id.js */
function id(name) {
	return document.getElementById(name);
}
/*! domhelper-nextEl.js */
function nextEl(el) {
	if (!el.nextElementSibling) {
		el = el.nextElementSibling;
	} else {
		do { el = el.nextSibling; }
		while(el && el.nodeType != 1)
	}
	return el;
}
/*! domhelper-prevEl.js */
function prevEl(el) {
	if (!el.previousElementSibling) {
		el = el.previousElementSibling;
	} else {
		do { el = el.previousSibling; }
		while(el && el.nodeType != 1)
	}
	return el;
}
/*! domhelper-tag.js */
function tag(name, parentEl) {
	return (document || parentEl).getElementsByTagName(name);
}
/*! addEvent.js */
var addEvent = (function(){
	if(window.addEventListener) {
		return function(el, type, fn) {
			el.addEventListener(type, fn, false);
		}
	} else if(window.attachEvent) {
		return function(el, type, fn) {
			el.attachEvent('on'+type, fn);
		}
	} else {
		return function(el, type, fn) {
			el['on'+type] = fn;
		}
	}
})();
/*! removeEvent.js */
var removeEvent = (function(){
	if(window.removeEventListener) {
		return function(el, type, fn) {
			el.removeEventListener(type, fn, false);
		}
	} else if(window.detachEvent) {
		return function(el, type, fn) {
			el.detachEvent('on'+type, fn);
		}
	} else {
		return function(el, type, fn) {
			el['on'+type] = null;
		}
	}
})();