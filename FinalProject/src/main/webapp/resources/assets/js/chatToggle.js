// Fixed Chat
const btn = document.querySelector(".chat");
const chatBox = document.querySelector(".chatBox");
const chatClose = document.querySelector(".chatClose");
const friendsMenuBtn = document.querySelector(".friendsMenuBtn");
const chatBox2 = document.querySelector(".chatBox2");

btn.addEventListener("click", () => {
  chatBox.classList.toggle("viewChat");
  if (chatBox2.classList.toggle("viewChat")) {
    chatBox2.classList.toggle("viewChat");
  }
});

chatClose.addEventListener("click", () => {
  chatBox.classList.toggle("viewChat");
  if (chatBox2.classList.toggle("viewChat")) {
    chatBox2.classList.toggle("viewChat");
  }
});

friendsMenuBtn.addEventListener("click", () => {
  chatBox2.classList.toggle("viewChat");
});

// chatList
const chatListToggle = document.querySelector(".chatListToggle");
const chatList = document.querySelector(".chatList");
const chatListUser = document.querySelectorAll(".chatList .chatList__User");

chatListToggle.addEventListener("click", () => {
  chatList.classList.toggle("viewChat");
});

chatListUser.forEach((user) => {
  user.addEventListener("click", () => {
    chatBox.classList.toggle("viewChat");
  });
});

// alarm

const alarmToggle = document.querySelector(".alarmToggle");
const alarmList = document.querySelector(".alarmList");

alarmToggle.addEventListener("click", () => {
  alarmList.classList.toggle("viewChat");
});
