import React from 'react';
import './App.css';
import NavBar from './components/NavBar'
import { BrowserRouter, Route } from 'react-router-dom'
import Signup from './components/Signup';
import Login from './components/Login';
import Home from './components/Home';
import Raffle from './components/raffle/Raffle'
import UserContextProvider from './contexts/UserContext';
import AppInfoProvider from './contexts/AppInfoContext'
import UserProfile from './components/userProfile/UserProfile';
import RaffleProvider from './contexts/RaffleContext';
import CohortProvider from './contexts/CohortContext'


function App() {


  return (
    <div className="App">
      <UserContextProvider>
        <RaffleProvider>
          <BrowserRouter>
            <NavBar />
            <Route exact path='/login' component={Login} />
            <AppInfoProvider>
              <Route exact path='/' component={Home} />
            </AppInfoProvider>
            <CohortProvider>
              <Route exact path='/profile' component={UserProfile} />
              <Route exact path='/signup' component={Signup} />
            </CohortProvider>
            <Route exact path='/raffle/?success=true' component={Raffle} />
            <Route exact path='/raffle' component={Raffle} />
          </BrowserRouter>
        </RaffleProvider>
      </UserContextProvider>
    </div>
  );
}

export default App;
