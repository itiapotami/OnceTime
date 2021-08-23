import consumer from "./consumer"

consumer.subscriptions.create("ChatRoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    let html;
      if (current_user.id === data.content.user_id){
        html = `
        <div class="my-message-content">
          <div class="my-message">
          ${data.content.content}
          </div>
        </div>  
        `;
      }
      if (data.content.user.image === null){
        html = `
        <div class="other-message-content">
          <div class="current_user_img">
            <%= image_tag "/assets/default.jpg", class: 'chat-default-image' %>
          </div>
          <div class="other-message">
          ${data.content.content}
          </div>
        </div>
        `;
      }else{
        html = `
        <div class="other-message-content">
          <div class="current_user_img">
            ${data.content.user.img.url}
          </div>
          <div class="other-message">
          ${data.content.content}
          </div>
        </div>
        `;
      }
    const messages = document.getElementById('message');
    const newMessage = document.getElementById('chat_message_content');
    messages.insertAdjacentHTML('beforeend', html);
    newMessage.value='';
  
  }

  
});
