import React from 'react';
import { Link } from 'react-router-dom';
import { connect } from 'react-redux'

// http://www.ccs.neu.edu/home/ntuck/courses/2018/01/cs4550/notes/20-redux/notes.html
// microblog.jsx
let Tasks = connect(({tasks}) => {return {tasks};})((props) => {
  return _.map(props.tasks, (task) =>
    <div>
        <div>
            <h5>{task.title}</h5>
            <h6>{task.user.name}</h6>
                <p>{task.description}</p>
                <p>{task.completed}</p>
                <p>{task.time}</p>
        </div>
        <Link to={"/edit/" + task.id}>Edit</Link>
    </div>
  )
});

export default Tasks;
