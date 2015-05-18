'use strict';

/**
 * --------------------------------
 * 모듈
 * --------------------------------
 * Jade
 * https://www.npmjs.com/package/gulp-jade
 *
 * SSI(Server Side Includes)
 * https://www.npmjs.com/package/gulp-html-ssi
 * --------------------------------
 */
var gulp = require('gulp');







/**
 * --------------------------------
 * HELPERS
 * --------------------------------
 */
// 오류 출력을 위한 errorLog 함수
// 오류 발생 시에도 watch 업무 중단하지 않음.
// function errorLog(error) {
// 	console.error.bind(error);
// 	this.emit('end');
// }