import store from './store'

class Server {
	request_tasks() {
		$.ajax("/api/v1/tasks", {
			method: "get",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			success: (resp) => {
				store.dispatch({
					type: 'TASKS_LIST',
					tasks: resp.data,
				});
			},
		});
	}

	submit_tasks() {
		$.ajax("/api/v1/tasks", {
			method: "post",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			success: (resp) => {
				store.dispatch({
				type: 'ADD_TASK',
				task: resp.data,
				});
			},
		});
	}
}

export default new Server()