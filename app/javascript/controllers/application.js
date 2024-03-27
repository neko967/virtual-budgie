import { Application } from "@hotwired/stimulus"
import TalkToBirdController from "./talk_to_bird_controller"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

Stimulus.register("talk-to-bird", TalkToBirdController)
