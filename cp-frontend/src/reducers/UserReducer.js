
export const userReducer = (state = null, action) => {
  switch (action.type) {
    case 'LOGIN_USER':
      return {
        id: action.data.user.id,
        email: action.data.user.email,
        firstName: action.data.user.first_name,
        lastName: action.data.user.last_name,
        platoon: action.data.user.cohort,
        isAdmin: action.data.user.is_staff,
        isVerified: action.data.user.is_verified,
        currentCompany: action.data.user.current_company,
        token: action.data.token,
      }
    case 'TOKEN_USER':
      return {
        email: action.data.email,
        id: action.data.id,
        firstName: action.data.first_name,
        lastName: action.data.last_name,
        isAdmin: action.data.is_staff,
        isVerified: action.data.is_verified,
        currentCompany: action.data.current_company,
        platoon: action.data.cohort,
      }
    case 'LOGOUT_USER':
      return null
    default:
      return state
  }
}
