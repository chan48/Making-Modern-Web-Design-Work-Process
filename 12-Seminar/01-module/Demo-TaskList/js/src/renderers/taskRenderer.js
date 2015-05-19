'use strict';

var $            = require('jquery'),
	taskTemplate = '';

taskTemplate += '<li class="task">';
taskTemplate += 	'<input type="checkbox" class="complete">';
taskTemplate += 	'<input type="text" class="description" placeholder="업무에 관한 설명 입력">';
taskTemplate += 	'<button class="delete-btn">제거</button>';
taskTemplate += '</li>';

function _renderTask(task) {
	var $task = $(taskTemplate);
	if (task.complete) {
		$task.find('.complete').attr('checked', 'checked');
	}
	$task.find('.description').val(task.description);
	return $task;
}

exports.renderTasks = function(tasks) {
	var elementArr = $.map(tasks, _renderTask);
	$('#task-list').empty().append(elementArr);
};

exports.renderNew = function() {
	var $taskList = $('#task-list');
	$taskList.prepend(_renderTask({}));
}