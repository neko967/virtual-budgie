import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["birdsaid"]

  birdSpeak() {
    const petId = this.data.get("pet-id");

    fetch(`/pets/${petId}/speak`)
      .then(response => response.json())
      .then(data => {
        if (data.words.length > 0) {
          const randomWord = data.words[Math.floor(Math.random() * data.words.length)];
          this.birdsaidTarget.textContent = randomWord;
        } else {
          this.birdsaidTarget.textContent = "言葉が見つかりませんでした";
        }
      })
      .catch(error => console.error('Error:', error));
  }
}
