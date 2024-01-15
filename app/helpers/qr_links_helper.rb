module QrLinksHelper
    def get_my_hostname
        Rails.env.production? ? "https://ccfciv-qr-generator.fly.dev" : "http://localhost:3000"
    end
end
