import React from 'react';
import { Link } from 'react-router-dom';
import { Button, FormGroup, Label, Input } from 'reactstrap';

// post-form.jsx from Nat Tuck's lecture notes
export default function Login(props) {
    return (
        <h2>Login</h2>
        <FormGroup>
            <Label for="email">Email</Label>
            <Input type="email" name="email"></Input>
        </FormGroup>
        <FormGroup>
            <Label for="password">password</Label>
            <Input type="password">password</Input>
        </FormGroup>
        <Button onClick={submit}>Login</Button>
        <Link to="register">Register</Link>

    )
}