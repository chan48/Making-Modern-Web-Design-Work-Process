'use strict';

var store_name = 'tasks';

// 저장
exports.save = function(tasks) {
	localStorage.setItem(store_name, JSON.stringify(tasks));
};
// 읽기
exports.load = function(tasks) {
	var storedTasks = localStorage.getItem(store_name, tasks);
	if (storedTasks) {
		return JSON.parse(storedTasks);
	}
	return [];
}
// 지우기
exports.clear = function() {
	localStorage.removeItem(store_name);
};