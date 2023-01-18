let current_movie_title = null
let current_hall_id = null
let trailer_id = null
let numFreePlaces = 48
let numTakenPlaces = 0
let numSelectedPlaces= 0
let total = 0
let reserved = []
let soldSeats = []
let lockSeats = false
let nameChecked
let phoneChecked

let movieTrailerids = {
    "The_Water_Diviner":'6Sj_4EcgROA',
    "Nowhere_Special":'hLTQxSyT3mc',
    "Inferno":'RH2BD49sEZI'
}

function playVideo(videoId) {
    var player = new YT.Player('youtube-video', {
        height: '360',
        width: '640',
        videoId: videoId,
        playerVars: {
            autoplay: 1,
            mute: 0,
          }
    });
    player.playVideo();
}
function clearAndRedisplayHall(hall){
    let container = document.getElementsByClassName("container")[0]
    if (container.hasChildNodes()) {
        while (container.lastChild) {
            container.removeChild(container.lastChild);
        }
        let screen = document.createElement("div")
        let video = document.createElement("div")
        screen.appendChild(video)
        video.setAttribute("id", "youtube-video")
        arrayOfTrailers = Object.keys(movieTrailerids).forEach(key =>{
            if (key == current_movie_title){
                trailer_id = movieTrailerids[key]
            }
        })
        screen.classList.add("screen")
        container.appendChild(screen)
        generateSeats(hall) 
        playVideo(trailer_id)
        
    }else{
        generateSeats(hall)
    }
    
}
function menuBar(){
    let menu = document.getElementsByClassName("hamburger-menu")[0]
    let slidingMenu = document.getElementsByClassName("sliding-navbar")[0]
    slidingMenu.classList.toggle("sliding-navbar--open")
    let mask = document.getElementsByClassName("mask")[0]
    mask.classList.toggle("show")
    let hamburger = document.getElementsByClassName("hamburger")[0]
    hamburger.classList.toggle("menu-opened")
    setTimeout(function(){
        hamburger.classList.toggle("hide-hamburger")
    },150)

    let btn = document.getElementById("cross")
    btn.addEventListener("click", function(){
        menuBar()
    })
}      
function jsonPrepare(obj){
    let body= JSON.stringify(obj);
    return body
}
function jsonUnpack(response){
    let body = JSON.parse(response);
    return body
}

function inputRequirements(){
    let name = document.getElementById("client-name").value
    let number = document.getElementById("phone-number").value
    nameChecked = checkNameSurname(name)
    phoneChecked = checkPhoneNumber(number)

    return nameChecked && phoneChecked ? true : false;
}

function checkPhoneNumber(input) {
    const pattern = /^\d{9}$/;
    return pattern.test(input);
}

function checkNameSurname(input) {
    const pattern = /^[a-zA-Z]{2,} [a-zA-Z]{2,}$/;
    return pattern.test(input);
}

async function sendForm(){
    if (inputRequirements()){
        nameChecked = undefined
        phoneChecked = undefined

        let number = document.getElementById("phone-number").value
        let fullName = document.getElementById("client-name").value
        let arrayFullName = fullName.split(" ")
        let name = arrayFullName[0]
        let surname = arrayFullName[1]
        let seats = reserved
        let data = {
            name: name,
            surname: surname,
            number: number,
            seats: seats,
            seatsLength: seats.length,
            hall_id: current_hall_id,
            movie_title:current_movie_title
        }
        await fetch("/reservation", {
            method:"POST",
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data),
            
        })
        .then(( response=>{
            console.log("ok")
            console.log("response", {response})
            getHall(current_movie_title,current_hall_id)
            reserved = []
            total = 0
        }))
        .catch((err =>{
            console.log(err);
        }))

    }else{
        
        if(!nameChecked){
            alert("Niepoprawne imię i nazwisko. Spróbuj ponownie")
        }else{
            alert("Niepoprawny numer telefonu. Spróbuj ponownie")
        }
        nameChecked = undefined
        phoneChecked = undefined
    }

}
function generateSeats(hall){
    numFreePlaces = 48
    numTakenPlaces = 0
    numSelectedPlaces= 0
    soldSeats = []
    document.getElementById("count").innerText = 0
    document.getElementById("total").innerText = 0
    document.getElementById("phone-number").value = ""
    document.getElementById("client-name").value = ""

    try {
        if (hall instanceof Object){
            Object.keys(hall).forEach(function(key) {
                console.log('key - ' + key + ' :: value - ' + hall[key]);
                if(Number(hall[key]) == 1){
                    soldSeats.push([key,hall[key]])
                }
            });
        }
    } catch (error) {
        console.log(error)
    }

    let container = document.getElementsByClassName("container")[0]
    price = document.getElementById("total")
    for (let y = 0; y < 6; y++) {
        let row = document.createElement("div")
        row.className= "row"
        for (let x = 0; x < 8; x++) {
            let seat = document.createElement("div")
            seat.className = "seat"
            seat.id = y*8 + x +1
            if (lockSeats) {
                seat.onclick = function(){
                    if(this.classList.contains("selected")){
                        this.classList.remove("selected")
                        numSelectedPlaces-=1
                        document.getElementById("count").innerText = numSelectedPlaces

                        if (current_hall_id ==1){
                            total -= 25
                        }else{
                            total -= 15
                        }
                        price.innerText = total
                        reserved.splice(reserved.indexOf(this.id), 1);
                    }else{
                        this.classList.add("selected")
                        numSelectedPlaces+=1
                        document.getElementById("count").innerText = numSelectedPlaces
                        if (current_hall_id ==1){
                            total += 25
                        }else{
                            total += 15
                        }
                        price.innerText = total
                        reserved.push(this.id)
                    }
                }
            }
        row.appendChild(seat)
    }
    container.appendChild(row)
    }

    for (let x = 0; x < soldSeats.length; x++) {
        let seat = document.getElementById(soldSeats[x][0])
        seat.classList.add("sold")
    }
    lockSeats = true
}
async function getHall(movie_title, hall_id){
    const data = {title: movie_title,hall: hall_id};
    current_movie_title = movie_title
    current_hall_id = hall_id
    await fetch('/hall', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
    })
    .then((response) => response.json())
    .then((data) => {
        clearAndRedisplayHall(data)
    })
    .catch((error) => {
        console.log(error)
    });
    
}

function generateMovies(data){
    let json = JSON.parse(data)
    let keys = []
    for (let x = 0; x < Object.keys(json).length; x++) {
        const key = Object.keys(json)[x];
        keys.push(key)
    }

    if (keys.length == 0){
        
    }else{  
        let navBar = document.getElementsByClassName("sliding-navbar")[0]
        const hall_type = ["VIP", "NORMAL"]
        for(let i=0;i<3;i++){
            let navBarItem = document.createElement("div")
            navBarItem.className = "navbar-item"
            let img = document.createElement("img")
            img.src = "img/" + keys[i] + ".jpg"
            navBarItem.appendChild(img)
            for (let j=1;j<3;j++){
                let label = document.createElement("label")
                let input = document.createElement("input")
                input.type = "radio"
                input.id = "hall_" + hall_type[j-1] + "_" + i
                input.name = "hall_type"
                input.addEventListener("click",()=>{
                    getHall(keys[i], j)
                    menuBar()
        
            })
                let span = document.createElement("span")
                span.innerText = hall_type[j-1].charAt(0).toUpperCase()+ hall_type[j-1].slice(1)
                label.appendChild(input)
                label.appendChild(span)
                navBarItem.appendChild(label)
                navBar.appendChild(navBarItem)
            }
        }
    }
}


