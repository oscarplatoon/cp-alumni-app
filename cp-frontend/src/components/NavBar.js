import React, { useContext } from 'react';
import { useHistory } from "react-router-dom";

import { UserContext } from '../contexts/UserContext';


import { makeStyles, withTheme } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import Button from '@material-ui/core/Button';
import IconButton from '@material-ui/core/IconButton';
import MenuIcon from '@material-ui/icons/Menu';
import { Link } from 'react-router-dom'
import AccountCircleIcon from '@material-ui/icons/AccountCircle';

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
    backgroundColor: '#F26123'
  },
  menuButton: {
    marginRight: theme.spacing(2),
  },
  title: {
    flexGrow: 1,
  },
  login: {
    color: 'white',
    textDecoration: 'none',
    padding: '10px',
    margin: '5px',
    borderRadius: '5px',
    '&:hover': {
      border: '1px solid white',
      backgroundColor: 'white',
      transition: '0.5s',
      color: '#F26123',
    }
  },
  signup: {
    backgroundColor: 'white',
    color: '#F26123',
    textDecoration: 'none',
    padding: '10px',
    borderRadius: '5px',
    border: '1px solid white',
    '&:hover': {
      backgroundColor: '#F26123',
      transition: '0.3s',
      color: 'white',
    }
  },
  loginContainer: {
    display: 'flex',
    flexDirection: 'row'
  },
  logo: {
    textDecoration: 'none',
    color: 'white'
  }
}));

const NavBar = (props) => {
  let history = useHistory();
  const { user, dispatch } = useContext(UserContext)
  const classes = useStyles();

  const handleLogout = () => {
    localStorage.removeItem('token')
    dispatch({type: "LOGOUT_USER"})
  }

  return (
    <div >
      <AppBar position="static" >
        <Toolbar className={classes.root}>
          <IconButton edge="start" className={classes.menuButton} color="inherit" aria-label="menu">
            <MenuIcon />
          </IconButton>
          <Typography variant="h6" className={classes.title}>
            <a href='/' className={classes.logo}>CP Alumni Network</a>
          </Typography>
          {
            !user
            ?
            <div>
              <Link to="/login" className={classes.login} >Login</Link>
              <Link to="/signup" className={classes.signup} >Signup</Link>
            </div>
            :
            <div className={classes.loginContainer}>
              <div>
                <AccountCircleIcon fontSize='large' />
              </div>
              <div>
                <Button onClick={handleLogout}>Logout</Button>
              </div>
            </div>
          }
        </Toolbar>
      </AppBar>
    </div>
  );
};

export default NavBar;
