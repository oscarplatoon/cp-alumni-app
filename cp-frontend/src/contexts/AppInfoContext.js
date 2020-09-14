import React, { createContext, useState, useReducer, useEffect } from 'react';
import { appInfoReducer } from '../reducers/AppInfoReducer';
import UserAPI from '../api/UserAPI'

export const AppInfoContext = createContext()

const AppInfoProvider = (props) => {

  const [info, dispatch] = useReducer(appInfoReducer, {}, () => {
    UserAPI.totalUsers()
    .then(res => res.json())
    .then(data => {
      let totalUsers = data['total_users']
      dispatch({type: 'GET_APP_INFO', totalUsers})
    })
  })

  // useEffect(() => {
  // }, [info])

  return (
    <AppInfoContext.Provider value={{info, dispatch}}>
      {props.children}
    </AppInfoContext.Provider>
  )
}

export default AppInfoProvider
