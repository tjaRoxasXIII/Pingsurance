// let myForm = document.getElementsByTagName("form")
// let modal = document.getElementsByTagName("modal")

// myForm[0].addEventListener("submit", (e) => {
//     e.preventDefault()
    
//     let formData = {
//         lead: {
//             "first_name": e.target[1].value,
//             "last_name": e.target[2].value,
//             "phone_number": e.target[3].value,
//             "message": e.target[4].value
//         }
//     }
//     fetch("http://localhost:3000/leads", {
//         method: 'POST',
//         headers: { 'Content-Type': "application/json"},
//         body:  JSON.stringify(formData)
//         })
        
// })