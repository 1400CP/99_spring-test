<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif;
  }

  body {
      display: flex;
      background-color: #f9f9f9;
      min-height: 100vh;
  }

  /* 왼쪽 사이드바 */
  .sidebar {
      width: 95px;
      background-color: white;
      border-right: 1px solid #e1e1e1;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 20px 0;
  }

  .sidebar-logo {
      width: 50px;
      height: 50px;
      margin-bottom: 20px;
  }

  .sidebar-menu {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 25px;
      width: 100%;
  }

  .menu-item {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      width: 100%;
      padding: 10px 0;
      color: #888;
      font-size: 12px;
      text-decoration: none;
  }

  .menu-item.active {
      color: #4a8cff;
  }

  .menu-icon {
      font-size: 24px;
      margin-bottom: 5px;
  }

  /* 메시지 목록 사이드바 */
  .message-sidebar {
      width: 300px;
      background-color: white;
      border-right: 1px solid #e1e1e1;
      display: flex;
      flex-direction: column;
  }

  .message-header {
      padding: 20px;
      border-bottom: 1px solid #e1e1e1;
      font-size: 18px;
      font-weight: bold;
  }

  .message-tabs {
      display: flex;
      border-bottom: 1px solid #e1e1e1;
  }

  .tab {
      flex: 1;
      padding: 10px;
      text-align: center;
      background-color: #f5f5f5;
      cursor: pointer;
  }

  .tab.active {
      background-color: #4a8cff;
      color: white;
  }

  .message-list {
      overflow-y: auto;
      flex-grow: 1;
  }

  .message-item {
      padding: 15px;
      border-bottom: 1px solid #f1f1f1;
      display: flex;
      align-items: center;
      cursor: pointer;
  }

  .message-item:hover {
      background-color: #f9f9f9;
  }

  .message-item.active {
      background-color: #f0f7ff;
  }

  .profile-img {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      margin-right: 15px;
      overflow: hidden;
  }

  .profile-img img {
      width: 100%;
      height: 100%;
      object-fit: cover;
  }

  .message-info {
      flex-grow: 1;
  }

  .message-name {
      font-weight: bold;
      margin-bottom: 5px;
  }

  .message-preview {
      color: #666;
      font-size: 14px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
  }

  /* 메인 콘텐츠 영역 */
  .main-content {
      flex-grow: 1;
      display: flex;
      flex-direction: column;
      overflow: hidden;
      position: relative;
  }

  .chat-header {
      padding: 15px 20px;
      border-bottom: 1px solid #e1e1e1;
      display: flex;
      align-items: center;
      background-color: white;
  }

  .chat-profile {
      display: flex;
      align-items: center;
      flex-grow: 1;
  }

  .chat-profile-img {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      margin-right: 15px;
      overflow: hidden;
  }

  .chat-profile-img img {
      width: 100%;
      height: 100%;
      object-fit: cover;
  }

  .chat-actions {
      display: flex;
      gap: 15px;
  }

  .chat-action-btn {
      background: none;
      border: none;
      font-size: 18px;
      color: #777;
      cursor: pointer;
  }

  .chat-action-btn.active {
      color: #4a8cff;
  }

  .chat-messages {
      flex-grow: 1;
      overflow-y: auto;
      padding: 20px;
      background-color: #f5f5f5;
      display: flex;
      flex-direction: column;
      gap: 15px;
  }

  .message-bubble {
      max-width: 70%;
      padding: 12px 15px;
      border-radius: 18px;
      position: relative;
  }

  .message-bubble.received {
      align-self: flex-start;
      background-color: white;
      border: 1px solid #e1e1e1;
      border-bottom-left-radius: 4px;
  }

  .message-bubble.sent {
      align-self: flex-end;
      background-color: #4a8cff;
      color: white;
      border-bottom-right-radius: 4px;
  }

  .message-time {
      font-size: 12px;
      margin-top: 5px;
      color: #999;
  }

  .message-bubble.sent .message-time {
      color: rgba(255, 255, 255, 0.8);
  }

  .chat-attachment {
      max-width: 100%;
      border-radius: 12px;
      overflow: hidden;
      margin-top: 5px;
  }

  .chat-attachment img {
      max-width: 100%;
      display: block;
  }

  .chat-input-container {
      padding: 15px;
      background-color: white;
      border-top: 1px solid #e1e1e1;
      display: flex;
      align-items: center;
      gap: 10px;
  }

  .chat-input-actions {
      display: flex;
      gap: 15px;
  }

  .chat-input-btn {
      background: none;
      border: none;
      font-size: 20px;
      color: #777;
      cursor: pointer;
  }

  .chat-input {
      flex-grow: 1;
      border: 1px solid #e1e1e1;
      border-radius: 20px;
      padding: 10px 15px;
      resize: none;
      outline: none;
      max-height: 120px;
      overflow-y: auto;
  }

  .chat-send-btn {
      background-color: #4a8cff;
      color: white;
      border: none;
      border-radius: 50%;
      width: 40px;
      height: 40px;
      font-size: 20px;
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
  }

  /* 일방적인 추가 */
  .chat-message {
      display: flex;
      margin-bottom: 15px;
  }

  .chat-message.user {
      justify-content: flex-end;
  }

  .chat-bubble{
    max-width: 70%;
    padding: 12px;
    border-radius: 18px;
    word-break: break-word;
    position: relative;
    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
  }

  .chat-message .chat-bubble {
      align-self: flex-start;
      background-color: white;
      border: 1px solid #e1e1e1;
      border-bottom-left-radius: 4px;
  }

  .chat-message.user .chat-bubble {
      align-self: flex-end;
      background-color: #4a8cff;
      color: white;
      border-bottom-right-radius: 4px;
  }

  .chat-bubble.file {
      background-color: #f0f7ff;
      border: 1px solid #e1e1e1;
  }

  .chat-bubble.audio {
      width: 300px;
  }

  /* 메시지 입력 영역 */
  .chat-input-area {
      display: flex;
      align-items: center;
      padding: 15px;
      background-color: white;
      border-top: 1px solid #e1e1e1;
  }

  .chat-input-tools {
      display: flex;
      align-items: center;
      gap: 15px;
      margin-right: 10px;
  }

  .tool-button {
      width: 30px;
      height: 30px;
      display: flex;
      align-items: center;
      justify-content: center;
      background: none;
      border: none;
      cursor: pointer;
      color: #888;
      font-size: 20px;
  }

  .chat-input-field {
      flex-grow: 1;
      padding: 10px 15px;
      border: 1px solid #e1e1e1;
      border-radius: 20px;
      font-size: 14px;
      outline: none;
      resize: none;
      max-height: 100px;
      overflow-y: auto;
  }

  .chat-send-button {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      background-color: #4a8cff;
      border: none;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-left: 10px;
      cursor: pointer;
      color: white;
      font-size: 18px;
  }

  /* 우측 사이드바 */
  .right-sidebar {
      width: 300px;
      background-color: white;
      border-left: 1px solid #e1e1e1;
      display: none;
      flex-direction: column;
      overflow: hidden;
  }

  .right-sidebar.active {
      display: flex;
  }

  .right-sidebar-header {
      padding: 15px 20px;
      border-bottom: 1px solid #e1e1e1;
      display: flex;
      align-items: center;
      justify-content: space-between;
  }

  .right-sidebar-title {
      font-weight: bold;
  }

  .close-sidebar {
      background: none;
      border: none;
      font-size: 18px;
      cursor: pointer;
  }

  .right-sidebar-content {
      overflow-y: auto;
      flex-grow: 1;
  }

  .section-header {
      padding: 15px 20px;
      font-weight: bold;
      border-bottom: 1px solid #f1f1f1;
      background-color: #f9f9f9;
      display: flex;
      align-items: center;
      justify-content: space-between;
  }

  .section-toggle {
      font-size: 18px;
      cursor: pointer;
      transition: transform 0.3s;
  }

  .section-toggle.collapsed {
      transform: rotate(-90deg);
  }

  .member-list, .file-list {
      padding: 10px 0;
  }

  .member-item {
      padding: 10px 20px;
      display: flex;
      align-items: center;
      gap: 10px;
  }

  .member-info {
      flex-grow: 1;
  }

  .member-name {
      font-weight: bold;
  }

  .member-status {
      font-size: 12px;
      color: #888;
  }

  .add-member {
      padding: 10px 20px;
      color: #4a8cff;
      display: flex;
      align-items: center;
      gap: 10px;
      cursor: pointer;
  }

  .file-item {
      padding: 10px 20px;
      display: flex;
      gap: 10px;
      align-items: center;
      border-bottom: 1px solid #f1f1f1;
  }

  .file-icon {
      font-size: 20px;
      color: #4a8cff;
  }

  .file-info {
      flex-grow: 1;
  }

  .file-name {
      font-weight: bold;
      margin-bottom: 3px;
  }

  .file-meta {
      font-size: 12px;
      color: #888;
  }

  .file-download {
      color: #4a8cff;
      cursor: pointer;
  }

  .dropdown-menu {
      position: absolute;
      top: 40px;
      right: 10px;
      background-color: white;
      border: 1px solid #e1e1e1;
      border-radius: 4px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      z-index: 100;
      display: none;
  }

  .dropdown-menu.show {
      display: block;
  }

  .dropdown-item {
      padding: 12px 20px;
      cursor: pointer;
      white-space: nowrap;
  }

  .dropdown-item:hover {
      background-color: #f5f5f5;
  }

  .dropdown-divider {
      height: 1px;
      background-color: #e1e1e1;
  }

  /* 모든 헤더 높이 동일하게 (메시지/채팅/오른쪽 패널) */
  .message-header,
  .chat-header,
  .right-sidebar-header {
      height: 72px;
      min-height: 72px;
      display: flex;
      align-items: center;
      padding: 0 20px;
      background-color: white;
      border-bottom: 1px solid #e1e1e1;
  }

  /* 탭들도 수직 중앙 정렬로 높이 맞춤 */
  .message-tabs {
      height: 48px;
  }

  .tab {
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100%;
      font-size: 14px;
      border-right: 1px solid #e1e1e1;
  }

  .tab:last-child {
      border-right: none;
  }


  /* 모달 배경 */
  .modal {
    display: flex;
    justify-content: center;
    align-items: center;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.4);
  }

  /* 모달 숨기기 */
  .hidden {
    display: none;
  }

  /* 모달 콘텐츠 */
  .modal-content {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    width: 400px;
    max-height: 80%;
    overflow-y: auto;
    position: relative;
  }

  /* 닫기 버튼 */
  .close-button {
    position: absolute;
    right: 15px;
    top: 10px;
    font-size: 24px;
    cursor: pointer;
  }

