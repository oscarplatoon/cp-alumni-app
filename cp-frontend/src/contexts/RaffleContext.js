import React, { createContext, useReducer } from 'react';
import { raffleReducer } from '../reducers/RaffleReducer';
import RaffleAPI from '../api/RaffleAPI'

export const RaffleContext = createContext()

const RaffleProvider = (props) => {

  const [raffle, dispatch] = useReducer(raffleReducer, {}, () => {
    RaffleAPI.currentRaffle()
    .then(res => res.json())
    .then(data => {
      dispatch({type: 'GET_RAFFLE', data})
    })
  })

  // useEffect(() => {
  // }, [info])

  return (
    <RaffleContext.Provider value={{raffle, dispatch}}>
      {props.children}
    </RaffleContext.Provider>
  )
}

export default RaffleProvider
