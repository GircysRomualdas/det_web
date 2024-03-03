import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  edit_name(event) {
    const cell = event.target
    const input = document.createElement("input")
    input.value = cell.textContent.trim()
    cell.textContent = ''
    cell.appendChild(input)
    input.focus()

    input.addEventListener("blur", () => {
      const newValue = input.value.trim()
      cell.textContent = newValue
      const detailId = cell.closest("tr").getAttribute("data-detail-id")

      fetch(`/detail_preps/${detailId}`, {
        method: "PATCH",
        headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        },
        body: JSON.stringify({ name: newValue })
      })
      .then(response => {
        if (!response.ok) {
        throw new Error('Network response was not ok');
        }
      })
      .catch(error => {
        console.error('There was a problem with your fetch operation:', error);
      })
    })
  }

  edit_comment(event) {
    const cell = event.target
    const input = document.createElement("input")
    input.value = cell.textContent.trim()
    cell.textContent = ''
    cell.appendChild(input)
    input.focus()

    input.addEventListener("blur", () => {
      const newValue = input.value.trim()
      cell.textContent = newValue
      const detailId = cell.closest("tr").getAttribute("data-detail-id")

      fetch(`/detail_preps/${detailId}`, {
        method: "PATCH",
        headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        },
        body: JSON.stringify({ comment: newValue })
      })
      .then(response => {
        if (!response.ok) {
        throw new Error('Network response was not ok');
        }
      })
      .catch(error => {
        console.error('There was a problem with your fetch operation:', error);
      })
    })
  }

  edit_quantity(event) {
    const cell = event.target
    const input = document.createElement("input")
    input.value = cell.textContent.trim()
    cell.textContent = ''
    cell.appendChild(input)
    input.focus()

    input.addEventListener("blur", () => {
      const newValue = input.value.trim()
      cell.textContent = newValue
      const detailId = cell.closest("tr").getAttribute("data-detail-id")

      fetch(`/detail_preps/${detailId}`, {
        method: "PATCH",
        headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        },
        body: JSON.stringify({ quantity: newValue })
      })
      .then(response => {
        if (!response.ok) {
        throw new Error('Network response was not ok');
        }
      })
      .catch(error => {
        console.error('There was a problem with your fetch operation:', error);
      })
    })
  }
}
