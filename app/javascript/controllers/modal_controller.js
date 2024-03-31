import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["birdIdField"]

  open(event) {
    const birdId = event.currentTarget.getAttribute("data-bird-id");
    this.birdIdFieldTarget.value = birdId;
    const modal = document.getElementById("my_modal_2");
    modal.showModal();
  }
}