import React, { useContext, useState } from 'react';
import { UserContext } from '../../contexts/UserContext';
import { CohortContext } from '../../contexts/CohortContext';

import { makeStyles } from '@material-ui/core/styles';
import DefaultAlert from '../alerts/DefaultAlert'
import CircularProgress from '@material-ui/core/CircularProgress';
import TextField from '@material-ui/core/TextField';
import Divider from '@material-ui/core/Divider';
import Select from 'react-select'
import DefaultButton from '../buttons/DefaultButton'
import UserAPI from '../../api/UserAPI'

const useStyles = makeStyles((theme) => ({
  title: {
    fontSize: '36px'
  },
  profileContainer: {
    borderRadius: '5px',
    boxShadow: '2px 2px 5px 5px lightgrey',
    width: '70%',
    margin: '15px auto',
    padding: '15px'
  },
  form: {
    '& > *': {
      margin: '10px 5px',
      width: '20%',
      display: 'flex',
      flexWrap: 'wrap'
    }
  },
  name: {
    margin: '10px'
  },
  field: {
    margin: '10px',
    width: '30%'
  },
  secondContainer: {
    display: 'flex',
    justifyContent: 'flex-start',
    width: '100%'
  },
  buttonContainer: {
    width: '100%',
    margin: '25px 15px',
    // padding: '15px'
  }
}));

const customStyles = {
  container: (provided, state) => ({
    ...provided,
    paddingTop: '10px',
    marginLeft: '15px',
    width: '61.5%'
  }),
  control: (provided, state) => ({
    ...provided,
    width: '100%',
    padding: '10px'
  }),
  menu: (provided, state) => ({
    ...provided,
    zIndex: 2
  })
}

const UserProfile = (props) => {
  const { user } = useContext(UserContext)
  const { cohorts } = useContext(CohortContext)
  const classes = useStyles();
  const [message, setMessage] = useState(null)

  const cohortOptions = cohorts => {
    let options = [];
    cohorts.map(cohort => {
      if (cohort.current_cohort) {
        return options.push({'value': cohort.platoon, 'label': `${cohort.platoon.toUpperCase()} (CURRENT)`})
      } else {
        return options.push({'value': cohort.platoon, 'label': cohort.platoon.toUpperCase()})
      }
    })
    return options
  }


  const handleSubmit = (evt) => {
    evt.preventDefault();
    let userObj = {
      id: user['id'],
      firstName: evt.target.firstName.value || user['firstName'],
      lastName: evt.target.lastName.value || user['lastName'],
      email: evt.target.email.value || user['email'],
      cohort: evt.target.cohort.value || user['platoon'],
      currentCompany: evt.target.currentCompany.value || user['currentCompany']
    }
    UserAPI.updateUser(userObj)
      .then(resp => resp.json())
      .then(data => {
        setMessage(data['message'])
      })

  }

  if (user === undefined) {
    return (<div>You don't have access to this page</div>)
  }

  return (
    <div>
      {
        user && !user.isVerified && <DefaultAlert type='warning' message="Your Code Platoon status has not been verified yet. That's okay! You still have access to everything."/>
      }
      {
        user
        &&
          <div className={classes.profileContainer}>
          { message && <DefaultAlert type={'success'} message={message} />}
            <form className={classes.form} noValidate autoComplete="off" onSubmit={handleSubmit}>
              <div className={classes.title}>User Profile</div>
              <Divider />
                <div className={classes.secondContainer}>
                  <TextField
                    id="outlined-basic"
                    label="First Name"
                    variant="outlined"
                    placeholder={user['firstName']}
                    defaultValue={user['firstName']}
                    className={classes.field}
                    name='firstName'
                    />
                  <TextField
                    id="outlined-basic"
                    label="Last Name"
                    variant="outlined"
                    placeholder={user['lastName']}
                    defaultValue={user['lastName']}
                    className={classes.field}
                    name='lastName'
                    />
                </div>
                <div className={classes.secondContainer}>
                  <TextField
                    id="outlined-basic"
                    label="Email"
                    variant="outlined"
                    placeholder={user['email']}
                    defaultValue={user['email']}
                    className={classes.field}
                    name='email'
                  />
                  <TextField
                    id="outlined-basic"
                    label="Current Company"
                    variant="outlined"
                    placeholder={user['currentCompany'] || 'Example: Netflix'}
                    defaultValue={user['currentCompany']}
                    className={classes.field}
                    name='currentCompany'
                    />
                </div>
                  {
                    cohorts.length
                    &&
                      <Select
                        styles={customStyles}
                        options={cohorts.length && cohortOptions(cohorts)}
                        name='cohort'
                        defaultValue={user['platoon']}
                        placeholder={user['platoon'] ? user['platoon'].toUpperCase() : 'Ex: Alpha'}
                        required
                      />
                  }
                  <div className={classes.buttonContainer}>
                    <DefaultButton  size='large' type='submit' label='update profile'/>
                  </div>
              </form>
            </div>
        // :
        // <CircularProgress />
      }
    </div>
  );
};

export default UserProfile;
