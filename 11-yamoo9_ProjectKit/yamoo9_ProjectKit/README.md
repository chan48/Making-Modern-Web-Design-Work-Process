### ★ yamoo9_ProjectKit ★

__모던 웹 디자인 워크플로우 개선__을 위한 __Front-End 개발 도구__입니다.<br>
[Node.js](http://nodejs.org)와 [Ruby](https://ruby-lang.org/ko)(선택) 환경이 요구되며, [Jade](http://jade-lang.com), [Sass](http://sass-lang.com), [CoffeeScript](http://coffeescript.org) 사용이 권장됩니다.<br>
사용법은 [야무](http://yamoo9.net/)의 저서 __'만들면서 배우는 모던 웹 사이트 제작'__을 통해 공부하실 수 있습니다.

-
####☆ yamoo9_ProjectKit 기능 요약

1. __사용자 정의 환경 설정__<br>
	⇒ `config.coffee` 파일을 열어 항목별 설정을 사용자 입맛에 맞게 변경할 수 있습니다.

2. __실시간 웹 서버 테스트 환경__<br>
	⇒ 웹 서버(Server) 설정(`Root`, `Port`, `LiveReload`, `Open Browser`)<br>
	⇒ `jade`, `sass`, `coffeeScript`, `HTML`, `CSS`, `JS` 변경 내용 실시간 반영([LiveReload](https://github.com/livereload/livereload-js))

3. __【[Bower](http://bower.io)】 웹 개발 패키지 관리__<br>
	⇒ 웹 개발 패키지 매니저 `Bower`을 사용해 프레임워크, 라이브러리 등을 관리합니다.

4. __【[Jade](http://jade-lang.com)】 HTML 템플릿 엔진 (Template Engine)__<br>
	⇒ 지속적으로 파일을 관찰(`Watch`)하여 `Jade → HTML`로 변경합니다.

5. __【[Sass](http://sass-lang.com)】 CSS 프리프로세싱 (Preprocessing)__<br>
	⇒ 지속적으로 파일을 관찰하여 `Sass → CSS`로 변경합니다.

6. __【[CoffeeScript](http://coffeescript.org)】 JS 컴파일러 (Compiler)__<br>
	⇒ 지속적으로 파일을 관찰하여 `CoffeeScript → JS`로 변경합니다.

7. __이미지 최적화__<br>
	⇒ `GIF`,`JPG`,`PNG`,`SVG` 파일 크기를 옵션에 맞춰 최적화합니다.

8. __CSS 스프라이트 이미지/스타일 파일 자동 생성(`PNG`, `SVG` 기반)__<br>
	⇒ `sprites.png`, `sprites.svg`,`sprites.css` 파일을 자동으로 생성합니다.

9. __CSS__ 문법검사/병합/압축<br>
	⇒ `src/__www__/css` 폴더 내부 CSS 파일을 문법검사 후에 병합, 정렬, 압축합니다.

10. __JS__ 문법검사/병합/압축<br>
	⇒ `src/__www__/css` 폴더 내부 JS 파일을 문법검사 후에 병합, 압축합니다.

11. __개발(Develop) & 빌드(Build)__<br>
	⇒ 배포(`Publish`)를 위한 프로젝트 최적화 파일을 빌드(`Build`)합니다.

=
####[Node.js](http://nodejs.org) & [NPM](http://npmjs.com), [Ruby](https://ruby-lang.org/ko) 환경에서 작동하는 yamoo9_ProjectKit
Node.js와 Ruby 환경에서 작동하는 yamoo9_ProjectKit은 컴퓨터에 Node.js, Ruby가 설치되어 있어야 사용할 수 있습니다. (컴퓨터 운영체제가 윈도우즈(Windows)라면 Ruby를 설치해야 합니다. 반면 맥(OSX)을 사용 중이라면 Ruby를 설치하지 않아도 됩니다) Node.js, Ruby 설치 파일은 아래 링크에서 제공됩니다.

* [Node.js](http://nodejs.org/download/)
* [Ruby](http://rubyinstaller.org/downloads/) ([Sass](http://sass-lang.com 'Ruby 환경에서 사용하는 Sass') or [Compass](http://compass-style.org 'Sass 프레임워크')를 사용할 경우 설치)

=
#### yamoo9_ProjectKit 시작하기

###### Node.js & Ruby 설치 확인
```sh
$ node --version # Node.js 설치 및 버전 확인
$ ruby -v        # Ruby 설치 및 버전 확인
$ npm -v         # NPM 버전 확인
$ gem -v         # Gem 버전 확인
```
![Node.js & Ruby 버전 확인](./gif_images/node_ruby_confirm.gif?raw=true)

###### [Gulp.js](http://gulpjs.com) 전역(Global) 설치
```sh
$ npm install --global gulp # npm i -g gulp
```
![Gulp.js 전역 설치](./gif_images/npm_gulp.gif?raw=true)

###### [Bower](http://bower.io) 전역 설치
```sh
$ npm install --global bower # npm i -g bower
```
![Bower 전역 설치](./gif_images/npm_bower.gif?raw=true)

###### 프로젝트 의존 모듈 설치 (NPM, Bower)
```sh
$ npm install   # npm i
$ bower install # bower i
```
![NPM & Bower 로컬 설치](./gif_images/npm_bower_install.gif?raw=true)

###### Sass 모듈 설치 (Ruby 환경 Sass를 사용할 경우)
```sh
$ gem install sass    # Ruby Sass 설치
$ gem install compass # Compass를 사용하고자 할 경우에만 설치
```
![Sass 설치](./gif_images/gem_sass.gif?raw=true)

###### Gulp 업무(Tasks) 준비 및 유형별 실행
```sh
$ gulp settings # Bower 컴포넌트 다운로드 등 개발을 위한 초기 설정
$ gulp          # 프로젝트에 Jade, Sass, Coffee를 사용할 경우
$ gulp www      # 프로젝트에 HTML, CSS, JS를 사용할 경우
```

=
#### Gulp 업무 목록(Tasks List)
###### 초기 설정(Initialisation Settings)<br>
```sh
$ gulp settings # Bower 컴포넌트 다운로드, 개발을 위한 설정
```
![gulp settings demo](./gif_images/gulp-settings.gif?raw=true)

###### 기본(default) & 웹(www)<br>
```sh
$ gulp          # 프로젝트에 Jade, Sass, Coffee를 사용할 경우
$ gulp www      # 프로젝트에 HTML, CSS, JS를 사용할 경우
```
![gulp demo](./gif_images/gulp.gif?raw=true)

###### 제거(clean)
```sh
$ gulp clean          # 생성된 개발,빌드,캐시 폴더 모두 제거
$ gulp clean:cache    # .sass-cache 개별 제거
$ gulp clean:develop  # config.dev 개발 폴더 개별 제거
$ gulp clean:all      # 개발,빌드,캐시,bower_component 모두 제거
$ gulp clean:reset    # 프로젝트 폴더 초기화(node_modules 포함 모두 제거)
```
![gulp clean demo](./gif_images/gulp-clean.gif?raw=true)

###### 관찰(watch)
```sh
$ gulp watch        # Jade,Sass,Coffee,HTML,CSS,JS 모두 관찰
$ gulp watch:jade   # Jade → HTML 변경 내용 관찰
$ gulp watch:sass   # Sass → CSS 변경 내용 관찰
$ gulp watch:coffee # CoffeeScript → JS 변경 내용 관찰
$ gulp watch:images # 이미지 변경 내용 관찰
$ gulp watch:html   # HTML 변경 내용 관찰
$ gulp watch:css    # CSS 변경 내용 관찰
$ gulp watch:js     # JS 변경 내용 관찰
```
![gulp watch demo](./gif_images/gulp-watch.gif?raw=true)

###### 빌드(build)
```sh
$ gulp build         # 통합
$ gulp build:jade    # Jade 개별 빌드
$ gulp build:sass    # Sass 개별 빌드
$ gulp build:coffee  # CoffeeScript 개별 빌드
$ gulp build:images  # 이미지 압축/스프라이트 개별 빌드
$ gulp build:css     # CSS 개별 빌드
$ gulp build:js      # JS 개별 빌드
```
![gulp build demo](./gif_images/gulp-build.gif?raw=true)

###### 웹 서버(connect)
```sh
$ gulp connect # 웹 서버 환경 설정 후, 브라우저 오픈
```
![웹 서버 테스트 실행](./gif_images/gulp_connect.gif?raw=true)

###### Jade 템플릿 엔진 `Jade → HTML`
```sh
$ gulp jade
```
![Jade 컴파일 실행](./gif_images/gulp_jade.gif?raw=true)

###### Sass 프리프로세싱 `Sass → CSS`
`sass=node` 또는 `sass=ruby` 명령어로 Sass 엔진을 선택할 수 있습니다.
엔진 기본 값을 변경하려면 `config.coffee` 파일을 열어 `SASSENGINE` 설정 값(초기값: `ruby`)을 변경합니다.
```sh
$ gulp sass
$ sass=node gulp sass  # LibSass(NodeSass) 활용 예
```
![Sass 컴파일 실행](./gif_images/gulp_sass.gif?raw=true)

###### CoffeeScript 컴파일 `CoffeeScript → Javascript`
```sh
$ gulp coffee
```
![CoffeeScript 컴파일 실행](./gif_images/gulp_coffee.gif?raw=true)

###### 이미지 최적화 / SVG → PNG 자동 변환
```sh
$ gulp images          # 통합
$ gulp images:svg2png  # SVG → PNG 변환 ($ gulp svg2png 명령도 가능)
$ gulp images:opt      # 최적화
```
![이미지 최적화 실행](./gif_images/gulp-images-opt.gif?raw=true)

![SVG → PNG 변환 실행](./gif_images/gulp-images-svg2png.gif?raw=true)

###### 스프라이트 이미지/CSS 스타일 자동 생성 (`PNG`, `SVG`)
```sh
$ gulp sprites         # 통합 (sprites:svg-win 또는 sprites:svg 중 선택)
$ gulp sprites:png     # PNG 스프라이트 생성
$ gulp sprites:svg-win # Windows 환경: SVG 스프라이트 생성(Fallback: SVG → PNG 변환 포함)
$ gulp sprites:svg     # OSX 환경: SVG 스프라이트 생성(Fallback: SVG → PNG 변환 포함)
```
![PNG 스프라이트 이미지 자동 생성](./gif_images/gulp-sprites-png.gif?raw=true)

![SVG 스프라이트 이미지 자동 생성](./gif_images/gulp-sprites-svg-win.gif?raw=true)

###### HTML 업무
```sh
$ gulp html # 이동, 압축
```
###### CSS 업무
```sh
$ gulp css        # 통합
$ gulp css:lint   # 문법 검사
$ gulp css:move   # 이동
$ gulp css:concat # 병합
```
###### JS 업무
```sh
$ gulp js        # 통합
$ gulp js:hint   # 문법 검사
$ gulp js:move   # 이동
$ gulp js:concat # 병합
```

=
#### 프로젝트 의존 모듈 목록
- ###### ━ 유틸리티(Utillities)
	- [require-dir](https://www.npmjs.com/package/require-dir)<br>
		require() 폴더 호출 도우미
	- [del](https://www.npmjs.com/package/del)<br>
		폴더/파일 제거
	- [run-sequence](https://www.npmjs.com/package/run-sequence)<br>
		정해진 순서에 따라 업무 실행
	- [coffee-script](https://www.npmjs.com/package/coffee-script)<br>
		커피스크립트 모듈 - `config.coffee`, coffee 확장자 파일 처리
	- [pretty-hrtime](https://www.npmjs.com/package/pretty-hrtime)<br>
		process.hrtime() 값을 단어로 변경
	- [gulp-util](https://www.npmjs.com/package/gulp-util)<br>
		Gulp 플러그인 유틸
	- [gulp-if](https://www.npmjs.com/package/gulp-if)<br>
		조건에 따른 업무 처리
	- [gulp-rename](https://www.npmjs.com/package/gulp-rename)<br>
		파일 이름변경
	- [gulp-watch](https://www.npmjs.com/package/gulp-watch)<br>
		변경 파일만 지속적 관찰 업무 처리
	- [gulp-plumber](https://www.npmjs.com/package/gulp-plumber)<br>
		관찰(Watch) 업무 중, 오류가 발생해도 관찰 업무를 지속
	- [gulp-sourcemaps](https://www.npmjs.com/package/gulp-sourcemaps)<br>
		개발용 소스맵(Sourcemap) 생성
	- [gulp-load-plugins](https://www.npmjs.com/package/gulp-load-plugins)<br>
		package.json 파일을 읽어 플러그인 호출
	- [gulp-size](https://www.npmjs.com/package/gulp-size)<br>
		업무 처리 결과 파일 크기를 출력
	- [gulp-notify](https://www.npmjs.com/package/gulp-notify)<br>
		알림(Notification) Gulp 플러그인
	- [gulp-filter](https://www.npmjs.com/package/gulp-filter)<br>
		파일 확장자로 필터링(Filtering)
	- [gulp-changed](https://www.npmjs.com/package/gulp-changed)<br>
		변경된 파일만 처리


- ###### ━ 웹 서버 테스트 환경(Web Server Testing)
	- [gulp-connect-multi](https://www.npmjs.com/package/gulp-connect-multi)<br>
		웹 서버(Web Server + Live Reload + Openning Browser)


- ###### ━ 프리프로세싱(Preprocessing) & 컴파일(Compile)
	- [gulp-jade](https://www.npmjs.com/package/gulp-jade)<br>
		Jade 컴파일러
	- [gulp-sass](https://www.npmjs.com/package/gulp-sass)<br>
		Sass 컴파일러 ([LibSass](http://libsass.org/) 의존)
	- [gulp-ruby-sass](https://www.npmjs.com/package/gulp-ruby-sass)<br>
		Sass 컴파일러 (Ruby 환경)
	- [gulp-coffee](https://www.npmjs.com/package/gulp-coffee)<br>
		Coffeescript 컴파일러


- ###### ━ 포멧 정리(Format Prettify)
	- [gulp-jsprettify](https://www.npmjs.com/package/gulp-jsbeautifier)<br>
		HTML, CSS, JS 통합 처리
	- [gulp-html-prettify](https://www.npmjs.com/package/gulp-html-prettify)<br>
		HTML 문서 구조를 읽기 좋게 정리
	- [gulp-csscomb](https://www.npmjs.com/package/gulp-csscomb)<br>
		CSS 문서 포멧 정리 및 속성 별로 정렬
	- [gulp-js-prettify](https://www.npmjs.com/package/gulp-js-prettify)<br>
		JS 문서 구조를 읽기 좋게 정리


- ###### ━ 문법 검사(Validation Syntax)
	- [gulp-html](https://www.npmjs.com/package/gulp-html)<br>
		HTML 유효성 검사
	- [gulp-csslint](https://www.npmjs.com/package/gulp-csslint)<br>
		CSS 문법 검사
	- [gulp-jshint](https://www.npmjs.com/package/gulp-jshint)<br>
		JS 문법 검사
	- [jshint-stylish](https://www.npmjs.com/package/jshint-stylish)<br>
		jshint 오류 메시지 보기 좋게 변경
	- [gulp-coffeelint](https://www.npmjs.com/package/gulp-coffeelint)<br>
		CoffeeScript 문법 검사



- ###### ━ CSS 브라우저 벤더 프리픽스(Browser Vendor Prefix)
	- [gulp-autoprefixer](https://www.npmjs.com/package/gulp-autoprefixer)<br>
		CSS3 브라우저 제조사의 접두사 자동 추가


- ###### ━ 병합(Concatenation)
	- [gulp-concat](https://www.npmjs.com/package/gulp-concat)<br>
		Javascript 파일 병합
	- [gulp-combine-mq](https://www.npmjs.com/package/gulp-combine-mq)<br>
		CSS3 미디어쿼리(MediaQueries) 병합


- ###### ━ 압축(Compress)
	- [gulp-htmlmin](https://www.npmjs.com/package/gulp-htmlmin)<br>
		HTML 파일 압축
	- [gulp-csso](https://www.npmjs.com/package/gulp-csso)<br>
		CSS 파일 압축
	- [gulp-uglify](https://www.npmjs.com/package/gulp-uglify)<br>
		Javascript 파일 압축


- ###### ━ 이미지 최적화(Optimization), `SVG → PNG` 변환
	- [gulp-imagemin](https://www.npmjs.com/package/gulp-imagemin)<br>
		이미지 포멧(`GIF`, `JPG`, `PNG`, `SVG`) 최적화
	- [imagemin-pngquant](https://www.npmjs.com/package/imagemin-pngquant)<br>
		pngquant imagemin모듈 플러그인
	- [gulp-svg2png](https://www.npmjs.com/package/gulp-svg2png)<br>
		`SVG` 파일을 자동으로 `PNG`로 변환


- ###### ━ 스프라이트(Sprites)
	- [gulp.spritesmith](https://www.npmjs.com/package/gulp.spritesmith)<br>
		스프라이트 이미지 생성 (`PNG` 기반)
	- [gulp-svg-sprites](https://www.npmjs.com/package/gulp-svg-sprites)<br>
		`SVG` 스프라이트 이미지 생성 (Windows 환경에서 사용하려면 [절차](https://github.com/TooTallNate/node-gyp#installation)가 복잡)
	- [gulp-svg-sprite](https://www.npmjs.com/package/gulp-svg-sprite)<br>
		`SVG` 스프라이트 이미지 생성 (Windows 환경에서 활용이 간편)

-
Copyright © 2015 yamoo9 <yamoo9@naver.com> / [@yamoo9](https://facebook.com/yamoo9) / [yamoo9.net](http://yamoo9.net/)