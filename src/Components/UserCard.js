import React from 'react'
import { Link } from 'react-router-dom' 

function UserCard ({ person }) {
    return (
        <div className='userInfo'>
                    <h2>Личная карточка</h2>
                    <div className='userInfo__imgWrap'>
                        <button>
                        <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <rect width="22" height="22" fill="url(#pattern0)"/>
                            
                        </svg>
                        </button>
                        <img src='/' alt='пользователь'/>
                    </div>
                    <div>
                      <p>ФИО</p>
                      <input type='file' />  
                      <p>{`email: ${person.data.user.email}`}</p>    
                    </div>
                    <Link to='/authorization'>
                        <button className="entryBtn entryBtn_bg">Добавить пользователя</button>
                    </Link>
                </div>
    )
}

export default UserCard