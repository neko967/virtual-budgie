// app/javascript/controllers/bird_speak_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["birdsaid"]

  birdSpeak() {
    const petId = this.data.get("pet-id");

    fetch(`/pets/${petId}/speak`)
      .then(response => response.json())
      .then(data => {
        if (data.vocabs.length > 0) {
          this.displayRandomPhrase(data.vocabs);
        } else {
          this.birdsaidTarget.textContent = "言葉を覚えていません";
        }
      })
      .catch(error => console.error('Error:', error));
  }

  displayRandomPhrase(words) {
    let selectedWords = [];
    while (selectedWords.length < 3 && words.length > 0) {
      let index = Math.floor(Math.random() * words.length);
      selectedWords.push(words[index]);
      words.splice(index, 1);
    }
    this.birdsaidTarget.textContent = selectedWords.join(' ');
  }
}