</style>
</head>
<body>
  <!-- 왼쪽 사이드바 -->
  <div class="sidebar">
      <div class="sidebar-logo">
          <svg viewBox="0 0 24 24" fill="#4a8cff">
              <path d="M12,2C6.486,2,2,6.486,2,12s4.486,10,10,10s10-4.486,10-10S17.514,2,12,2z M12,20c-4.411,0-8-3.589-8-8s3.589-8,8-8 s8,3.589,8,8S16.411,20,12,20z"/>
              <path d="M13,7h-2v6h2V7z"/>
              <path d="M12,17L12,17c0.552,0,1-0.448,1-1v0c0-0.552-0.448-1-1-1h0c-0.552,0-1,0.448-1,1v0C11,16.552,11.448,17,12,17z"/>
          </svg>
      </div>
      <div class="sidebar-menu">
          <a href="#" class="menu-item">
              <div class="menu-icon">🏠</div>
              <div>홈</div>
          </a>
          <a href="#" class="menu-item active">
              <div class="menu-icon">💬</div>
              <div>채팅</div>
          </a>
          <a href="#" class="menu-item">
              <div class="menu-icon">👥</div>
              <div>팀</div>
          </a>
          <a href="#" class="menu-item">
              <div class="menu-icon">📅</div>
              <div>캘린더</div>
          </a>
          <a href="#" class="menu-item">
              <div class="menu-icon">🔔</div>
              <div>알림</div>
          </a>
      </div>
  </div>

  <!-- 메시지 목록 사이드바 -->
  <div class="message-sidebar" >
      <div class="message-header">Messages</div>
      <div class="message-tabs">
          <div class="tab active">All</div>
          <div class="tab">Group</div>
      </div>
      <div class="message-list">
          <div class="message-item active">
              <div class="profile-img">
                  <img src="https://via.placeholder.com/40/4a8cff/ffffff?text=팀" alt="프로필">
              </div>
              <div class="message-info">
                  <div class="message-name">집주인 첫째 딸</div>
                  <div class="message-preview">아 어디야</div>
              </div>
          </div>
          <div class="message-item">
              <div class="profile-img">
                  <img src="https://via.placeholder.com/40/ff4a8c/ffffff?text=여" alt="프로필">
              </div>
              <div class="message-info">
                  <div class="message-name">여자친구❤</div>
                  <div class="message-preview">어디야</div>
              </div>
          </div>
          <div class="message-item">
              <div class="profile-img">
                  <img src="https://via.placeholder.com/40/8cff4a/000000?text=집" alt="프로필">
              </div>
              <div class="message-info">
                  <div class="message-name">집주인</div>
                  <div class="message-preview">일마 오늘 맛있는거 사와</div>
              </div>
          </div>
          <div class="message-item">
              <div class="profile-img">
                  <img src="https://via.placeholder.com/40/ff8c4a/ffffff?text=F" alt="프로필">
              </div>
              <div class="message-info">
                  <div class="message-name">fire egg friend</div>
                  <div class="message-preview">야 근일님 ㄷㄷ ㄹㅇ</div>
              </div>
          </div>
          <div class="message-item">
              <div class="profile-img">
                  <img src="https://via.placeholder.com/40/4aff8c/000000?text=GD" alt="프로필">
              </div>
              <div class="message-info">
                  <div class="message-name">고명훈</div>
                  <div class="message-preview">일마 포샵 GD네 ㅋㅋ</div>
              </div>
          </div>
          <div class="message-item">
              <div class="profile-img">
                  <img src="https://via.placeholder.com/40/8c4aff/ffffff?text=AI" alt="프로필">
              </div>
              <div class="message-info">
                  <div class="message-name">스승님</div>
                  <div class="message-preview">아? 뭐 아? 하면 되는데 그걸 못해?</div>
              </div>
          </div>
          <div class="message-item">
              <div class="profile-img">
                  <img src="https://via.placeholder.com/40/4a8cff/ffffff?text=간" alt="프로필">
              </div>
              <div class="message-info">
                  <div class="message-name">간성훈</div>
                  <div class="message-preview">내 위에 바보</div>
              </div>
          </div>
          <div class="message-item">
              <div class="profile-img">
                  <img src="https://via.placeholder.com/40/ffd700/000000?text=새" alt="프로필">
              </div>
              <div class="message-info">
                  <div class="message-name">세미 프로젝트 조</div>
                  <div class="message-preview">이효석 : 나는 원래 잘생겼...</div>
              </div>
          </div>
      </div>
  </div>

  <!-- 메인 콘텐츠 - 채팅 부분 -->
  <div class="main-content">
      <div class="chat-header">
          <div class="chat-profile">
              <div class="chat-profile-img">
                  <img src="https://via.placeholder.com/40/4a8cff/ffffff?text=팀" alt="프로필">
              </div>
              <h3>집주인 첫째 딸</h3>
              <span style="margin-left: 10px; color: #888; font-size: 14px;">2 participants</span>
          </div>
          <div class="chat-actions">
              <button class="chat-action-btn">🔍</button>
              <button class="chat-action-btn" id="toggleRightSidebar">👥</button>
              <button class="chat-action-btn" id="toggleMenu">⋮</button>
          </div>
      </div>

      <div class="chat-messages" id="chatMessages">
          <div class="message-bubble received">
              <div>아 어디야</div>
              <div class="message-time">08:00</div>
          </div>
          
          <div class="message-bubble sent">
              <div>이거 어때? 밑에 브라켓과 담장 툴리 왜 망가남</div>
              <div class="chat-attachment">
                  <img src="https://via.placeholder.com/400x300/eee/888?text=가구+이미지" alt="가구 이미지">
              </div>
              <div class="message-time">1:12 PM</div>
          </div>
          
          <div class="message-bubble received">
              <div>너 연습돼 더 해야겠다. 저소스 혹시 못써니?</div>
              <div class="message-time">2:12 PM</div>
          </div>
          
          <div class="message-bubble sent">
              <div>그냥 갤러리 나눠지 괜찮, 이거나 고쳐봐봐</div>
              <div class="message-time">1:17 PM</div>
          </div>
          
          <div class="message-bubble received">
              <div>맞음레도 쉬버서 해야지 작식이 힘거니니아</div>
              <div class="message-time">2:12 PM</div>
          </div>
      </div>
      
      <div class="chat-input-container">
          <div class="chat-input-actions">
              <button class="chat-input-btn" id="imageButton">➕</button>
              <button class="chat-input-btn" id="fileButton">📎</button>
          </div>
          <input type="text" class="chat-input" id="messageInput" placeholder="Type a message...">
          <button class="chat-send-btn" id="sendButton">➤</button>
      </div>
  </div>

  <!-- 우측 사이드바 - 참가자 및 파일 목록 -->
  <div class="right-sidebar" id="rightSidebar">
      <div class="right-sidebar-header">
          <div class="right-sidebar-title">PEOPLE</div>
          <button class="close-sidebar" id="closeRightSidebar">✕</button>
      </div>
      
      <div class="right-sidebar-content">
          <div class="section-header">
              <div>Member <span>2</span></div>
              <div class="section-toggle">^</div>
          </div>
          
          <div class="member-list">
              <div class="member-item">
                  <div class="profile-img">
                      <img src="https://via.placeholder.com/40/8c4aff/ffffff?text=서" alt="프로필">
                  </div>
                  <div class="member-info">
                      <div class="member-name">서동진</div>
                      <div class="member-status">온라인</div>
                  </div>
              </div>
              
              <div class="member-item">
                  <div class="profile-img">
                      <img src="https://via.placeholder.com/40/4a8cff/ffffff?text=팀" alt="프로필">
                  </div>
                  <div class="member-info">
                      <div class="member-name">집주인 첫째 딸</div>
                      <div class="member-status">온라인</div>
                  </div>
              </div>
              
              <div class="add-member">
                  <div style="font-size: 20px;">+</div>
                  <div>Add</div>
              </div>
          </div>
          
          <div class="section-header">
              <div>디서함</div>
              <div class="section-toggle">^</div>
          </div>
          
          <div class="file-list">
              <div class="file-item">
                  <div class="file-icon">📄</div>
                  <div class="file-info">
                      <div class="file-name">자소서.pdf</div>
                      <div class="file-meta">120 kB</div>
                  </div>
                  <div class="file-download">⬇️</div>
              </div>
              
              <div class="file-item">
                  <div class="file-icon">📄</div>
                  <div class="file-info">
                      <div class="file-name">수정본.pdf</div>
                      <div class="file-meta">150 kB</div>
                  </div>
                  <div class="file-download">⬇️</div>
              </div>
          </div>
          
          <div class="section-header">
              <div>캘린더</div>
              <div class="section-toggle">^</div>
          </div>
          
          <div style="padding: 15px 20px;">
              <div style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                  <div style="font-weight: bold;">4.16</div>
                  <div style="font-size: 12px; color: #ff8c4a;">오늘</div>
              </div>
              <div style="background-color: #f5f5f5; padding: 10px; border-radius: 4px; margin-bottom: 15px;">
                  <div style="font-weight: bold;">물리 중간고사</div>
                  <div style="font-size: 12px; color: #888;">KH정보교육원 강남실험 1관</div>
              </div>
              
              <div style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                  <div style="font-weight: bold;">4.16</div>
                  <div style="font-size: 12px; color: #ff8c4a;">오늘</div>
              </div>
              <div style="background-color: #f5f5f5; padding: 10px; border-radius: 4px;">
                  <div style="font-weight: bold;">화학 중간고사</div>
                  <div style="font-size: 12px; color: #888;">KH정보교육원 강남실험 1관</div>
              </div>
          </div>
      </div>
  </div>

  <!-- 알람 모달 추가 -->
  <div id="alarmModal" class="modal hidden">
    <div class="modal-content">
      <span class="close-button" id="closeModal">&times;</span>
      <h2>알람</h2>
      <div id="alarmList">
        <!-- 알림 목록 들어가는 곳 -->
      </div>
    </div>
  </div>

