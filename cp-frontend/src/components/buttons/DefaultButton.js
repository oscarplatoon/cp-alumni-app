import React from 'react';
import Button from '@material-ui/core/Button';
import { makeStyles, withStyles } from '@material-ui/core/styles';

const useStyles = makeStyles((theme) => ({
  button: {
    background: '#378084',
    boxShadow: '0 3px 5px 2px lightgrey',
    '&:hover': {
      backgroundColor: '#378084',
      transition: '0.3s',
      boxShadow: '0 5px 5px 5px lightgrey',
    }
  }
}))


const DefaultButton = (props) => {
  const classes = useStyles();
  return (
    <div>
      <Button className={classes.button} fullWidth size={props.size} variant="contained" type={props.type} color="primary">
      {props.label}
    </Button>
    </div>
  );
};

export default DefaultButton;
