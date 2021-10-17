import React, { useState } from 'react'
import RegForm from './RegForm'
import { useHistory } from 'react-router-dom'
import axios  from 'axios'
import cors from 'cors'

function Registration({ createPerson }) {
    const [familyList, setFamilyList] = useState([])
    const [flag, setFlag] = useState(false)
    const [person, setPerson] = useState({})
    const history = useHistory()
    console.log(flag)
    const [flagError, setflagError] = useState(false)

    function addUser(regSurname, regName, regPatronymic, regMail, regPassword, e) {
        const newUser = {
          surname:`${regSurname}`,
          name: `${regName}`,
          patronymic: `${regPatronymic}`,
          email: `${regMail}`,
        //   phone: `${regPhone}`,
          password: `${regPassword}`
        }
        postUser(newUser)
    }
    const postUser = async (newElem) => {
        try {
            const newUser = await axios.post(`https://hackathon-yamal.herokuapp.com/register/${newElem.email}/${newElem.password}`, newElem)
            if (newUser.data.code === 'SUCCESS') {
                setFamilyList([...familyList, newUser])
                setPerson(newUser)
                createPerson(newUser)
                history.push('/main')
                console.log("newUser", newUser.data)
            } else {
                setflagError(true)
                console.log(newUser.data)
            }
        } catch(e) {
            alert(`${e}`)
            console.log("error", e)
        }
    }
    
    function handleChangeValue(func, e) {
        func(e.target.value)
    }

    

    return (
        <div className="wrapperEntry">
            <RegForm flag={flagError} changeValue={handleChangeValue} valueInputs={addUser}/>     
        </div>
    )
}

export default Registration