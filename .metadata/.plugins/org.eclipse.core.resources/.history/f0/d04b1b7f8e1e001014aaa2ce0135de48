<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>채팅 애플리케이션</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Apple SD Gothic Neo', 'Nanum Gothic', sans-serif;
    }
    
    body {
      display: flex;
      height: 100vh;
    }
    
    .sidebar {
      width: 60px;
      background-color: #f5f5f5;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding-top: 20px;
      border-right: 1px solid #e0e0e0;
    }
    
    .sidebar-icon {
      width: 30px;
      height: 30px;
      margin-bottom: 20px;
      display: flex;
      justify-content: center;
      align-items: center;
      cursor: pointer;
      color: #777;
    }
    
    .sidebar-icon.active {
      color: #0078d7;
    }
    
    .sidebar-icon i {
      font-size: 20px;
    }
    
    .chat-list {
      width: 250px;
      background-color: #fff;
      border-right: 1px solid #e0e0e0;
      overflow-y: auto;
    }
    
    .chat-header {
      padding: 20px;
      border-bottom: 1px solid #e0e0e0;
    }
    
    .chat-header h2 {
      font-size: 18px;
      font-weight: bold;
      color: #333;
    }
    
    .chat-tabs {
      display: flex;
      border-bottom: 1px solid #e0e0e0;
    }
    
    .chat-tab {
      flex: 1;
      padding: 10px;
      text-align: center;
      cursor: pointer;
      position: relative;
    }
    
    .chat-tab.active {
      font-weight: bold;
      color: #0078d7;
    }
    
    .chat-tab.active:after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 0;
      width: 100%;
      height: 3px;
      background-color: #0078d7;
    }
    
    .chat-item {
      padding: 10px 20px;
      border-bottom: 1px solid #f5f5f5;
      cursor: pointer;
      display: flex;
      align-items: center;
      position: relative;
    }
    
    .chat-item.active {
      background-color: #f0f7ff;
    }
    
    .chat-item:hover {
      background-color: #f9f9f9;
    }
    
    .profile-icon {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      background-color: #ddd;
      margin-right: 15px;
      display: flex;
      justify-content: center;
      align-items: center;
      color: white;
      font-weight: bold;
    }
    
    .chat-item-info {
      flex: 1;
    }
    
    .chat-name {
      font-weight: bold;
      margin-bottom: 3px;
      color: #333;
    }
    
    .chat-preview {
      font-size: 13px;
      color: #777;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
      max-width: 150px;
    }
    
    .chat-date {
      font-size: 12px;
      color: #999;
      position: absolute;
      right: 20px;
      top: 10px;
    }
    
    .notification-badge {
      width: 18px;
      height: 18px;
      background-color: #fa3e3e;
      color: white;
      border-radius: 50%;
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 10px;
      position: absolute;
      right: 20px;
      bottom: 10px;
    }
    
    .chat-content {
      flex: 1;
      display: flex;
      flex-direction: column;
      background-color: #f5f5f5;
    }
    
    .chat-top {
      padding: 15px 20px;
      border-bottom: 1px solid #e0e0e0;
      display: flex;
      justify-content: space-between;
      align-items: center;
      background-color: #fff;
    }
    
    .chat-title {
      display: flex;
      align-items: center;
    }
    
    .group-icon {
      width: 24px;
      height: 24px;
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: #4caf50;
      border-radius: 50%;
      margin-right: 10px;
      color: white;
      font-size: 12px;
    }
    
    .chat-title h3 {
      font-size: 16px;
      font-weight: bold;
    }
    
    .chat-title span {
      font-size: 13px;
      color: #777;
      margin-left: 10px;
    }
    
    .chat-actions {
      display: flex;
      align-items: center;
    }
    
    .action-icon {
      width: 30px;
      height: 30px;
      display: flex;
      justify-content: center;
      align-items: center;
      cursor: pointer;
      margin-left: 10px;
      color: #555;
    }
    
    .chat-messages {
      flex: 1;
      padding: 20px;
      overflow-y: auto;
    }
    
    .date-divider {
      text-align: center;
      margin: 15px 0;
      position: relative;
    }
    
    .date-divider::before {
      content: '';
      position: absolute;
      top: 50%;
      left: 0;
      right: 0;
      height: 1px;
      background-color: #e0e0e0;
      z-index: 1;
    }
    
    .date-text {
      background-color: #f5f5f5;
      padding: 0 10px;
      position: relative;
      z-index: 2;
      font-size: 14px;
      color: #777;
    }
    
    .year-month {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 20px;
    }
    
    .year-month-text {
      font-size: 18px;
      font-weight: bold;
      color: #333;
    }
    
    .media-tabs {
      display: flex;
    }
    
    .media-tab {
      padding: 5px 10px;
      margin-right: 5px;
      border-radius: 15px;
      cursor: pointer;
      font-size: 13px;
      background-color: #f0f0f0;
    }
    
    .media-tab.active {
      background-color: #e0e0e0;
    }
    
    .message {
      margin-bottom: 20px;
      display: flex;
      flex-direction: column;
    }
    
    .message-header {
      display: flex;
      align-items: center;
      margin-bottom: 5px;
    }
    
    .message-sender {
      font-weight: bold;
      margin-right: 10px;
    }
    
    .message-time {
      font-size: 12px;
      color: #999;
    }
    
    .message-body {
      display: flex;
      align-items: flex-start;
    }
    
    .message-profile {
      width: 35px;
      height: 35px;
      border-radius: 50%;
      background-color: #673ab7;
      margin-right: 10px;
      display: flex;
      justify-content: center;
      align-items: center;
      color: white;
      font-weight: bold;
    }
    
    .message-content {
      background-color: white;
      padding: 10px 15px;
      border-radius: 8px;
      box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
      max-width: 60%;
    }
    
    .message-text {
      font-size: 14px;
      line-height: 1.5;
    }
    
    .message-attachment {
      margin-top: 5px;
      font-size: 13px;
      color: #0078d7;
      display: flex;
      align-items: center;
    }
    
    .message-info {
      font-size: 12px;
      color: #999;
    }
    
    .message-actions {
      display: flex;
      justify-content: flex-end;
      margin-top: 5px;
    }
    
    .action-button {
      margin-left: 10px;
      font-size: 12px;
      color: #666;
      cursor: pointer;
    }
    
    .status-tag {
      padding: 2px 8px;
      border-radius: 12px;
      font-size: 12px;
      margin-right: 10px;
    }
    
    .status-red {
      background-color: #ffebee;
      color: #e53935;
    }
    
    .status-green {
      background-color: #e8f5e9;
      color: #43a047;
    }
    
    .status-orange {
      background-color: #fff3e0;
      color: #ff9800;
    }

    .dropdown {
      position: relative;
      display: inline-block;
    }

    .dropdown-content {
      display: none;
      position: absolute;
      background-color: white;
      min-width: 120px;
      box-shadow: 0px 8px 16px rgba(0,0,0,0.1);
      z-index: 1;
      border-radius: 4px;
    }

    .dropdown-content a {
      color: black;
      padding: 10px 15px;
      text-decoration: none;
      display: block;
      font-size: 14px;
    }

    .dropdown-content a:hover {
      background-color: #f5f5f5;
    }

    .dropdown:hover .dropdown-content {
      display: block;
    }

    /* Calendar Hover */
    .calendar-popup {
      display: none;
      position: absolute;
      top: 60px;
      left: 100px;
      width: 300px;
      background-color: white;
      border-radius: 8px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
      z-index: 1000;
      padding: 15px;
    }

    .calendar-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 15px;
    }

    .calendar-title {
      font-weight: bold;
    }

    .calendar-nav {
      display: flex;
    }

    .calendar-nav-btn {
      padding: 5px 10px;
      cursor: pointer;
    }

    .calendar-weekdays {
      display: grid;
      grid-template-columns: repeat(7, 1fr);
      text-align: center;
      font-weight: bold;
      margin-bottom: 10px;
    }

    .calendar-days {
      display: grid;
      grid-template-columns: repeat(7, 1fr);
      gap: 5px;
    }

    .calendar-day {
      height: 30px;
      display: flex;
      justify-content: center;
      align-items: center;
      cursor: pointer;
      border-radius: 50%;
    }

    .calendar-day:hover {
      background-color: #f0f0f0;
    }

    .calendar-day.current {
      background-color: #0078d7;
      color: white;
    }

    .calendar-day.event {
      position: relative;
    }

    .calendar-day.event::after {
      content: '';
      position: absolute;
      bottom: 2px;
      width: 4px;
      height: 4px;
      background-color: #0078d7;
      border-radius: 50%;
    }

    .status-selector {
      margin-top: 5px;
      display: flex;
      align-items: center;
    }

    .status-selector select {
      padding: 5px;
      border-radius: 4px;
      border: 1px solid #ddd;
      margin-left: 5px;
    }
  </style>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
  <!-- 사이드바 메뉴 -->
  <div class="sidebar">
    <div class="sidebar-icon active" id="home-btn" title="홈">
      <i class="fas fa-home"></i>
    </div>
    <div class="sidebar-icon" id="chat-btn" title="채팅">
      <i class="fas fa-comment"></i>
    </div>
    <div class="sidebar-icon" id="timeline-btn" title="타임라인">
      <i class="fas fa-stream"></i>
    </div>
    <div class="sidebar-icon" id="calendar-btn" title="캘린더">
      <i class="fas fa-calendar-alt"></i>
    </div>
    <div class="sidebar-icon" id="notification-btn" title="알림">
      <i class="fas fa-bell"></i>
    </div>
  </div>

  <!-- 채팅 목록 -->
  <div class="chat-list">
    <div class="chat-header">
      <h2>Messages</h2>
    </div>
    <div class="chat-tabs">
      <div class="chat-tab active" id="all-tab">All</div>
      <div class="chat-tab" id="group-tab">Group</div>
    </div>
    
    <div class="chat-item active">
      <div class="profile-icon" style="background-color: #4caf50;">G</div>
      <div class="chat-item-info">
        <div class="chat-name">참수리 첫째 딸</div>
        <div class="chat-preview">아 언니야</div>
      </div>
      <div class="chat-date">08:00</div>
    </div>
    
    <div class="chat-item">
      <div class="profile-icon" style="background-color: #9c27b0;">여</div>
      <div class="chat-item-info">
        <div class="chat-name">여자친구❤</div>
        <div class="chat-preview">언니야</div>
      </div>
      <div class="chat-date">June 1st</div>
      <div class="notification-badge">1</div>
    </div>
    
    <div class="chat-item">
      <div class="profile-icon" style="background-color: #4caf50;">P</div>
      <div class="chat-item-info">
        <div class="chat-name">참수리</div>
        <div class="chat-preview">밤에 오늘 방만난다 사실</div>
      </div>
      <div class="chat-date">May 26th</div>
    </div>
    
    <div class="chat-item">
      <div class="profile-icon" style="background-color: #f44336;">F</div>
      <div class="chat-item-info">
        <div class="chat-name">fire egg friend</div>
        <div class="chat-preview">야 컨셉이 그거</div>
      </div>
      <div class="chat-date">May 25th</div>
      <div class="notification-badge">6</div>
    </div>
    
    <div class="chat-item">
      <div class="profile-icon" style="background-color: #2196f3;">GD</div>
      <div class="chat-item-info">
        <div class="chat-name">고명훈</div>
        <div class="chat-preview">형아 부사 GD네 ㅋㅋ</div>
      </div>
      <div class="chat-date">May 19th</div>
    </div>
    
    <div class="chat-item">
      <div class="profile-icon" style="background-color: #00bcd4;">스</div>
      <div class="chat-item-info">
        <div class="chat-name">스승님</div>
        <div class="chat-preview">아! 액 아! 지인 인간데 그걸 못해?</div>
      </div>
      <div class="chat-date">May 15th</div>
    </div>
    
    <div class="chat-item">
      <div class="profile-icon" style="background-color: #4caf50;">김</div>
      <div class="chat-item-info">
        <div class="chat-name">김성훈</div>
        <div class="chat-preview">내 치어 미보</div>
      </div>
      <div class="chat-date">May 26th</div>
    </div>
    
    <div class="chat-item">
      <div class="profile-icon" style="background-color: #795548;">세</div>
      <div class="chat-item-info">
        <div class="chat-name">세마 프로젝트 조</div>
        <div class="chat-preview">Proident non lorem ex...</div>
      </div>
      <div class="chat-date">May 25th</div>
      <div class="notification-badge">1</div>
    </div>
  </div>

  <!-- 채팅 내용 -->
  <div class="chat-content">
    <div class="chat-top">
      <div class="chat-title">
        <div class="group-icon">G</div>
        <h3>참수리 첫째 딸</h3>
        <span>2 participants</span>
      </div>
      <div class="chat-actions">
        <div class="action-icon">
          <i class="fas fa-search"></i>
        </div>
        <div class="action-icon">
          <i class="fas fa-ellipsis-v"></i>
        </div>
      </div>
    </div>
    
    <div class="chat-messages">
      <div class="year-month">
        <div class="year-month-text">2025년 - 04</div>
        <div class="media-tabs">
          <div class="media-tab active">전체</div>
          <div class="media-tab">사진 / 동영상</div>
          <div class="media-tab">파일</div>
        </div>
      </div>
      
      <div class="message">
        <div class="message-header">
          <div class="message-sender">칼린다</div>
          <div class="status-tag status-red">오늘</div>
          <div class="message-time">오후 5:10</div>
        </div>
        <div class="message-body">
          <div class="message-profile" style="background-color: #673ab7;">칼</div>
          <div class="message-content">
            <div class="message-text">KH정보교육원 강남지원 1관</div>
            <div class="message-info"></div>
          </div>
        </div>
        <div class="message-actions">
          <div class="dropdown">
            <div class="action-button">참석</div>
            <div class="dropdown-content">
              <a href="#">참석</a>
              <a href="#">불참</a>
              <a href="#">미정</a>
            </div>
          </div>
        </div>
      </div>
      
      <div class="message">
        <div class="message-header">
          <div class="message-sender">칼린다</div>
          <div class="status-tag status-orange">불가입</div>
          <div class="message-time">오후 5:00</div>
        </div>
        <div class="message-body">
          <div class="message-profile" style="background-color: #673ab7;">칼</div>
          <div class="message-content">
            <div class="message-text">KH정보교육원 강남지원 1관</div>
            <div class="message-info"></div>
          </div>
        </div>
        <div class="message-actions">
          <div class="dropdown">
            <div class="action-button">참석</div>
            <div class="dropdown-content">
              <a href="#">참석</a>
              <a href="#">불참</a>
              <a href="#">미정</a>
            </div>
          </div>
        </div>
      </div>
      
      <div class="message">
        <div class="message-header">
          <div class="message-sender">칼린다</div>
          <div class="status-tag status-green">검은일</div>
          <div class="message-time">오후 12:00</div>
        </div>
        <div class="message-body">
          <div class="message-profile" style="background-color: #673ab7;">칼</div>
          <div class="message-content">
            <div class="message-text">KH정보교육원 강남지원 2관</div>
            <div class="message-info"></div>
          </div>
        </div>
        <div class="message-actions">
          <div class="dropdown">
            <div class="action-button">참석</div>
            <div class="dropdown-content">
              <a href="#">참석</a>
              <a href="#">불참</a>
              <a href="#">미정</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- 캘린더 팝업 (hover시 표시) -->
  <div class="calendar-popup" id="calendar-popup">
    <div class="calendar-header">
      <div class="calendar-title">2025년 4월</div>
      <div class="calendar-nav">
        <div class="calendar-nav-btn"><i class="fas fa-chevron-left"></i></div>
        <div class="calendar-nav-btn"><i class="fas fa-chevron-right"></i></div>
      </div>
    </div>
    <div class="calendar-weekdays">
      <div>일</div>
      <div>월</div>
      <div>화</div>
      <div>수</div>
      <div>목</div>
      <div>금</div>
      <div>토</div>
    </div>
    <div class="calendar-days">
      <!-- 날짜 생성은 JavaScript로 처리 -->
    </div>
  </div>

  <script>
    // 사이드바 메뉴 기능
    document.querySelectorAll('.sidebar-icon').forEach(icon => {
      icon.addEventListener('click', function() {
        document.querySelectorAll('.sidebar-icon').forEach(i => i.classList.remove('active'));
        this.classList.add('active');
        
        // 캘린더 버튼 클릭시 캘린더 팝업 토글
        if (this.id === 'calendar-btn') {
          const calendarPopup = document.getElementById('calendar-popup');
          calendarPopup.style.display = calendarPopup.style.display === 'block' ? 'none' : 'block';
        } else {
          document.getElementById('calendar-popup').style.display = 'none';
        }
      });
    });
    
    // 채팅 탭 기능
    document.querySelectorAll('.chat-tab').forEach(tab => {
      tab.addEventListener('click', function() {
        document.querySelectorAll('.chat-tab').forEach(t => t.classList.remove('active'));
        this.classList.add('active');
      });
    });
    
    // 미디어 탭 기능
    document.querySelectorAll('.media-tab').forEach(tab => {
      tab.addEventListener('click', function() {
        document.querySelectorAll('.media-tab').forEach(t => t.classList.remove('active'));
        this.classList.add('active');
      });
    });
    
    // 채팅방 선택 기능
    document.querySelectorAll('.chat-item').forEach(item => {
      item.addEventListener('click', function() {
        document.querySelectorAll('.chat-item').forEach(i => i.classList.remove('active'));
        this.classList.add('active');
      });
    });
    
    // 캘린더 생성 함수
    function createCalendar() {
      const daysContainer = document.querySelector('.calendar-days');
      daysContainer.innerHTML = '';
      
      // 2025년 4월의 첫 날과 마지막 날
      const firstDay = new Date(2025, 3, 1).getDay(); // 3은 4월 (0부터 시작)
      const lastDate = new Date(2025, 4, 0).getDate();
      
      // 이전 달의 일부 날짜 표시 (비활성)
      for (let i = 0; i < firstDay; i++) {
        const dayElem = document.createElement('div');
        dayElem.className = 'calendar-day inactive';
        daysContainer.appendChild(dayElem);
      }
      
      // 현재 달의 날짜 표시
      for (let i = 1; i <= lastDate; i++) {
        const dayElem = document.createElement('div');
        dayElem.className = 'calendar-day';
        dayElem.textContent = i;
        
        // 이벤트가 있는 날짜 표시 (예시)
        if (i === 16 || i === 17 || i === 18) {
          dayElem.classList.add('event');
        }
        
        // 오늘 날짜 표시 (예시)
        if (i === 16) {
          dayElem.classList.add('current');
        }
        
        daysContainer.appendChild(dayElem);
      }
    }
    
    // 페이지 로드 시 캘린더 생성
    window.addEventListener('DOMContentLoaded', createCalendar);
    
    // 상태 선택 기능 (참석, 불참, 미정)
    document.querySelectorAll('.dropdown-content a').forEach(option => {
      option.addEventListener('click', function(e) {
        e.preventDefault();
        const status = this.textContent;
        const actionButton = this.closest('.dropdown').querySelector('.action-button');
        actionButton.textContent = status;
        
        // 여기에 상태 변경 로직 추가 가능
        // 예: 서버에 상태 업데이트 요청 등
      });
    });
  </script>
</body>
</html>