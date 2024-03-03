
import { handleFlashMessages } from "./flash_helper";

export function handleUpdate(url, Id, body) {
    fetch(`/${url}/${Id}`, {
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
            return data;
        })
        .catch((error) => {
            console.error("There was a problem with your fetch operation:", error);
        });
}