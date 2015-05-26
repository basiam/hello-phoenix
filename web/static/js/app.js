import {Socket} from "phoenix"

let chatInput         = $("#chat-input")
let messagesContainer = $("#messages")

let socket = new Socket("/ws")
socket.connect()
let chan = socket.chan("rooms:lobby", {})

chan.join().receive("ok", chan => {
    console.log("Welcome to Phoenix Chat!")
})

chan.on("new_msg", payload => {
    console.log("dupa1")
    messagesContainer.append(`<br/>[${Date()}] ${payload.body}`)
})


chatInput.on("keypress", event => {
  if(event.keyCode === 13){
    chan.push("new_msg", {body: chatInput.val()})
    chatInput.val("")
  }
})


