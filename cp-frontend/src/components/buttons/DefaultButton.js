import React from 'react';
import Button from '@material-ui/core/Button';

const DefaultButton = (props) => {
  return (
    <div>
      <Button fullWidth size={props.size} variant="contained" type={props.type} color="primary">
      {props.label}
    </Button>
    </div>
  );
};

export default DefaultButton;
