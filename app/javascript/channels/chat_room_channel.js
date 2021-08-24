import consumer from "./consumer"

consumer.subscriptions.create("ChatRoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('connected');
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log('disconnected');
  },

  rejected: function () {
    console.log('rejected');
  },

  received(data) {
    console.log(data)
    let html;
    // JSでcookie取得の方法を検討する。current_userはJSで参照できないのでCookieを使用する
      // if (current_user.id === data.content_user_id){
        html = `
        <div class="my-message-content">
          <div class="my-message">
          ${data.content.content}
          </div>
        </div>
        `;
      // }
      if (data.user.image.url === null){
        html = `
        <div class="other-message-content">
          <div class="current_user_img">
            <img src="/assets/default.jpg" class="chat-default-image" >
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
              ${data.user.image.url}
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
