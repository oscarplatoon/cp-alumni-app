export const appInfoReducer = (state, action) => {
  switch(action.type) {
    case 'GET_APP_INFO':
      return {
        totalUsers: action.totalUsers,
        // currentCohort: action.currentCohort
      }
    default:
      return state
  }
}
