'use strict';
/**
 * --------------------------------
 * 모듈 정의
 * Define Module
 * --------------------------------
 */




/**
 * 사용자 정의 모듈
 * --------------------------------
 */
var _module = function() {
	console.log('사용자 정의 모듈(재사용 목적)');
};

/**
 * 모듈 출력(내보내기)
 * module.exports === exports
 * exports = _module; 가능
 * --------------------------------
 */
module.exports = _module;

