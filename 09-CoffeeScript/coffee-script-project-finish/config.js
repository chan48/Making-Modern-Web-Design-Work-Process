'use strict';
module.exports = function() {

	var source = 'src/',
		development = 'dist/',

		// 제거 폴더 설정: gulp clean
		remove = ['.tmp', '.sass-cache', 'dist'],

		// Jade 템플릿 설정
		jade = {
			src  : source + 'jade/**/!(_)*.jade',
			parts: source + 'jade/**/_*.jade'
		},

		// Sass 설정
		sass = {
			src        : source + 'sass/**/*.{scss,sass}',
			compassSrc : source + '/sass',
			dest       : development + 'css/'
		},

		// CoffeeScript 설정
		coffee = {
			src : source + 'coffee/**/*.coffee',
			dest: development + 'js/'
		},

		// HTML Prettify 옵션
		HTML_PRETTIFY = {
			'indent_char': ' ',
			'indent_size': 2
		},

		// Sass 옵션
		SASS_OPTION = {
			css: sass.dest,
			sass: sass.compassSrc,
			sourcemap: true,
			style: 'expanded' // nested, expaned, compact, compressed
		},

		// Autoprefixer 브라우저 옵션
		AUTOPREFIXER = [
			'ie >= 9',
			'ie_mob >= 10',
			'ff >= 30',
			'chrome >= 34',
			'safari >= 7',
			'opera >= 23',
			'ios >= 7',
			'android >= 4.4',
			'bb >= 10'
		],

		// 웹 서버 설정
		server = {
			root: [development],
			port: 8080,
			livereload: true,
			open: {
				browser: 'chrome' // chrome(안되면 Google Chrome), iexplore, ...
			}
		};

	return {
		del    : remove,
		src    : source,
		dev    : development,

		jade   : jade,
		sass   : sass,
		coffee : coffee,

		SERVER        : server,
		HTML_PRETTIFY : HTML_PRETTIFY,
		SASS_OPTION   : SASS_OPTION,
		AUTOPREFIXER  : AUTOPREFIXER
	};
};