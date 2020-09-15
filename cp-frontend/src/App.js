import React, { useEffect } from 'react';
import './App.css';
import NavBar from './components/NavBar'
import { BrowserRouter, Route } from 'react-router-dom'
import Signup from './components/Signup';
import Login from './components/Login';
import Home from './components/Home';
import UserContextProvider from './contexts/UserContext';
import AppInfoProvider from './contexts/AppInfoContext'
import UserProfile from './components/userProfile/UserProfile';


function App() {



  return (
    <div className="App">
    <UserContextProvider>
      <BrowserRouter>
          <NavBar />
          <Route exact path='/signup' component={Signup} />
          <Route exact path='/login' component={Login} />
          <AppInfoProvider>
            <Route exact path='/' component={Home} />
          </AppInfoProvider>
          <Route exact path='/profile' component={UserProfile} />
        </BrowserRouter>
      </UserContextProvider>
    </div>
  );
}

export default App;
