import React, { useState } from "react"
import Authorizaion from './Components/Authorization.js'
import Registration  from "./Components/Registration.js";
import MainPage from './Components/MainPage'
import './App.css';
import { Route } from 'react-router-dom'

function App({ history }) {
  
  function handleCreatePerson(newPerson) {
    console.log(newPerson)
  }
    // const [personsList, setPersonsList] = useState([])

    // function addUser(regSurname, regName, regPatronymic, regMail, regPhone, regPassword, e) {
    //     const newUser = {
    //       surname:`${regSurname}`,
    //       name: `${regName}`,
    //       patronymic: `${regPatronymic}`,
    //       email: `${regMail}`,
    //       phone: `${regPhone}`,
    //       password: `${regPassword}`
    //     }
    //     setPersonsList([...personsList, newUser])
    //     // console.log('users:', persons)
    // }
    
    
    return (
    <div className="App">
      <Route history={history} path='/authorization' component={Authorizaion}/>
      <Route history={history} path='/registration' render={(props) => <Registration createPerson={handleCreatePerson}/>} />
      <Route history={history} path='/main' render={(props) => <MainPage createPerson={handleCreatePerson}/>} />
    </div>
  );
}

export default App;
