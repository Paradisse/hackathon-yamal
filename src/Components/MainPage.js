import React, { useState } from 'react'
import ListUsers from './ListUsers'
import UserCard from './UserCard'
import { Link } from 'react-router-dom'
import axios from 'axios'

export default function MainPage({ person }) {

    return (

        <div className='wrapper'>
            <header className='header'>
                <div>
                    <img src='/icons/logo.png' alt='логотип' width='100%' height='100%'/>
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
                <UserCard person={person} />
            </section>
            <Link to='/authorization'>
                <button className='entryBtn'>Авторизоваться</button>
            </Link>
        </div>
    )
}