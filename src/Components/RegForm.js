import React, { useState } from 'react'
import EntryInput from './EntryInput'
import { Link, useHistory } from 'react-router-dom'

function RegForm({flag, changeValue, valueInputs}) {
    
    const [regSurname, setRegSurname] = useState('')
    const [regName, setRegName] = useState('')
    const [regPatronymic, setRegPatronymic] = useState('')
    const [regMail, setRegMail] = useState('')
    // const [regPhone, setRegPhone] = useState('')
    const [regPassword, setRegPassword] = useState('')
    const [flagError, setFlagError] = useState(true)

    function fillInputs(e) {
        e.preventDefault()
        valueInputs(regSurname, regName, regPatronymic, regMail, regPassword)
    }
    

    return (
        <form 
            className='entryForm' 
            // onSubmit={ (e) => valueInputs(regSurname, regName, regPatronymic, regMail, regPhone, regPassword, e)}
        >
            <EntryInput 
                changeValue={changeValue} 
                value={regSurname} 
                setValue={setRegSurname} 
                placeHolder='Фамилия'
            />  
            <EntryInput 
                changeValue={changeValue} 
                value={regName} 
                setValue={setRegName} 
                placeHolder='Имя'
            />    
            <EntryInput 
                changeValue={changeValue} 
                value={regPatronymic} 
                setValue={setRegPatronymic} 
                placeHolder='Отчество'
            />  
            <EntryInput 
                changeValue={changeValue} 
                value={regMail} 
                setValue={setRegMail} 
                placeHolder='E-mail'
            />  
            {/* <EntryInput 
                changeValue={changeValue} 
                value={regPhone} 
                setValue={setRegPhone} 
                placeHolder='Телефон'
            />   */}
            <EntryInput 
                changeValue={changeValue} 
                value={regPassword} 
                setValue={setRegPassword} 
                placeHolder='Пароль'
            /> 
            <div>
                <button 
                    onClick={(e) => fillInputs(e)}
                    className='entryBtn'>Зарегистрироваться
                </button>
                {flag 
                    ? <p className='wrapperEntry__error'>User with this email already exist!</p>
                    : null
                }
            </div>
            {/* { flag 
                ?   <button 
                        onClick={() => {
                            clickSuccess()
                        }}
                        className='entryBtn'>Зарегистрироваться
                    </button>
                :   <div>
                        <button 
                            onClick={() => {
                                clickError()}}
                            className='entryBtn'
                        >
                            lkj
                        </button>
                        {flagError 
                            ? console.log(flag)
                            : <p className='wrapperEntry__error'>User with this email already exist!</p>
                        }
                    </div>
            } */}
        </form>
    )
}

export default RegForm