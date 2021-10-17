import React from "react"
import AuthForm from './AuthForm'
import { Link } from 'react-router-dom'
 
function Authorization ({ history }) {
    function handleChangeValue(func, e) {
        func(e.target.value)
    }

    function valueInputs(login, password, e) {
        console.log(`login: ${login}, password: ${password}`)
        e.preventDefault()
    } 


    return (
        <div className="wrapperEntry">
            <AuthForm changeValue={handleChangeValue} valueInputs={valueInputs}/>
            <Link to='registration'>
                <button className='entryBtn'>Регистрация</button>
            </Link> 
            <div>
                <p>Войти с помощью:</p>
                <div>
                    <a className="auth__link" href="@">link</a>
                    <a className="auth__link" href="@">link</a>
                    <a className="auth__link" href="@">link</a>
                </div>
            </div>
        </div>
    )
}

export default Authorization