import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="find-many-details"
export default class extends Controller {
  connect() {}
  close(e) {
    e.preventDefault();
    console.log("click close")
    const modal = document.getElementById("find_many_details_id");

    modal.innerHTML = "";
    modal.removeAttribute("src");
    modal.removeAttribute("complete");
  }
  find(e) {
      e.preventDefault();
      document.getElementById("findManyDetails").submit();
      const modal = document.getElementById("find_many_details_id");

      modal.innerHTML = "";
      modal.removeAttribute("src");
      modal.removeAttribute("complete");
  }
}
