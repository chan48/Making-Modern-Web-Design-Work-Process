'use strict';

var $     = require('jquery'),
	tasks = require('./tasks');

function _addTask () {
	tasks.add();
};

function _saveChanges () {
	tasks.save();
};

function _cancelChanges () {
	tasks.cancel();
};

function _deleteTask (clickEvent) {
	tasks.remove(clickEvent);
};

function _deleteAllTask () {
	tasks.clear();
};

function _registerEventHandlers () {
	$('#new-task-btn').on('click', _addTask);
	$('#delete-all-btn').on('click', _deleteAllTask);
	$('#save-btn').on('click', _saveChanges);
	$('#cancel-btn').on('click', _cancelChanges);
	$('#task-list').on('click', '.delete-btn', _deleteTask);
};

_registerEventHandlers();
tasks.render();