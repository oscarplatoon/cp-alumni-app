import React, { useState, useContext } from 'react';
import { CohortContext } from '../contexts/CohortContext';
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
    minWidth: '30%',
    maxWidth: '70%',
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
  },
  error: {
    marginBottom: '10px'
  }
}));

// --- REACT SELECT STYLING
// const customStyles = {
//   container: (provided, state) => ({
//     ...provided,
//     padding: '5px'
//   }),
//   control: (provided, state) => ({
//     ...provided,
//     width: '100%',
//     padding: '10px'
//   }),
//   menu: (provided, state) => ({
//     ...provided,
//     zIndex: 2
//   })
// }


const Signup = () => {
  const [signedUp, setSignedUp] = useState(false)
  const [error, setError] = useState({error: false, message: ''})
  const { cohorts } = useContext(CohortContext)
  const classes = useStyles();

  const cohortOptions = cohorts => {
    let options = [];
    cohorts.map(cohort => {
      if (cohort.current_cohort) {
        options.push({'value': cohort.platoon, 'label': `${cohort.platoon.toUpperCase()} (CURRENT)`})
      } else {
        options.push({'value': cohort.platoon, 'label': cohort.platoon.toUpperCase()})
      }
    })
    return options
  }

  const handleSubmit = (evt) => {
    evt.preventDefault();
    let userInfo = {
      first_name: evt.target.firstName.value,
      last_name: evt.target.lastName.value,
      password: evt.target.password.value,
      email: evt.target.email.value
    }
    UserAPI.signupUser(userInfo)
      .then(res => res.json()
      ).then(data => {
        if (Array.isArray(data['cohort'])) {
          setError({error: true, message: 'There was an error signing up.'})
        } else {
          setSignedUp(true)
        }
      })
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
              {
                error['error']
                &&
                <div className={classes.error}>
                  <Alert type='error' label='Error' message={error.message} />
                </div>
              }
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
