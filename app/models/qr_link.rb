class QrLink < ApplicationRecord
    include Rails.application.routes.url_helpers
    include QrLinksHelper

    def qr_png_url
        # Generates the PNG on the fly for us
        qrcode = RQRCode::QRCode.new(get_my_hostname + qr_link_resolve_path(self))
        png = qrcode.as_png(
            bit_depth: 1,
            border_modules: 4,
            color_mode: ChunkyPNG::COLOR_GRAYSCALE,
            color: "black",
            file: nil,
            fill: "white",
            module_px_size: 6,
            resize_exactly_to: false,
            resize_gte_to: false,
            size: 240
        ).to_data_url
    end

    def resolve_url
        get_my_hostname + qr_link_resolve_path(self)
    end
end
