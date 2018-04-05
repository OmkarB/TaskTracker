import {createStore, combineReducers } from 'redux'
import deepFreeze from 'deep-freeze'

// Borrowed from Nat Tuck's notes
// http://www.ccs.neu.edu/home/ntuck/courses/2018/01/cs4550/notes/20-redux/notes.html
function tasks(state = [], action) {
	switch (action.type) {
		case 'NEW_TASK':
			return [action.task, ...state];
		default:
			return state;
	}
};

function users(state = [], action) {
  return state;
}


function root_reducer(state, action) {
	let reducer = combineReducers({ tasks, users });
	let state1 = reducer(state, action)
	return deepFreeze(state1)
};

let store = createStore(root_reducer)
export default store;