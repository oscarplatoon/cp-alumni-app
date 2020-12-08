import React, { useContext, useState } from 'react';

import { RaffleContext } from '../../contexts/RaffleContext'
import DefaultButton from '../buttons/DefaultButton'
import { makeStyles } from '@material-ui/core/styles';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import Paper from '@material-ui/core/Paper';
import CheckoutModal from './CheckoutModal';


const useStyles = makeStyles((theme) => ({
  root: {
    // boxShadow: '5px 5px 5px 5px darkgrey',
    padding: 10,
    backgroundColor: '#EDF7ED',
    borderRadius: '10px'
  },
  title: {
    fontSize: '36px',
    margin: '0 0 10px 0',
    color: '#224A24'
  },
  paper: {
    margin: '0 0 5px 0',
    maxWidth: '100%',
  },
  table: {
  }

}));

const Raffle = (props) => {
  const classes = useStyles();

  const [openCheckout, setOpenCheckout] = useState(false)
  const { raffle } = useContext(RaffleContext)

  const handleCheckoutDisplay = () => {
    setOpenCheckout(!openCheckout)
  }

  const displayRaffleParticipants = () => {
    return raffle['raffle_participants'].map((participant, index) => {
      return <TableRow key={index}>
              <TableCell component="th" scope="row">
                {participant.name}
              </TableCell>
              <TableCell align="right">{participant.tickets}</TableCell>
              <TableCell align="right">${participant.tickets * 5}</TableCell>
            </TableRow>
    })
  }

  return (
    <div >
      {
        raffle
        &&
        <div className={classes.root}>
          <div className={classes.title}>{raffle['name']} Raffle</div>

          <Paper className={classes.paper}>
            <Table className={classes.table} aria-label="caption table">
              <TableHead>
                <TableRow>
                  <TableCell>Name</TableCell>
                  <TableCell align="right">Tickets</TableCell>
                  <TableCell align="right">Amount</TableCell>
                </TableRow>
              </TableHead>
              <TableBody>
                {
                  displayRaffleParticipants()
                }
              </TableBody>
            </Table>
          </Paper>
          <DefaultButton size='large' handleClick={handleCheckoutDisplay} label='buy raffle tickets'/>
        </div>
      }
      {
        openCheckout && <CheckoutModal handleCheckoutDisplay={handleCheckoutDisplay} />
      }
    </div>
  );
};

export default Raffle;
