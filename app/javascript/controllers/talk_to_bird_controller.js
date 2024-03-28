import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["startStopBtn", "transcript", "resetBtn"]

  connect() {
    this.recognizing = false;
    this.finalTranscript = '';
    this.setupSpeechRecognition();
  }

  setupSpeechRecognition() {
    this.recognition = new (window.webkitSpeechRecognition || window.SpeechRecognition)();
    this.recognition.continuous = true;
    this.recognition.interimResults = true;
    this.recognition.lang = 'ja-JP';
    this.recognition.onstart = this.start.bind(this);
    this.recognition.onerror = this.error.bind(this);
    this.recognition.onend = this.end.bind(this);
    this.recognition.onresult = this.result.bind(this);
  }

  start() {
    this.recognizing = true;
    this.startStopBtnTarget.textContent = '言葉を覚えさせる';
    this.transcriptTarget.innerHTML = '';
    this.finalTranscript = '';
  }

  error(event) {
    console.error('Speech recognition error', event.error);
  }

  end() {
    this.recognizing = false;
    this.startStopBtnTarget.textContent = '話しかける';
    this.checkAndPostVocab();
  }

  result(event) {
    let interimTranscript = '';
    for (let i = event.resultIndex; i < event.results.length; ++i) {
      if (event.results[i].isFinal) {
        this.finalTranscript += event.results[i][0].transcript;
      } else {
        interimTranscript += event.results[i][0].transcript;
      }
    }
    this.transcriptTarget.innerHTML = this.finalTranscript + '<i style="color:#ddd;">' + interimTranscript + '</i>';
  }

  startStop() {
    if (this.recognizing) {
      this.recognition.stop();
      return;
    }
    this.recognition.start();
  }

  reset() {
    if (this.recognizing) {
      this.recognition.stop();
    }
    this.transcriptTarget.innerHTML = '';
    this.finalTranscript = '';
  }

  checkAndPostVocab() {
    if (this.finalTranscript !== '') {
      const petId = this.data.get("pet-id");

      fetch('/vocabs', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector("[name='csrf-token']").content
        },
        body: JSON.stringify({ vocab: { text: this.finalTranscript, pet_id: petId } })
      })
      .then(response => response.json())
      .then(data => console.log(data))
      .catch(error => console.error('Error:', error));
    }
  }
}
