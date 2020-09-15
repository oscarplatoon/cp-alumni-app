export const userReducer = (state, action) => {
  switch(action.type) {
    case 'LOGIN_USER':
      return {
        id: action.data.user.id,
        email: action.data.user.email,
        firstName: action.data.user.first_name,
        lastName: action.data.user.last_name,
        platoon: action.data.user.cohort,
        token: action.data.token,
      }
    case 'TOKEN_USER':
      return {
        email: action.data.email,
        id: action.data.id,
        firstName: action.data.first_name,
        lastName: action.data.last_name,
        platoon: action.data.cohort,
      }
    case 'LOGOUT_USER':
      return undefined
    default:
      return state
  }
}
