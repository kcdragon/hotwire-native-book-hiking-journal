# To deliver this notification:
#
# NewLikeNotifier.with(record: @post, message: "New post").deliver(User.all)

class NewLikeNotifier < ApplicationNotifier
  required_param :hike

  # Add your delivery methods
  #
  # deliver_by :email do |config|
  #   config.mailer = "UserMailer"
  #   config.method = "new_post"
  # end

  deliver_by :ios do |config|
    config.device_tokens = -> {
      recipient.notification_tokens.where(platform: :iOS).pluck(:token)
    }

    config.format = ->(apn) {
      apn.alert = "Someone liked your hike!"
      apn.custom_payload = {
        path: hike_path(params[:hike]),
      }
    }

    credentials = Rails.application.credentials.ios
    config.bundle_identifier = credentials.bundle_identifier
    config.key_id = credentials.key_id
    config.team_id = credentials.team_id
    config.apns_key = credentials.apns_key

    config.development = Rails.env.local?
  end

  # bulk_deliver_by :slack do |config|
  #   config.url = -> { Rails.application.credentials.slack_webhook_url }
  # end
  #
  # deliver_by :custom do |config|
  #   config.class = "MyDeliveryMethod"
  # end

  # Add required params
  #
  # required_param :message
end
