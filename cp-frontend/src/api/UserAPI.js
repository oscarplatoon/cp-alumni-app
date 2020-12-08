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

const login = async (userInfo) => {
  try {
    let response = await fetch('http://localhost:8000/token-auth/', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(userInfo)
    })
    let data = await response.json()
    return data
  }
  catch(err) {
    console.log(err)
  }
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

const updateUser = (userInfo) => {
  console.log(userInfo)
  return fetch('http://localhost:8000/api/user/update/', {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `JWT ${localStorage.getItem('token')}`
    },
    body: JSON.stringify(userInfo)
  })
}

// API TO RETREIVE TOTAL USER COUNT
const totalUsers = () => {
  return fetch('http://localhost:8000/api/users/')
}

// API TO GRAB ALL USERS FOR ADMIN PURPOSES
const allUsers = () => {
  return fetch('http://localhost:8000/api/get_all_users/')
}

export default {
  signupUser,
  login,
  currentUser,
  totalUsers,
  updateUser,
  allUsers
}
