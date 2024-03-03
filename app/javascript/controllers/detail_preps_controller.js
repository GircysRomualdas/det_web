import { Controller } from "@hotwired/stimulus"
import { handleEditField } from "../helpers/edit_field_helper";

export default class extends Controller {
    edit_name(event) {
        handleEditField(event, "name", "detail_preps");
    }

    edit_comment(event) {
        handleEditField(event, "comment", "detail_preps");
    }

    edit_quantity(event) {
        handleEditField(event, "quantity", "detail_preps");
    }
}
