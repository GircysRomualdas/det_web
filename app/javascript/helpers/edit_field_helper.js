import { handleFlashMessages } from "./flash_helper";

export function handleEditField(event, fieldName, url) {
    const cell = event.target;
    const input = document.createElement("input");
    input.value = cell.textContent.trim();
    const oldValue = cell.textContent.trim();
    cell.textContent = "";
    cell.appendChild(input);
    input.focus();

    input.addEventListener("blur", () => {
        const newValue = input.value.trim();
        cell.textContent = newValue;
        const detailId = cell.closest("tr").getAttribute("data-detail-id");
        const body = {};
        body[fieldName] = newValue;

        fetch(`/${url}/${detailId}`, {
            method: "PATCH",
            headers: {
                "Content-Type": "application/json",
                "X-CSRF-Token": document
                    .querySelector('meta[name="csrf-token"]')
                    .getAttribute("content"),
            },
            body: JSON.stringify(body),
        })
            .then((response) => response.json())
            .then((data) => {
                handleFlashMessages(data);
                if (!data.success) {
                    cell.textContent = oldValue;
                }
            })
            .catch((error) => {
                console.error("There was a problem with your fetch operation:", error);
            });
    });
}
