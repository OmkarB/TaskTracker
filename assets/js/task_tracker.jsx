import React from 'react';
import ReactDOM from 'react-dom'
import { Provider, connect } from 'react-redux'
import { BrowserRouter as Router, Route } from 'react-router-dom';


// http://www.ccs.neu.edu/home/ntuck/courses/2018/01/cs4550/notes/20-redux/notes.html
let TaskTracker = connect((state) => state)((props) => {
	return (
		<Router>
			<div>
				<Nav />
					<Route path="/" exact={true} render={() =>
          				<Login />
        			} />
        			<Route path="/tasks" exact={true} render={() =>
          				<Tasks tasks={props.state.tasks} />
        			} />
      		</div>
    	</Router>
	)
})

export default function task_tracker_init(store) {
	ReactDOM.render(
		<Provider store={store}>
			<TaskTracker />
		</Provider>
		document.getElementById('root'),
	);
}