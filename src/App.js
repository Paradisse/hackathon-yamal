import React, { useState } from "react"
import Authorizaion from './Components/Authorization.js'
import Registration  from "./Components/Registration.js";
import MainPage from './Components/MainPage'
import './App.css';
import { Route, Redirect } from 'react-router-dom'

function App({ history }) {
  const [person, setPerson] = useState({})
  function handleCreatePerson(newPerson) {
    setPerson(newPerson)
  }
  console.log(person)
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
      <Route history={history} path='/main' render={(props) => <MainPage person={person}/>} />
      <Redirect from='/' to='/registration' />
    </div>
  );
}

export default App;
