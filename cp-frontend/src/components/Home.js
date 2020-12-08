import React, { useContext } from 'react';
import { makeStyles } from '@material-ui/core/styles';
import { UserContext } from '../contexts/UserContext';
import { AppInfoContext } from '../contexts/AppInfoContext';
// import { RaffleContext } from '../contexts/RaffleContext'
import Alert from './alerts/DefaultAlert'
import Raffle from './raffle/Raffle'
import { FormHelperText } from '@material-ui/core';
import cp_background from '../img/cp_background.jpg'

const useStyles = makeStyles((theme) => ({
  root: {
    display: 'flex',
    justifyContent: 'space-between',
    backgroundImage: `url(${cp_background})`,
    width: 'auto',
    height: '100vh',
    backgroundSize: '100% 100%'
  },
  alert: {
    width: '300px',
    margin: '10px'
  },
  raffle: {
    textAlign: 'center',
    width: '30%',
    margin: '10px'
  }
}))

const Home = (props) => {
  const classes = useStyles();
  const { user } = useContext(UserContext)
  const { info } = useContext(AppInfoContext)
  // const { raffle, dispatch } = useContext(RaffleContext)
  return (
    <div >
      <div className={classes.root}>
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
        <div>This is the home page</div>
      }
      <div className={classes.raffle}>
        <Raffle />
      </div>
      </div>
    </div>
  );
};

export default Home;
