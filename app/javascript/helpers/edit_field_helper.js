
import { handleUpdate } from "./ajax_helper";

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
        const Id = cell.closest("tr").getAttribute("data-detail-id");
        const body = {};
        body[fieldName] = newValue;

        data = handleUpdate(url, Id, body);

        if (!data.success) {
            cell.textContent = oldValue;
        }
    });
}
