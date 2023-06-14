// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "controllers"

import { Confetti } from "stimulus-confetti"
application.register('confetti', Confetti)
