const currentRaffle = () => {
  return fetch('http://localhost:8000/api/active_raffle/')
}

export default {
  currentRaffle,

}
