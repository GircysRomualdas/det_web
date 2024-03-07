
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import { Turbo } from "@hotwired/turbo-rails"


Turbo.setConfirmMethod((message, element) => {
    let dialog = document.getElementById("turbo-confirm")
    dialog.querySelector("p").textContent = message
    dialog.showModal()

    return new Promise((resolve, reject) => {
        dialog.addEventListener("close", () => {
            resolve(dialog.returnValue == "confirm")
        }, {once: true})
    })
})
