import React, { useContext, useState } from 'react';
import { makeStyles } from '@material-ui/core/styles';
import { loadStripe } from "@stripe/stripe-js";
import { RaffleContext } from '../../contexts/RaffleContext'
import Modal from '@material-ui/core/Modal';
import Fade from '@material-ui/core/Fade';
import TextField from '@material-ui/core/TextField';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableContainer from '@material-ui/core/TableContainer';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import Paper from '@material-ui/core/Paper';
import RaffleAPI from '../../api/RaffleAPI'

const useStyles = makeStyles((theme) => ({
  modal: {
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
  },
  paper: {
    backgroundColor: theme.palette.background.paper,
    border: '2px solid #000',
    boxShadow: theme.shadows[5],
    padding: theme.spacing(2, 4, 3),
    margin: '100px'
  },
}));


const stripePromise = loadStripe("pk_test_51HS7wnFVM9KnaWOncRfuXOp4GwbVMtj3bNMuB3oMGuzD0Mg2FyknjVx72MdZejdA6blT0sM1011MAsjbkXUTu3XU00aKBxCC2i");


// const RaffleCheckout = () => (
//   <section>
//     <div className="product">
//       <div className="description">
//         <h3>Stubborn Attachments</h3>
//         <h5>$20.00</h5>
//       </div>
//     </div>
//     <button id="checkout-button" role="link">
//       Checkout
//     </button>
//   </section>
// )



const CheckoutModal = ({ handleCheckoutDisplay }) => {
  const [quantity, setQuantity] = useState(1)
  const classes = useStyles();
  const { raffle } = useContext(RaffleContext)
  // const [open, setOpen] = React.useState(true);

  const handleDecrease = (evt) => {
    evt.preventDefault()
    if (quantity > 1) {
      setQuantity(quantity - 1)
    }
  }

  const handleIncrease = (evt) => {
    evt.preventDefault()
    setQuantity(quantity + 1)
  }

  const handleTicketPurchase = async (evt) => {
    evt.preventDefault()
    let raffleObj = {
      quantity: quantity,
      name: evt.target.name.value,
      email: evt.target.email.value,
      raffle: raffle.name
    }
    console.log(raffleObj)
    const stripe = await stripePromise;

    const response = await RaffleAPI.createRaffleSession(raffleObj)

    const session = await response.json()
    console.log(session)
    const result = await stripe.redirectToCheckout({
      sessionId: session.id,
    });

    console.log(result)
    if (result.error) {
      return alert("Sometheing went wrong! We couldn't redirect you to our checkout page.")
      // If `redirectToCheckout` fails due to a browser or network
      // error, display the localized error message to your customer
      // using `result.error.message`.
    }
  }

  return (
    <div className={classes.modal}>
      <Modal
        open={true}
        onClose={handleCheckoutDisplay}
        aria-labelledby="simple-modal-title"
        aria-describedby="simple-modal-description"
      >
        <Fade in={true}>
          <div className={classes.paper}>
            <section>
              <div className="product">
                <div className="description">
                  <h3>{raffle.name} Raffle</h3>
                  <form onSubmit={handleTicketPurchase}>
                    <TableContainer component={Paper}>
                      <Table className={classes.table} aria-label="simple table">
                        <TableHead>
                          <TableRow>
                            <TableCell>Name</TableCell>
                            <TableCell align="center">Email</TableCell>
                            <TableCell align="center">Dollar Amount per Ticket</TableCell>
                            <TableCell align="center">Total Tickets</TableCell>
                            <TableCell align="center">Total</TableCell>
                          </TableRow>
                        </TableHead>
                        <TableBody>
                          <TableRow >
                              <TableCell component="th" scope="row">
                                <TextField id="outlined-basic" label="Name" variant="outlined" name='name'/>
                              </TableCell>
                              <TableCell align="center">
                                <TextField id="outlined-basic" label="Email" variant="outlined" name='email'/>
                              </TableCell>
                              <TableCell align="center"><h1>$5</h1></TableCell>
                              <TableCell align="center">
                                <button onClick={handleDecrease}>-</button>
                                <input type="number" value={quantity} readOnly />
                                <button onClick={handleIncrease}>+</button>
                              </TableCell>
                              <TableCell align="center"><h1>${quantity * 5}</h1></TableCell>
                          </TableRow>
                        </TableBody>
                      </Table>
                    </TableContainer>
                    <button id="checkout-button" role="link" type='submit' >
                      Checkout
                    </button>
                  </form>
                </div>
              </div>
            </section>
          </div>
        </Fade>
      </Modal>
    </div>
  );
};

export default CheckoutModal;
