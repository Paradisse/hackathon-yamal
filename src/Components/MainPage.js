import React, { useState } from 'react'
import ListUsers from './ListUsers'
import { Link } from 'react-router-dom'
import axios from 'axios'

export default function MainPage({ createPerson }) {
    const [person, setPerson] = useState({})
    const getUser = async function (user) {
        const currentUser = await axios.get(' https://hackathon-yamal.herokuapp.com/login/${user.mail}/${user.pass}')
        console.log(currentUser)
    }

    return (

        <div className='wrapper'>
            <header className='header'>
                <div>
                    {/* <svg width="563" height="563" viewBox="0 0 563 563" fill="none" xmlns="http://www.w3.org/2000/svg" >
                    <rect width="563" height="563" rx="83" fill="white"/>
                    <rect x="93" y="67" width="378" height="428" fill="url(#pattern0)"/>
                    <linearGradient id="paint0_linear_65:948" x1="131.305" y1="208.721" x2="388.775" y2="421.697" gradientUnits="userSpaceOnUse">
                    <pattern id="pattern0" patternContentUnits="objectBoundingBox" width="1" height="1">
                    <use xlink:href="#image0_65:948" transform="translate(-0.00110105) scale(0.00213234 0.00188324)"/>
                    </pattern>
                    <stop offset="0.0395832" stop-color="#35B5B6"/>
                    <stop offset="0.451119" stop-color="#0073C7"/>
                    <stop offset="1" stop-color="#AF52DE"/>
                    </linearGradient>
                        <path d="M87.5 65H477.5V497H87.5V65Z" fill="url(#paint0_linear_65:948)" stroke="black"/>
                    </svg> */}

                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000"><path d="M0 0h24v24H0V0z" fill="none"/>
                        <path d="M12 2c1.1 0 2 .9 2 2s-.9 2-2 2-2-.9-2-2 .9-2 2-2zm9 7h-6v13h-2v-6h-2v6H9V9H3V7h18v2z"/>
                    </svg>
                </div>
                <nav>
                    <ul className='navBar'>
                        <li className='navBar__item'>
                            <button className='navBar__btn'>
                                Карта прививок
                            </button>
                            </li>
                        <li className='navBar__item'>
                            <button className='navBar__btn'>
                                Календарь
                            </button>
                        </li>
                    </ul>
                </nav>
                <div>
                    <button className='navBar__btn'>Ваша семья</button>
                    {/* <ListUsers personsList={personsList}/> */}
                </div>
            </header>
            <section className='section'>
                <h1 className='srOnly'>Основная страница</h1>
                <div className='reccomendations'>
                    <h2>Рекомендации</h2>
                    <ul>
                        <li className='reccomItem'>
                            <h3>Против COVID-19</h3>
                            <p>Эффективность современных вакцин от коронавируса, по предварительным данным клинических испытаний, от 70 до 95%.
                            </p>
                            <button><img src='@' alt='user' /></button>
                        </li>
                        <li className='reccomItem'>
                            <h3>Против COVID-19</h3>
                            <p>Эффективность современных вакцин от коронавируса, по предварительным данным клинических испытаний, от 70 до 95%.
                            </p>
                            <button><img src='@' alt='user' /></button>
                        </li>
                    </ul>
                </div>
                <div className='userInfo'>
                    <h2>Личная карточка</h2>
                    <div className='userInfo__imgWrap'>
                        <img src='/' alt='пользователь'/>
                    </div>
                    <div>
                      <p>ФИО</p>  
                      <p>Email</p>    
                    </div>
                    <Link to='/authorization'>
                        <button className="entryBtn entryBtn_bg">Добавить пользователя</button>
                    </Link>
                </div>
            </section>
            <Link to='/authorization'>
                <button className='entryBtn'>Авторизоваться</button>
            </Link>
        </div>
    )
}