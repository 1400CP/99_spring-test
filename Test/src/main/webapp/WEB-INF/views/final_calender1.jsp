<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>메시지 및 캘린더</title>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
    }
    
    body {
      background-color: #f5f5f5;
      color: #333;
      display: flex;
      overflow: hidden;
      height: 100vh;
    }
    
    /* 사이드바 스타일 */
    .sidebar {
      width: 80px;
      background-color: #fff;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 20px 0;
      box-shadow: 1px 0 5px rgba(0,0,0,0.05);
      border-right: 1px solid #eee;
      z-index: 10;
    }
    
    .sidebar-item {
      display: flex;
      flex-direction: column;
      align-items: center;
      width: 100%;
      padding: 16px 0;
      cursor: pointer;
      color: #666;
    }
    
    .sidebar-item svg {
      width: 24px;
      height: 24px;
      margin-bottom: 4px;
    }
    
    .sidebar-item span {
      font-size: 12px;
    }
    
    .sidebar-item.active {
      color: #0078d4;
    }
    
    /* 채팅 목록 스타일 */
    .chat-list-container {
      width: 300px;
      background-color: #fff;
      border-right: 1px solid #eee;
      display: flex;
      flex-direction: column;
      overflow: hidden;
    }
    
    .chat-list-header {
      padding: 16px;
      border-bottom: 1px solid #eee;
    }
    
    .chat-list-title {
      font-size: 20px;
      font-weight: bold;
    }
    
    .tab-container {
      display: flex;
      border-bottom: 1px solid #eee;
    }
    
    .tab {
      flex: 1;
      padding: 12px;
      text-align: center;
      cursor: pointer;
      background-color: #f8f8f8;
    }
    
    .tab.active {
      background-color: #0078d4;
      color: white;
    }
    
    .chat-list {
      flex: 1;
      overflow-y: auto;
    }
    
    .chat-item {
      display: flex;
      padding: 16px;
      border-bottom: 1px solid #f5f5f5;
      cursor: pointer;
      transition: background-color 0.2s;
    }
    
    .chat-item:hover {
      background-color: #f9f9f9;
    }
    
    .chat-item.active {
      background-color: #f0f7ff;
    }
    
    .profile-image {
      width: 48px;
      height: 48px;
      border-radius: 50%;
      margin-right: 12px;
      background-color: #f0f0f0;
      display: flex;
      justify-content: center;
      align-items: center;
      overflow: hidden;
    }
    
    .profile-image img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
    
    .profile-initial {
      width: 48px;
      height: 48px;
      border-radius: 50%;
      margin-right: 12px;
      color: white;
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 20px;
      font-weight: bold;
    }
    
    .chat-content {
      flex-grow: 1;
    }
    
    .chat-name {
      font-weight: bold;
      margin-bottom: 4px;
    }
    
    .chat-preview {
      color: #666;
      font-size: 14px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }
    
    .chat-time {
      color: #888;
      font-size: 12px;
      white-space: nowrap;
      margin-left: 8px;
    }
    
    .badge {
      background-color: #ff4081;
      color: white;
      width: 20px;
      height: 20px;
      border-radius: 50%;
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 12px;
      margin-left: 8px;
    }
    
    /* 메인 콘텐츠 스타일 */
    .main-content {
      flex: 1;
      display: flex;
      flex-direction: column;
      overflow: hidden;
      background-color: #fff;
    }
    
    .main-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 16px;
      border-bottom: 1px solid #eee;
    }
    
    .group-info {
      display: flex;
      align-items: center;
    }
    
    .group-image {
      width: 48px;
      height: 48px;
      border-radius: 50%;
      margin-right: 12px;
    }
    
    .group-name {
      font-size: 18px;
      font-weight: bold;
    }
    
    .group-count {
      color: #666;
      font-size: 14px;
      margin-left: 8px;
    }
    
    .header-actions {
      display: flex;
      align-items: center;
    }
    
    .header-button {
      background: none;
      border: none;
      cursor: pointer;
      margin-left: 16px;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    
    .header-button svg {
      width: 24px;
      height: 24px;
    }
    
    .create-event-button {
      border: 1px solid #ddd;
      border-radius: 4px;
      padding: 8px 16px;
      background-color: #fff;
      cursor: pointer;
      margin-left: 16px;
    }
    
    /* 캘린더 콘텐츠 스타일 */
    .calendar-content {
      flex: 1;
      overflow-y: auto;
      padding: 0;
    }
    
    .month-header {
      padding: 16px;
      font-size: 16px;
      color: #666;
      border-bottom: 1px solid #eee;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    
    .month-title {
      font-weight: bold;
    }
    
    .month-tabs {
      display: flex;
    }
    
    .month-tab {
      padding: 6px 12px;
      margin-left: 8px;
      cursor: pointer;
      border-radius: 4px;
    }
    
    .month-tab.active {
      background-color: #f0f0f0;
    }
    
    .calendar-events {
      padding-bottom: 20px;
    }
    
    .calendar-event {
      display: flex;
      padding: 16px;
      border-bottom: 1px solid #f5f5f5;
    }
    
    .event-date {
      display: flex;
      flex-direction: column;
      align-items: center;
      margin-right: 20px;
      width: 50px;
    }
    
    .event-date-number {
      font-size: 24px;
      font-weight: bold;
    }
    
    .event-date-day {
      color: #ff6b6b;
      font-size: 14px;
    }
    
    .event-details {
      flex-grow: 1;
      display: flex;
      flex-direction: column;
    }
    
    .event-indicator {
      width: 20px;
      height: 20px;
      border-radius: 50%;
      background-color: #6f42c1;
      margin-right: 10px;
    }
    
    .event-header {
      display: flex;
      align-items: center;
    }
    
    .event-title {
      font-weight: bold;
      margin-bottom: 5px;
    }
    
    .event-location {
      color: #666;
      font-size: 14px;
      margin-bottom: 5px;
    }
    
    .event-time {
      color: #888;
      font-size: 14px;
    }
    
    .event-actions {
      display: flex;
      align-items: center;
    }
    
    .attendance-dropdown {
      position: relative;
    }
    
    .attendance-select {
      padding: 8px 16px;
      border: 1px solid #ddd;
      border-radius: 4px;
      background-color: #fff;
      cursor: pointer;
      min-width: 100px;
      appearance: none;
      -webkit-appearance: none;
      -moz-appearance: none;
      text-align: center;
      position: relative;
    }
    
    .dropdown-arrow {
      position: absolute;
      right: 10px;
      top: 50%;
      transform: translateY(-50%);
      pointer-events: none;
    }
    
    /* 드롭다운 메뉴 스타일 */
    .dropdown-menu {
      position: absolute;
      top: 100%;
      right: 0;
      background-color: #fff;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      border-radius: 4px;
      width: 120px;
      z-index: 1000;
      display: none;
    }
    
    .dropdown-menu.active {
      display: block;
    }
    
    .dropdown-item {
      padding: 10px 16px;
      cursor: pointer;
      transition: background-color 0.2s;
    }
    
    .dropdown-item:hover {
      background-color: #f8f8f8;
    }
    
    /* 호버 메뉴 */
    .hover-menu {
      position: absolute;
      background-color: #fff;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      border-radius: 4px;
      padding: 8px 0;
      min-width: 120px;
      z-index: 1000;
      display: none;
    }
    
    .hover-menu.active {
      display: block;
    }
    
    .hover-item {
      padding: 8px 16px;
      cursor: pointer;
      white-space: nowrap;
    }
    
    .hover-item:hover {
      background-color: #f8f8f8;
    }
  </style>
</head>
<body>
  <!-- 왼쪽 사이드바 -->
  <div class="sidebar">
    <div class="sidebar-item active">
      <svg viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
        <path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z"/>
      </svg>
      <span>홈</span>
    </div>
    <div class="sidebar-item">
      <svg viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
        <path d="M20 2H4c-1.1 0-1.99.9-1.99 2L2 22l4-4h14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm-2 12H6v-2h12v2zm0-3H6V9h12v2zm0-3H6V6h12v2z"/>
      </svg>
      <span>채팅</span>
    </div>
    <div class="sidebar-item">
      <svg viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
        <path d="M19 3h-4.18C14.4 1.84 13.3 1 12 1c-1.3 0-2.4.84-2.82 2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-7 0c.55 0 1 .45 1 1s-.45 1-1 1-1-.45-1-1 .45-1 1-1zm2 14H7v-2h7v2zm3-4H7v-2h10v2zm0-4H7V7h10v2z"/>
      </svg>
      <span>타임라인</span>
    </div>
    <div class="sidebar-item">
      <svg viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
        <path d="M19 3h-1V1h-2v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 16H5V8h14v11zM7 10h5v5H7z"/>
      </svg>
      <span>캘린더</span>
    </div>
    <div class="sidebar-item">
      <svg viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
        <path d="M12 22c1.1 0 2-.9 2-2h-4c0 1.1.89 2 2 2zm6-6v-5c0-3.07-1.64-5.64-4.5-6.32V4c0-.83-.67-1.5-1.5-1.5s-1.5.67-1.5 1.5v.68C7.63 5.36 6 7.92 6 11v5l-2 2v1h16v-1l-2-2z"/>
      </svg>
      <span>알림</span>
    </div>
  </div>
  
  <!-- 채팅 목록 -->
  <div class="chat-list-container">
    <div class="chat-list-header">
      <h1 class="chat-list-title">Messages</h1>
    </div>
    
    <div class="tab-container">
      <div class="tab active" id="tab-all">All</div>
      <div class="tab" id="tab-group">Group</div>
    </div>
    
    <div class="chat-list">
      <div class="chat-item active">
        <div class="profile-image">
          <img src="/api/placeholder/48/48" alt="Group profile">
        </div>
        <div class="chat-content">
          <div class="chat-name">집주인 첫째 딸</div>
          <div class="chat-preview">아 어디야</div>
        </div>
        <div class="chat-time">08:00</div>
      </div>
      
      <div class="chat-item">
        <div class="profile-initial" style="background-color: #9c27b0;">
          <span>여</span>
        </div>
        <div class="chat-content">
          <div class="chat-name">여자친구❤</div>
          <div class="chat-preview">어디야</div>
        </div>
        <div class="chat-time">June 1st</div>
        <div class="badge">1</div>
      </div>
      
      <div class="chat-item">
        <div class="profile-image">
          <img src="/api/placeholder/48/48" alt="Profile">
        </div>
        <div class="chat-content">
          <div class="chat-name">집주인</div>
          <div class="chat-preview">알마 오늘 맞았느냐 사실</div>
        </div>
        <div class="chat-time">May 26th</div>
      </div>
      
      <div class="chat-item">
        <div class="profile-initial" style="background-color: #f44336;">
          <span>F</span>
        </div>
        <div class="chat-content">
          <div class="chat-name">fire egg friend</div>
          <div class="chat-preview">아 큰일남 ㄷㄷ ㄹㅇ</div>
        </div>
        <div class="chat-time">May 25th</div>
        <div class="badge">6</div>
      </div>
      
      <div class="chat-item">
        <div class="profile-initial" style="background-color: #2196f3;">
          <span>GD</span>
        </div>
        <div class="chat-content">
          <div class="chat-name">고명훈</div>
          <div class="chat-preview">알마 표사 GD네 ㅋㅋ</div>
        </div>
        <div class="chat-time">May 19th</div>
      </div>
      
      <div class="chat-item">
        <div class="profile-initial" style="background-color: #00bcd4;">
          <span>SI</span>
        </div>
        <div class="chat-content">
          <div class="chat-name">스승님</div>
          <div class="chat-preview">야? 먹 야? 히먼 되는데 그걸 못해?</div>
        </div>
        <div class="chat-time">May 15th</div>
      </div>
      
      <div class="chat-item">
        <div class="profile-initial" style="background-color: #4caf50;">
          <span>김</span>
        </div>
        <div class="chat-content">
          <div class="chat-name">김성훈</div>
          <div class="chat-preview">내 취이 바보</div>
        </div>
        <div class="chat-time">May 26th</div>
      </div>
      
      <div class="chat-item">
        <div class="profile-initial" style="background-color: #795548;">
          <span>세</span>
        </div>
        <div class="chat-content">
          <div class="chat-name">세미 프로젝트 조</div>
          <div class="chat-preview">Protoent non lorem ex...</div>
        </div>
        <div class="chat-time">May 25th</div>
        <div class="badge">8</div>
      </div>
    </div>
  </div>
  
  <!-- 메인 콘텐츠 - 캘린더 영역 -->
  <div class="main-content">
    <div class="main-header">
      <div class="group-info">
        <img src="/api/placeholder/48/48" alt="Group" class="group-image">
        <div class="group-name">집주인 첫째 딸</div>
        <div class="group-count">2 participants</div>
      </div>
      <div class="header-actions">
        <button class="header-button">
          <svg viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
            <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/>
          </svg>
        </button>
        <button class="header-button">
          <svg viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
            <path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"/>
          </svg>
        </button>
        <button class="create-event-button">일정 만들기</button>
      </div>
    </div>
    
    <div class="month-header">
      <div class="month-title">2025년 - 04</div>
      <div class="month-tabs">
        <div class="month-tab active" id="tab-all-events">전체</div>
        <div class="month-tab" id="tab-photos">사진 / 동영상</div>
        <div class="month-tab" id="tab-files">파일</div>
      </div>
    </div>
    
    <div class="calendar-content">
      <div class="calendar-events">
        <div class="calendar-event">
          <div class="event-date">
            <div class="event-date-number">16</div>
            <div class="event-date-day">오늘</div>
          </div>
          <div class="event-details">
            <div class="event-header">
              <div class="event-indicator"></div>
              <div class="event-title">캘린더</div>
            </div>
            <div class="event-location">하루 종일</div>
            <div class="event-time">KH정보교육원 강남지원 1관</div>
          </div>
          <div class="event-actions">
            <div class="attendance-dropdown">
              <select class="attendance-select">
                <option value="참석">참석</option>
                <option value="불참">불참</option>
                <option value="미정">미정</option>
              </select>
              <div class="dropdown-arrow">▼</div>
            </div>
          </div>
        </div>
        
        <div class="calendar-event">
          <div class="event-date">
            <div class="event-date-number">17</div>
            <div class="event-date-day">목요일</div>
          </div>
          <div class="event-details">
            <div class="event-header">
              <div class="event-indicator"></div>
              <div class="event-title">캘린더</div>
            </div>
            <div class="event-location">오후 5:00</div>
            <div class="event-time">KH정보교육원 강남지원 1관</div>
          </div>
          <div class="event-actions">
            <div class="attendance-dropdown">
              <select class="attendance-select">
                <option value="참석">참석</option>
                <option value="불참">불참</option>
                <option value="미정">미정</option>
              </select>
              <div class="dropdown-arrow">▼</div>
            </div>
          </div>
        </div>
        
        <div class="calendar-event">
          <div class="event-date">
            <div class="event-date-number">18</div>
            <div class="event-date-day">금요일</div>
          </div>
          <div class="event-details">
            <div class="event-header">
              <div class="event-indicator"></div>
              <div class="event-title">캘린더</div>
            </div>
            <div class="event-location">오후 12:00</div>
            <div class="event-time">KH정보교육원 강남지원 2관</div>
          </div>
          <div class="event-actions">
            <div class="attendance-dropdown">
              <select class="attendance-select">
                <option value="참석">참석</option>
                <option value="불참">불참</option>
                <option value="미정">미정</option>
              </select>
              <div class="dropdown-arrow">▼</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- 참석 드롭다운 메뉴 -->
  <div id="attendance-menu" class="dropdown-menu">
    <div class="dropdown-item" data-value="참석">참석</div>
    <div class="dropdown-item" data-value="불참">불참</div>
    <div class="dropdown-item" data-value="미정">미정</div>
  </div>
  
  <!-- 캘린더 호버 메뉴 -->
  <div id="calendar-hover-menu" class="hover-menu">
    <div class="hover-item">캘린더 보기</div>
    <div class="hover-item">일정 만들기</div>
    <div class="hover-item">설정</div>
    <div class="hover-item">알림 관리</div>
  </div>

  <script>
    document.addEventListener('DOMContentLoaded', function() {
      // 탭 전환 기능
      const allTab = document.getElementById('tab-all');
      const groupTab = document.getElementById('tab-group');
      
      allTab.addEventListener('click', function() {
        allTab.classList.add('active');
        groupTab.classList.remove('active');
      });
      
      groupTab.addEventListener('click', function() {
        groupTab.classList.add('active');
        allTab.classList.remove('active');
      });
      
      // 월별 콘텐츠 탭 전환 기능
      const allEventsTab = document.getElementById('tab-all-events');
      const photosTab = document.getElementById('tab-photos');
      const filesTab = document.getElementById('tab-files');
      
      allEventsTab.addEventListener('click', function() {
        allEventsTab.classList.add('active');
        photosTab.classList.remove('active');
        filesTab.classList.remove('active');
      });
      
      photosTab.addEventListener('click', function() {
        photosTab.classList.add('active');
        allEventsTab.classList.remove('active');
        filesTab.classList.remove('active');
      });
      
      filesTab.addEventListener('click', function() {
        filesTab.classList.add('active');
        allEventsTab.classList.remove('active');
        photosTab.classList.remove('active');
      });
      
      // 채팅방 목록 클릭 기능
      const chatItems = document.querySelectorAll('.chat-item');
      
      chatItems.forEach(item => {
        item.addEventListener('click', function() {
          chatItems.forEach(chat => chat.classList.remove('active'));
          this.classList.add('active');
        });
      });
      
      // 참석 드롭다운 기능
      const attendanceSelects = document.querySelectorAll('.attendance-select');
      
      attendanceSelects.forEach(select => {
        select.addEventListener('change', function() {
          const selectedValue = this.value;
          console.log(`참석 상태가 변경되었습니다: ${selectedValue}`);
          
          if (selectedValue === '참석') {
            this.style.color = '#0078d4';
          } else if (selectedValue === '불참') {
            this.style.color = '#d83b01';
          } else {
            this.style.color = '#666';
          }
        });
      });
      
      // 캘린더 메뉴 호버 기능
      const calendarItem = document.querySelector('.sidebar-item:nth-child(4)');
      const calendarHoverMenu = document.getElementById('calendar-hover-menu');
      
      calendarItem.addEventListener('mouseenter', function(e) {
        const rect = this.getBoundingClientRect();
        calendarHoverMenu.style.top = rect.top + 'px';
        calendarHoverMenu.style.left = (rect.right + 10) + 'px';
        calendarHoverMenu.classList.add('active');
      });
      
      calendarItem.addEventListener('mouseleave', function(e) {
        // hover 메뉴에서 나갔는지 체크
        const relatedTarget = e.relatedTarget;
        if (!calendarHoverMenu.contains(relatedTarget)) {
          calendarHoverMenu.classList.remove('active');
        }
      });
      
      calendarHoverMenu.addEventListener('mouseleave', function() {
        calendarHoverMenu.classList.remove('active');
      });
      
      // 일정 만들기 버튼 기능
      const createEventButton = document.querySelector('.create-event-button');
      
      createEvent