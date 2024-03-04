document.addEventListener("turbo:load", function() {
  const speechRecognitionElement = document.getElementById('speech-recognition');
  const startStopBtn = document.getElementById('start-stop-btn');
  const transcriptDiv = document.getElementById('transcript');
  let recognizing = false;
  let finalTranscript = '';
  const petId = speechRecognitionElement.getAttribute('data-pet-id');

  // Web Speech APIの音声認識インスタンスを作成
  const recognition = new webkitSpeechRecognition() || new SpeechRecognition();
  recognition.continuous = true; // 連続的に認識
  recognition.interimResults = true; // 中間結果も表示
  recognition.lang = 'ja-JP'; // 言語設定

  recognition.onstart = function() {
    recognizing = true;
    startStopBtn.textContent = '話すのをやめる';
    transcriptDiv.innerHTML = '';
    finalTranscript = '';
  };

  recognition.onerror = function(event) {
    console.error('Speech recognition error', event.error);
  };

  recognition.onend = function() {
    recognizing = false;
    startStopBtn.textContent = '話しかける';
  };
  
  recognition.onresult = function(event) {
    let interimTranscript = '';
    for (let i = event.resultIndex; i < event.results.length; ++i) {
      if (event.results[i].isFinal) {
        finalTranscript += event.results[i][0].transcript;
      } else {
        interimTranscript += event.results[i][0].transcript;
      }
    }
    transcriptDiv.innerHTML = finalTranscript + '<i style="color:#ddd;">' + interimTranscript + '</i>';
  };

  startStopBtn.addEventListener('click', () => {
    if (recognizing) {
      recognition.stop();
      return;
    }
    recognition.start();
  });

  recognition.onend = function() {
    recognizing = false;
    startStopBtn.textContent = '話しかける';

    // ここからAjaxでRailsのcreateアクションに送信
    if (finalTranscript !== '') {
      fetch('/words', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector("[name='csrf-token']").content
        },
        body: JSON.stringify({ word: { content: finalTranscript, pet_id: petId } })
      })
      .then(response => response.json())
      .then(data => console.log(data))
      .catch((error) => console.error('Error:', error));
    }
  };
});

