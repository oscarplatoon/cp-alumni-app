export const cohortReducer = (state=null, action) => {
  switch(action.type) {
    case 'GET_COHORTS':
      return action.data
        // currentCohort: action.currentCohort

    default:
      return state
  }
}