<!-- 우측 하단 알람 팝업 컨테이너 -->
<div id="alarmPopupContainer" style="position: fixed; bottom: 20px; right: 20px; z-index: 1000;"></div>

  <script>
      document.addEventListener('DOMContentLoaded', function() {
          // 탭 전환 기능
          const tabs = document.querySelectorAll('.tab');
          tabs.forEach(tab => {
              tab.addEventListener('click', function() {
                  tabs.forEach(t => t.classList.remove('active'));
                  this.classList.add('active');
              });
          });

          // 메시지 항목 클릭 이벤트
          const messageItems = document.querySelectorAll('.message-item');
          messageItems.forEach(item => {
              item.addEventListener('click', function() {
                  messageItems.forEach(i => i.classList.remove('active'));
                  this.classList.add('active');
                  
                  // 메시지 선택 시 채팅 헤더 업데이트
                  const name = this.querySelector('.message-name').textContent;
                  document.querySelector('.chat-header h3').textContent = name;
                  
                  // 프로필 이미지도 업데이트
                  const profileImg = this.querySelector('.profile-img img').src;
                  document.querySelector('.chat-profile-img img').src = profileImg;
                    
                  // 대화 내용 초기화 (새로운 대화상대로 변경)
                  document.getElementById('chatMessages').innerHTML = '';
                  
                  // 초기 메시지 불러오기 - 실제로는 서버에서 가져와야 함
                  loadInitialMessages(name);
              });
          });

           // 초기 메시지 표시
           loadInitialMessages('집주인 첫째 딸');
            
            // 메시지 전송 기능
            const messageInput = document.getElementById('messageInput');
            const sendButton = document.getElementById('sendButton');
            const fileButton = document.getElementById('fileButton');
            const imageButton = document.getElementById('imageButton');
            
            // 메시지 전송 함수
            function sendMessage() {
                const messageText = messageInput.value.trim();
                if (messageText !== '') {
                    // 사용자 메시지 추가
                    addMessage('user', 'text', messageText);
                    
                    // 입력 필드 초기화
                    messageInput.value = '';
                    
                    // 자동 응답 (실제 서비스에서는 서버로 전송하고 응답을 받아야 함)
                    setTimeout(() => {
                        const responses = [
                            '알겠어요!',
                            '네, 확인했습니다.',
                            '그렇군요. 더 필요한 것이 있으신가요?',
                            '감사합니다.',
                            '조금만 기다려주세요.'
                        ];
                        const randomResponse = responses[Math.floor(Math.random() * responses.length)];
                        addMessage('owner', 'text', randomResponse);
                    }, 1000);
                }
            }
            
            // 전송 버튼 클릭 이벤트
            sendButton.addEventListener('click', sendMessage);
            
            // 엔터 키 입력 이벤트
            messageInput.addEventListener('keypress', function(e) {
                if (e.key === 'Enter' && !e.shiftKey) {
                    e.preventDefault(); // 폼 제출 방지
                    sendMessage();
                }
            });
            
            // 파일 첨부 기능
            fileButton.addEventListener('click', function() {
                // 실제로는 파일 선택 다이얼로그를 열고 파일을 선택하도록 해야 함
                // 여기서는 데모를 위해 가상의 파일을 첨부
                addMessage('user', 'file', { filename: '새문서.pdf', size: '250kB' });
                
                // 자동 응답
                setTimeout(() => {
                    addMessage('owner', 'text', '파일을 받았습니다. 확인해볼게요.');
                }, 1000);
            });
            
            // 이미지 첨부 기능
            imageButton.addEventListener('click', function() {
                // 실제로는 이미지 선택 다이얼로그를 열고 이미지를 선택하도록 해야 함
                // 여기서는 데모를 위해 가상의 이미지를 첨부
                addMessage('user', 'image', 'https://via.placeholder.com/300/cccccc/666666?text=이미지');
            });
        });
        
        // 초기 메시지 불러오기 함수
        function loadInitialMessages(contactName) {
            // 실제로는 서버에서 해당 대화상대와의 메시지 기록을 가져와야 함
            // 여기서는 데모를 위해 고정된 메시지 세트를 사용
            
            const messagesByContact = {
                '집주인 첫째 딸': [
                    { sender: 'owner', type: 'text', content: '이거 어때? 방에 놔두려고 답장 빨리 해' },
                    { sender: 'user', type: 'text', content: '그냥 깡패여 나쁘지 않네, 이거나 고쳐줘봐' },
                    { sender: 'user', type: 'file', filename: '자소서.pdf', size: '120kB' },
                    { sender: 'owner', type: 'file', filename: '수정본.pdf', size: '150kB' },
                    { sender: 'owner', type: 'text', content: '너 연습좀 더 해야겠다. 자소서 왜케 못쓰냐?' }
                ],
                '여자친구❤': [
                    { sender: 'owner', type: 'text', content: '어디야' },
                    { sender: 'user', type: 'text', content: '지금 가는 중' },
                    { sender: 'owner', type: 'text', content: '언제 오는데' },
                    { sender: 'user', type: 'text', content: '15분 뒤에' }
                ],
                '집주인': [
                    { sender: 'owner', type: 'text', content: '일마 오늘 맛있는거 사와' },
                    { sender: 'user', type: 'text', content: '네 무슨 음식 드시고 싶으세요?' },
                    { sender: 'owner', type: 'text', content: '치킨 사와' }
                ]
            };
            
            // 해당 대화상대의 메시지가 있으면 표시, 없으면 빈 대화
            const messages = messagesByContact[contactName] || [];
            messages.forEach(msg => {
                if (msg.type === 'text') {
                    addMessage(msg.sender, 'text', msg.content);
                } else if (msg.type === 'file') {
                    addMessage(msg.sender, 'file', { filename: msg.filename, size: msg.size });
                } else if (msg.type === 'image') {
                    addMessage(msg.sender, 'image', msg.content);
                } else if (msg.type === 'audio') {
                    addMessage(msg.sender, 'audio', msg.duration);
                }
            });
        }
        
        // 메시지 추가 함수
        function addMessage(sender, type, content) {
            const chatMessages = document.getElementById('chatMessages');
            const messageDiv = document.createElement('div');
            messageDiv.classList.add('chat-message');
            
            if (sender === 'user') {
                messageDiv.classList.add('user');
            }
            
            const bubble = document.createElement('div');
            bubble.classList.add('chat-bubble');
            
            if (type === 'text') {
                bubble.textContent = content;
            } else if (type === 'file') {
                bubble.classList.add('file');
                bubble.innerHTML = `
                    <strong>${content.filename}</strong><br>
                    <small>${content.size}</small>
                `;
            } else if (type === 'image') {
                bubble.innerHTML = `
                    <img src="${content}" alt="첨부 이미지" style="max-width: 200px; border-radius: 8px;">
                `;
            } else if (type === 'audio') {
                bubble.classList.add('audio');
                bubble.innerHTML = `
                    <audio controls style="width: 100%;">
                        <source src="#" type="audio/mpeg">
                        오디오를 지원하지 않는 브라우저입니다.
                    </audio>
                    <small>${content}</small>
                `;
            }
            
            messageDiv.appendChild(bubble);
            chatMessages.appendChild(messageDiv);
            
            // 스크롤을 맨 아래로 이동
            chatMessages.scrollTop = chatMessages.scrollHeight;
            
            // 메시지 미리보기 업데이트 (나중에 선택한 대화상대의 미리보기만 업데이트하도록 수정 필요)
            if (type === 'text' && sender === 'user') {
                updateMessagePreview(document.querySelector('.message-item.active'), content);
            }
        }
        
        // 메시지 미리보기 업데이트 함수
        function updateMessagePreview(messageItem, previewText) {
            if (messageItem) {
                const previewElement = messageItem.querySelector('.message-preview');
                if (previewElement) {
                    previewElement.textContent = previewText;
                }
            }
        }

        // 우측 사이드바 토글
        const toggleRightSidebar = document.getElementById('toggleRightSidebar');
        const rightSidebar = document.getElementById('rightSidebar');
        const closeRightSidebar = document.getElementById('closeRightSidebar');
        
        toggleRightSidebar.addEventListener('click', function() {
            rightSidebar.classList.toggle('active');
            toggleRightSidebar.classList.toggle('active');
        });
        
        closeRightSidebar.addEventListener('click', function() {
            rightSidebar.classList.remove('active');
            toggleRightSidebar.classList.remove('active');
        });
        
        // 드롭다운 메뉴 토글
        const toggleMenu = document.getElementById('toggleMenu');
        
        toggleMenu.addEventListener('click', function(e) {
            e.stopPropagation();
            rightSidebar.classList.add('active');
        });

        document.addEventListener('DOMContentLoaded', function() {
            
            // 알람 메뉴 클릭하면 모달 열기
            const alarmMenu = document.querySelector('.menu-item:nth-child(5)'); // 알림 메뉴 5번째
            const alarmModal = document.getElementById('alarmModal');
            const closeModalBtn = document.getElementById('closeModal');

            alarmMenu.addEventListener('click', function() {
                alarmModal.classList.remove('hidden');
                loadAlarms();
            });

            closeModalBtn.addEventListener('click', function() {
                alarmModal.classList.add('hidden');
            });

            // 모달 밖 클릭 시 닫기
            window.addEventListener('click', function(event) {
                if (event.target === alarmModal) {
                    alarmModal.classList.add('hidden');
                }
            });

            // 알람 데이터 로딩 함수
            function loadAlarms() {
                const alarmList = document.getElementById('alarmList');
                alarmList.innerHTML = '';

                // 샘플 알람 데이터
                const alarms = [
                    { message: '새로운 메시지가 도착했습니다.', time: '5분 전' },
                    { message: '팀 초대 요청이 있습니다.', time: '10분 전' },
                    { message: '파일 업로드 완료.', time: '30분 전' },
                ];

                alarms.forEach(alarm => {
                    const alarmItem = document.createElement('div');
                    alarmItem.style.padding = '10px 0';
                    alarmItem.style.borderBottom = '1px solid #eee';
                    alarmItem.innerHTML = `<div style="font-weight:bold;">${alarm.message}</div><div style="font-size:12px; color:#888;">${alarm.time}</div>`;
                    alarmList.appendChild(alarmItem);
                });
            }
        });

        // 알람 팝업 관련 함수들
        function showAlarmPopup(title, message, duration = 5000) {
            const container = document.getElementById('alarmPopupContainer');
            
            // 알람 팝업 요소 생성
            const popup = document.createElement('div');
            popup.style.backgroundColor = 'white';
            popup.style.border = '1px solid #ddd';
            popup.style.borderRadius = '8px';
            popup.style.boxShadow = '0 2px 10px rgba(0,0,0,0.1)';
            popup.style.padding = '15px';
            popup.style.marginBottom = '10px';
            popup.style.width = '300px';
            popup.style.position = 'relative';
            popup.style.animation = 'fadeIn 0.3s';
            
            // 알람 내용 생성
            popup.innerHTML = `
                <div style="display: flex; align-items: flex-start;">
                    <img src="https://via.placeholder.com/40/4a8cff/ffffff?text=알" alt="알람" style="border-radius: 50%; margin-right: 10px;">
                    <div style="flex-grow: 1;">
                        <div style="font-weight: bold; margin-bottom: 5px;">${title}</div>
                        <div style="color: #555; font-size: 14px;">${message}</div>
                    </div>
                    <button style="background: none; border: none; cursor: pointer; font-size: 16px; color: #999;" onclick="this.parentNode.parentNode.remove()">×</button>
                </div>
            `;
            
            // 팝업을 컨테이너에 추가
            container.appendChild(popup);
            
            // 지정된 시간 후 자동으로 사라지게 함
            setTimeout(() => {
                popup.style.animation = 'fadeOut 0.3s';
                setTimeout(() => {
                    if (popup.parentNode === container) {
                        container.removeChild(popup);
                    }
                }, 300);
            }, duration);
        }

        // 애니메이션을 위한 스타일 추가
        const style = document.createElement('style');
        style.textContent = `
            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(20px); }
                to { opacity: 1; transform: translateY(0); }
            }
            
            @keyframes fadeOut {
                from { opacity: 1; transform: translateY(0); }
                to { opacity: 0; transform: translateY(20px); }
            }
        `;
        document.head.appendChild(style);

        // 기존 함수 오버라이드 및 이벤트 연결
        document.addEventListener('DOMContentLoaded', function() {
            // 메시지 추가 함수 오버라이드
            const originalAddMessage = window.addMessage;
            window.addMessage = function(sender, type, content) {
                // 원래 함수 호출
                originalAddMessage.apply(this, arguments);
                
                // user가 메시지를 보낼 때만 알람 표시
                if (sender === 'user') {
                    const currentChatName = document.querySelector('.chat-header h3').textContent;
                    
                    if (type === 'text') {
                        // 텍스트 메시지인 경우
                        showAlarmPopup(currentChatName, content.length > 30 ? content.substring(0, 30) + '...' : content);
                    } else if (type === 'file') {
                        // 파일인 경우
                        showAlarmPopup(currentChatName, `${content.filename} 파일을 보냈습니다.`);
                    } else if (type === 'image') {
                        // 이미지인 경우
                        showAlarmPopup(currentChatName, '이미지를 보냈습니다.');
                    } else if (type === 'audio') {
                        // 오디오인 경우
                        showAlarmPopup(currentChatName, '음성 메시지를 보냈습니다.');
                    }
                }
            };
            
            // 기존 이벤트 리스너는 유지 (addMessage 함수만 확장)
        });
    // 이벤트 연결
    document.addEventListener('DOMContentLoaded', function() {
        // 기존 코드 유지...
        
        // 메시지 전송 시 알람 예시 추가
        const originalSendMessage = window.sendMessage || function(){};
        window.sendMessage = function() {
            const result = originalSendMessage.apply(this, arguments);
            
            // 임의의 시간 후에 알람 표시 (데모 목적)
            setTimeout(() => {
                const selectedName = document.querySelector('.chat-header h3').textContent;
                notifyNewMessage(selectedName, '새 메시지가 도착했습니다.');
            }, 3000);
            
            return result;
        };
        
        // 파일 버튼 클릭 시 알람 예시 추가
        const fileButton = document.getElementById('fileButton');
        const originalFileButtonClick = fileButton.onclick;
        fileButton.onclick = function() {
            if (originalFileButtonClick) originalFileButtonClick.apply(this, arguments);
            
            // 임의의 시간 후에 알람 표시 (데모 목적)
            setTimeout(() => {
                notifyFileUpload('새문서.pdf');
            }, 2000);
        };
        
        // 예시 알람 트리거 버튼 추가 (테스트용)
        const chatInputActions = document.querySelector('.chat-input-actions');
        const testAlarmButton = document.createElement('button');
        testAlarmButton.className = 'chat-input-btn';
        testAlarmButton.id = 'testAlarmButton';
        testAlarmButton.innerHTML = '🔔';
        testAlarmButton.title = '테스트 알람';
        testAlarmButton.onclick = function() {
            showAlarmPopup('집주인 첫째 딸', '저를 어떻게 사랑하나요?\n만들부터 제대로 알 것 같아요...');
        };
        chatInputActions.appendChild(testAlarmButton);
    });
  </script>
</body>
</html>