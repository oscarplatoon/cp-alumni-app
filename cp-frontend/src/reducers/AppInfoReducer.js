export const appInfoReducer = (state, action) => {
  switch(action.type) {
    case 'GET_APP_INFO':
      return {
        totalUsers: action.totalUsers,
      }
    case 'GET_ALL_USERS':
      return {
        allUsers: action.allUsers,
      }
    default:
      return state
  }
}
