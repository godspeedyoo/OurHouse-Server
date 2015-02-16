module MessagesViewsHelper
  extend self

  def message_views(messages, user)
    all_messages = []
    messages.each do |message|
      parsed_message = JSON.parse(message.to_json)
      message.messages_users.each do |view|
        parsed_view = JSON.parse(view.to_json)
        parsed_message["view"] = parsed_view
        all_messages.push(parsed_message) if view.user.id == user.id
      end
    end
    all_messages
  end

end
