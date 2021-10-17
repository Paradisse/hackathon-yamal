import React from 'react'

function ListUsers ({ personsList }) {
    return (
        <ul>
            {personsList.map(item => <li>{item.surname}</li>)}
        </ul>
    )
}

export default ListUsers