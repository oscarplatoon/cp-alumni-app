import React from 'react';
import Button from '@material-ui/core/Button';
import { makeStyles } from '@material-ui/core/styles';

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


const DefaultButton = ({handleClick, size, type, label}) => {
  const classes = useStyles();
  return (
    <div>
      <Button className={classes.button} onClick={handleClick} fullWidth size={size} variant="contained" type={type} color="primary">
      {label}
      </Button>
    </div>
  );
};

export default DefaultButton;
