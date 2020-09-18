const currentRaffle = () => {
  return fetch('http://localhost:8000/api/active_raffle/')
}

const createRaffleSession = (raffleObj) => {
  return fetch('http://localhost:8000/api/create-session/', {
    method: "POST",
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(raffleObj)
  })
}

export default {
  currentRaffle,
  createRaffleSession
}
