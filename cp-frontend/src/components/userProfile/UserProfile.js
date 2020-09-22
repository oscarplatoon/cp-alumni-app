import React, { useContext } from 'react';
import { UserContext } from '../../contexts/UserContext';

import { makeStyles } from '@material-ui/core/styles';
import CircularProgress from '@material-ui/core/CircularProgress';
import TextField from '@material-ui/core/TextField';
import Divider from '@material-ui/core/Divider';

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
    },
    name: {
      margin: '10px'
    },
    field: {
      padding: '20px'
    }
  },
}));

const UserProfile = (props) => {
  const { user, dispatch } = useContext(UserContext)
  const classes = useStyles();
  console.log(user)
  return (
    <div>
      {
        user
        &&

          <div className={classes.profileContainer}>
            <form className={classes.form} noValidate autoComplete="off">
              <div className={classes.title}>User Profile</div>
              <Divider />
                  <TextField
                    id="outlined-basic"
                    label="First Name"
                    variant="outlined"
                    placeholder={user['firstName']}
                    defaultValue={user['firstName']}
                    />
                  <TextField
                    id="outlined-basic"
                    label="Last Name"
                    variant="outlined"
                    placeholder={user['lastName']}
                    defaultValue={user['lastName']}
                    />
                <div>
                  <TextField
                    id="outlined-basic"
                    label="Email"
                    variant="outlined"
                    placeholder={user['email']}
                    defaultValue={user['email']}
                    />
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
