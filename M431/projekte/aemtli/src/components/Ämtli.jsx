const DisplayWeather = ({hasWeather, weather}) => {
    if (hasWeather) {
        return (<img src={`https://openweathermap.org/img/wn/${weather.weather[0].icon}.png`}
                     alt={weather.weather[0].description}/>)
    } else {
        return null
    }
}
const Ämtli = ({ämtli, person, weather, ämtliDone: ämtliDone}) => {
    return (<p>Ämtli: {ämtli.description}, Wer: {person.name}, Wann: {ämtli.due.toDateString()}
            <DisplayWeather hasWeather={ämtli.weather} weather={weather}/>
            <button onClick={ämtliDone(ämtli.id)}>Done</button>
        </p>)
}

const DisplayÄmtli = ({ämtli, person, weather, ämtliDone: ämtliDone}) => {
    if (weather === null) {
        return <p>Waiting for weather data...</p>
    } else {
        return (<Ämtli ämtli={ämtli} person={person} weather={weather} ämtliDone={ämtliDone}/>)
    }
}
const Ämtlis = ({ämtlis, people, weather, ämtliDone}) => {
    return (<>
        {ämtlis.map(ämtli => {
            const thisPerson = people.find(person => person.id === ämtli.person)
            return (<DisplayÄmtli key={ämtli.id} ämtli={ämtli} person={thisPerson} weather={weather}
                                  ämtliDone={ämtliDone}/>)
        })}
    </>)
}

export default Ämtlis