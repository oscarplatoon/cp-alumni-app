import React, { useState } from 'react';
import TextField from '@material-ui/core/TextField';
import { makeStyles } from '@material-ui/core/styles';
import Select from 'react-select'
import Button from './buttons/DefaultButton'
import Alert from './alerts/DefaultAlert'
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
  name: {
    width: '48%',
    margin: '7px 2px 7px 2px',
  },
  textField: {
    width: '97%',
    margin: '7px'
  },
  buttonContainer: {
    marginTop: '1.5rem'
  }
}));

const options = [
  { value: 'lima', label: 'Lima' },
  { value: 'mike', label: 'Mike' },
  { value: 'kilo', label: 'Kilo' },
  { value: 'juliet', label: 'Juliet' }
]


const Signup = () => {
  const [signedUp, setSignedUp] = useState(false)
  const classes = useStyles();


  const handleSubmit = (evt) => {
    evt.preventDefault();
    let userInfo = {
       first_name: evt.target.firstName.value,
       last_name: evt.target.lastName.value,
       password: evt.target.password.value,
      //  cohort: evt.target.cohort.value,
       email: evt.target.email.value
    }
    UserAPI.signupUser(userInfo)
    .then(res => res.json()
    ).then(data => setSignedUp(true))
  }


  return (
    <div style={{ 'textAlign': 'center' }}>
      <div className={classes.container}>
      {
        !signedUp
        ?
        <form className={classes.form} onSubmit={handleSubmit}>
          <AccountCircleIcon className={classes.icon} />
          <div className={classes.title}>Signup</div>
          <div>
            <TextField
              id="outlined-search"
              label="First Name"
              variant="outlined"
              className={classes.name}
              name='firstName'
              required
              />
              <TextField
              id="outlined-search"
              label="Last Name"
              variant="outlined"
              className={classes.name}
              name='lastName'
              required
              />
              </div>
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
              <div>
              <TextField
              id="outlined-search"
              label="Confirm Password"
              type='password'
              variant="outlined"
              className={classes.textField}
              name='confirmPassword'
              required
            />
          </div>
          {/*<div>
            <Select
              options={options}
              style={{ margin: '10px' }}
              name='cohort'
            />
  </div>*/}
          <div className={classes.buttonContainer}>
            <Button size='large' type='submit' label='GET STARTED' />
          </div>
        </form>
        :
        <div>
        <AccountCircleIcon className={classes.icon} />
          <div className={classes.title}>Signup</div>
          <Alert type='success' label='Success' message="You've successfully signed up" />
        </div>
      }
      </div>
    </div>
  );
};

export default Signup;
