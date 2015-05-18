'use strict';
/**
 * --------------------------------
 * 스토어 모듈 정의
 * Define Store Module
 * --------------------------------
 */

var save, load, clear;
// var STORE_NAME = 'tasks';

// 테스크 저장
save = function(tasks) {
	localStorage.setItem('tasks', JSON.stringify(tasks));
};
// 테스크 읽기
load = function() {
	var storedTasks = localStorage.getItem('tasks');
	if (storedTasks) {
		return JSON.parse(storedTasks);
	}
	return [];
};
// 테스크 지우기
clear = function() {
	localStorage.removeItem('tasks');
};

/**
 * 모듈 출력
 * --------------------------------
 */
exports = {
	'save'  : save,
	'load'  : load,
	'clear' : clear
}