import React, { useContext, useState } from 'react';
import { UserContext } from '../contexts/UserContext';
import TextField from '@material-ui/core/TextField';
import { makeStyles } from '@material-ui/core/styles';
import DefaultButton from './buttons/DefaultButton'
import DefaultAlert from './alerts/DefaultAlert'
import AccountCircleIcon from '@material-ui/icons/AccountCircle';

import UserAPI from '../api/UserAPI'

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
    backgroundColor: '#F26123',
  },
  container: {
    width: '30%',
    margin: 'auto',
    padding: '10px',
    marginTop: '30px',
    borderRadius: '5px',
    boxShadow: '5px 10px 10px #888888'
  },
  icon: {
    fontSize: '75px'
  },
  form: {
    margin: '30px'
  },
  title: {
    fontSize: '42px',
    margin: '10px 0 20px 0'
  },
  textField: {
    width: '97%',
    margin: '7px'
  },
  buttonContainer: {
    marginTop: '1rem'
  }
}));

const Login = (props) => {
  const classes = useStyles();
  const [error, setError] = useState({'error': false, 'message': null})
  const { dispatch } = useContext(UserContext)

  const handleSubmit = async (evt) => {
    evt.preventDefault();
    const userInfo = {
      password: evt.target.password.value,
       email: evt.target.email.value
    }
    let data = await UserAPI.login(userInfo)
    console.log(data)
    if (data['non_field_errors']) {
      setError({'error': true, 'message': 'Invalid email or password.'})
    } else {
      dispatch({type: 'LOGIN_USER', data})
      return props.history.push('/')
    }
  }

  return (
    <div style={{ 'textAlign': 'center' }}>
      <div className={classes.container}>
        {error['error'] && <DefaultAlert type='error' message={error.message} />}
        <form className={classes.form} onSubmit={handleSubmit}>
          <AccountCircleIcon className={classes.icon} />
          <div className={classes.title}>Login</div>
          <div>
            <TextField
              id="outlined-search"
              label="Email"
              type='email'
              variant="outlined"
              className={classes.textField}
              name='email'
              required
            />
          </div>
          <div>
            <TextField
              id="outlined-search"
              label="Password"
              type='password'
              variant="outlined"
              className={classes.textField}
              name='password'
              required
            />
          </div>
          <div className={classes.buttonContainer}>
            <DefaultButton size='large' type='submit' label='LOGIN' />
          </div>
        </form>
      </div>
    </div>
  );
};

export default Login;
