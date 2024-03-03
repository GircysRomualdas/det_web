
export function handleFlashMessages(data) {
    const flashDiv = document.querySelector("#flash-messages");
    flashDiv.innerHTML = "";
    const flash = data.success ? "success" : "danger";

    Object.keys(data.flash).forEach(key => {
        const message = data.flash[key];
        const div = document.createElement("div");
        div.classList.add(`alert`, `alert-${flash}`);
        div.textContent = message;
        flashDiv.appendChild(div);
    });
}
