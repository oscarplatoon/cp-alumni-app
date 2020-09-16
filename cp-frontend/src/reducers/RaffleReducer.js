export const raffleReducer = (state, action) => {
  switch(action.type) {
    case 'GET_RAFFLE':
      return action.data
        // currentCohort: action.currentCohort

    default:
      return state
  }
}
