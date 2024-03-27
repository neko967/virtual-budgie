// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

import { Application } from "@hotwired/stimulus"
import TalkToBirdController from "./controllers/talk_to_bird_controller"

window.Stimulus = Application.start()
Stimulus.register("talk-to-bird", TalkToBirdController)
