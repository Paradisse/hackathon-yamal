import React, {useState} from 'react'
import EntryInput from './EntryInput'

import { Link } from 'react-router-dom'

export default function AuthForm ({changeValue, valueInputs}) {

    const [authLogin, setAuthLogin] = useState('')
    const [authPassword, setAuthPassword] = useState('')

    return (
        <form className='entryForm' onSubmit={e => valueInputs(authLogin, authPassword, e)}>
            <EntryInput 
                changeValue={changeValue} 
                value={authLogin} 
                setValue={setAuthLogin} 
                placeHolder='Логин'
            />
            <EntryInput 
                changeValue={changeValue} 
                value={authPassword} 
                setValue={setAuthPassword} 
                placeHolder='Пароль'
            />
            <Link to='/main'>
                <button className='entryBtn'>Войти</button>
            </Link>
        </form>
    )
}