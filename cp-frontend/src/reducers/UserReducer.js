export const userReducer = (state, action) => {
  switch(action.type) {
    case 'LOGIN_USER':
      return {
        email: action.data.user.email,
        token: action.data.token,
        id: action.data.user.id
      }
    case 'TOKEN_USER':
      return {
        email: action.data.email,
        id: action.data.id
      }
    case 'LOGOUT_USER':
      return undefined
    default:
      return state
  }
}
