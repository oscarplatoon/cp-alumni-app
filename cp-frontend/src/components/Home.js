import React, { useContext } from 'react';
import { makeStyles } from '@material-ui/core/styles';
import { UserContext } from '../contexts/UserContext';
import { AppInfoContext } from '../contexts/AppInfoContext';
import Alert from './alerts/DefaultAlert'

const useStyles = makeStyles((theme) => ({
  alert: {
    width: '300px',
    margin: '10px'
  },
}))

const Home = (props) => {
  const classes = useStyles();
  const { user } = useContext(UserContext)
  const { info } = useContext(AppInfoContext)
  return (
    <div>
      {
        info !== undefined
        ?
        <div className={classes.alert}>
          <Alert severity='success' message={`${info['totalUsers']} Active Alumni` } />
        </div>
        :
        <div>Loading...</div>

      }
      {
        user
        ?
        <div>Hello {user.email} </div>
        :
        <div>Login or Signup</div>
      }
    </div>
  );
};

export default Home;
