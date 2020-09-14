const signupUser = (userInfo) => {
  console.log(userInfo)
  return fetch('http://localhost:8000/api/users/', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(userInfo)
  })
}

const login = (userInfo) => {
  return fetch('http://localhost:8000/token-auth/', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(userInfo)
  })
}

const currentUser = (token) => {
  return fetch('http://localhost:8000/api/current_user/', {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `JWT ${token}`
    }
  })
}

const totalUsers = () => {
  return fetch('http://localhost:8000/api/get_user_count/')
}

export default {
  signupUser,
  login,
  currentUser,
  totalUsers
}
