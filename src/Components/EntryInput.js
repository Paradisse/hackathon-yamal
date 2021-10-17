import React from 'react'

function EntryInput({ changeValue, value, setValue, placeHolder}) {
    return (
        <input 
            value={value} 
            onChange={e => changeValue(setValue, e)}
            className='entryInput' 
            placeholder={placeHolder}
        >    
        </input>
    )
}

export default EntryInput