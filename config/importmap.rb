# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "stimulus-confetti", to: "https://cdn.jsdelivr.net/npm/stimulus-confetti@1.0.1/+esm"
pin_all_from "app/javascript/controllers", under: "controllers"
