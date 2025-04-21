<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>티캘린더</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif;
        }

        body {
            background-color: #f9f9f9;
            color: #333;
        }

        /* 헤더 영역 */
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 15px 20px;
            border-bottom: 1px solid #e0e0e0;
            background-color: #fff;
        }

        .logo {
            display: flex;
            align-items: center;
        }

        .logo-icon {
            width: 30px;
            height: 30px;
            margin-right: 10px;
            color: #4a8cff;
        }

        .logo-text {
            font-size: 18px;
            font-weight: bold;
        }

        .search-bar {
            display: flex;
            align-items: center;
            background-color: #f5f5f5;
            border-radius: 50px;
            padding: 8px 15px;
            width: 250px;
            margin: 0 20px;
        }

        .search-icon {
            margin-right: 8px;
            color: #888;
        }

        .search-input {
            border: none;
            background: transparent;
            width: 100%;
            outline: none;
            font-size: 14px;
        }

        .user-profile {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            overflow: hidden;
        }

        .user-profile img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* 콘텐츠 레이아웃 */
        .container {
            display: flex;
        }

        /* 왼쪽 사이드바 */
        .sidebar {
            width: 205px;
            background-color: #fff;
            border-right: 1px solid #e0e0e0;
            padding: 20px 0;
            height: calc(100vh - 61px);
        }

        .view-buttons {
            display: flex;
            padding: 0 20px;
            margin-bottom: 20px;
        }

        .view-button {
            padding: 8px 15px;
            border: 1px solid #ddd;
            font-size: 13px;
            background-color: #fff;
            cursor: pointer;
        }

        .view-button:first-child {
            border-radius: 4px 0 0 4px;
        }

        .view-button:last-child {
            border-radius: 0 4px 4px 0;
        }

        .view-button.active {
            background-color: #f2f2f2;
        }

        .mini-calendar {
            padding: 0 20px;
            margin-bottom: 20px;
        }

        .mini-calendar-header {
            font-size: 13px;
            margin-bottom: 10px;
        }

        .mini-calendar-grid {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            gap: 5px;
            font-size: 12px;
            text-align: center;
        }

        .mini-calendar-day {
            width: 22px;
            height: 22px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
        }

        .mini-calendar-day.today {
            background-color: #4a8cff;
            color: white;
        }

        .mini-calendar-day.other-month {
            color: #ccc;
        }

        .mini-calendar-weekday {
            margin-bottom: 5px;
            font-weight: 500;
        }

        .sidebar-section {
            margin-bottom: 20px;
            padding: 0 20px;
        }

        .sidebar-section-title {
            display: flex;
            align-items: center;
            margin-bottom: 12px;
            font-size: 14px;
            color: #666;
        }

        .sidebar-section-title .icon {
            margin-right: 8px;
        }

        .sidebar-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            font-size: 13px;
            cursor: pointer;
            padding: 4px 0;
        }

        .sidebar-item .circle {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            margin-right: 10px;
        }

        /* 메인 캘린더 영역 */
        .main-calendar {
            flex-grow: 1;
            padding: 20px;
        }

        .calendar-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .current-date {
            font-size: 22px;
            font-weight: bold;
            margin-right: 20px;
        }

        .nav-buttons {
            display: flex;
            margin-right: 15px;
        }

        .nav-button {
            width: 30px;
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #ddd;
            background: white;
            cursor: pointer;
        }

        .nav-button:first-child {
            border-radius: 4px 0 0 4px;
        }

        .nav-button:last-child {
            border-radius: 0 4px 4px 0;
        }

        .today-button {
            padding: 6px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background: white;
            font-size: 13px;
            cursor: pointer;
        }

        .calendar-grid {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            grid-template-rows: auto;
            gap: 8px;
        }

        .calendar-cell {
            border: 1px solid #e0e0e0;
            min-height: 120px;
            background-color: white;
            position: relative;
        }

        .day-header {
            padding: 8px;
            font-size: 12px;
            text-align: right;
            color: #888;
        }

        .day-header.weekend {
            color: #ff5252;
        }

        .day-number {
            font-size: 14px;
            color: #333;
        }

        .other-month .day-number {
            color: #bbb;
        }

        .today .day-number {
            background-color: #4caf50;
            color: white;
            width: 24px;
            height: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            margin-left: auto;
        }

        .event {
            margin: 0 5px;
            padding: 4px 8px;
            border-radius: 3px;
            font-size: 12px;
            margin-bottom: 5px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            cursor: pointer;
        }

        .event.blue {
            background-color: #bbdefb;
            color: #1976d2;
        }

        .event.green {
            background-color: #c8e6c9;
            color: #388e3c;
        }
    </style>
</head>
<body>
    <!-- 상단 헤더 -->
    <div class="header">
        <div class="logo">
            <div class="logo-icon">
                <svg viewBox="0 0 24 24" fill="currentColor">
                    <path d="M12,2C6.486,2,2,6.486,2,12s4.486,10,10,10s10-4.486,10-10S17.514,2,12,2z M12,20c-4.411,0-8-3.589-8-8s3.589-8,8-8 s8,3.589,8,8S16.411,20,12,20z"/>
                    <path d="M13,7h-2v6h2V7z"/>
                    <path d="M12,17L12,17c0.552,0,1-0.448,1-1v0c0-0.552-0.448-1-1-1h0c-0.552,0-1,0.448-1,1v0C11,16.552,11.448,17,12,17z"/>
                </svg>
            </div>
            <div class="logo-text">티캘린더</div>
        </div>
        <div class="search-bar">
            <div class="search-icon">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor">
                    <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/>
                </svg>
            </div>
            <input type="text" class="search-input" placeholder="일정 검색">
        </div>
        <div class="user-profile">
            <img src="https://via.placeholder.com/35/f0f0f0/888888?text=U" alt="사용자 프로필">
        </div>
    </div>

    <!-- 본문 컨테이너 -->
    <div class="container">
        <!-- 왼쪽 사이드바 -->
        <div class="sidebar">
            <div class="view-buttons">
                <button class="view-button active">일정 만들기</button>
                <button class="view-button">월 일정</button>
            </div>

            <div class="mini-calendar">
                <div class="mini-calendar-header">2025년 4월</div>
                <div class="mini-calendar-grid">
                    <div class="mini-calendar-weekday">일</div>
                    <div class="mini-calendar-weekday">월</div>
                    <div class="mini-calendar-weekday">화</div>
                    <div class="mini-calendar-weekday">수</div>
                    <div class="mini-calendar-weekday">목</div>
                    <div class="mini-calendar-weekday">금</div>
                    <div class="mini-calendar-weekday">토</div>
                    <div class="mini-calendar-day other-month">30</div>
                    <div class="mini-calendar-day other-month">31</div>
                    <div class="mini-calendar-day">1</div>
                    <div class="mini-calendar-day">2</div>
                    <div class="mini-calendar-day">3</div>
                    <div class="mini-calendar-day">4</div>
                    <div class="mini-calendar-day">5</div>
                    <div class="mini-calendar-day">6</div>
                    <div class="mini-calendar-day">7</div>
                    <div class="mini-calendar-day">8</div>
                    <div class="mini-calendar-day">9</div>
                    <div class="mini-calendar-day">10</div>
                    <div class="mini-calendar-day">11</div>
                    <div class="mini-calendar-day">12</div>
                    <div class="mini-calendar-day">13</div>
                    <div class="mini-calendar-day">14</div>
                    <div class="mini-calendar-day">15</div>
                    <div class="mini-calendar-day">16</div>
                    <div class="mini-calendar-day">17</div>
                    <div class="mini-calendar-day">18</div>
                    <div class="mini-calendar-day">19</div>
                    <div class="mini-calendar-day today">20</div>
                    <div class="mini-calendar-day">21</div>
                    <div class="mini-calendar-day">22</div>
                    <div class="mini-calendar-day">23</div>
                    <div class="mini-calendar-day">24</div>
                    <div class="mini-calendar-day">25</div>
                    <div class="mini-calendar-day">26</div>
                    <div class="mini-calendar-day">27</div>
                    <div class="mini-calendar-day">28</div>
                    <div class="mini-calendar-day">29</div>
                    <div class="mini-calendar-day">30</div>
                    <div class="mini-calendar-day other-month">1</div>
                    <div class="mini-calendar-day other-month">2</div>
                    <div class="mini-calendar-day other-month">3</div>
                </div>
            </div>

            <div class="sidebar-section">
                <div class="sidebar-section-title">
                    <span class="icon">📆</span>
                    <span>내 캘린더</span>
                </div>
                <div class="sidebar-item">
                    <div class="circle" style="background-color: #4a8cff;"></div>
                    <span>티캘린더</span>
                </div>
                <div class="sidebar-item">
                    <div class="circle" style="background-color: #ff4a8c;"></div>
                    <span>내 일정</span>
                </div>
                <div class="sidebar-item">
                    <div class="circle" style="background-color: #4acfff;"></div>
                    <span>계획번1 일정</span>
                </div>
                <div class="sidebar-item">
                    <div class="circle" style="background-color: #ffb44a;"></div>
                    <span>계획번2 일정</span>
                </div>
                <div class="sidebar-item">
                    <div class="circle" style="background-color: #8c4aff;"></div>
                    <span>계획번3 일정</span>
                </div>
            </div>

            <div class="sidebar-section">
                <div class="sidebar-section-title">
                    <span class="icon">👥</span>
                    <span>기념일</span>
                </div>
                <div class="sidebar-item">
                    <div class="circle" style="background-color: #e57373;"></div>
                    <span>대한민국 기념일</span>
                </div>
                <div class="sidebar-item">
                    <div class="circle" style="background-color: #81c784;"></div>
                    <span>내 기념일</span>
                </div>
                <div class="sidebar-item">
                    <div class="circle" style="background-color: #64b5f6;"></div>
                    <span>친구 기념일</span>
                </div>
                <div class="sidebar-item">
                    <div class="circle" style="background-color: #ff8a65;"></div>
                    <span>계획번1 기념일</span>
                </div>
            </div>

            <div class="sidebar-section">
                <div class="sidebar-section-title">
                    <span class="icon">⚙️</span>
                    <span>설정</span>
                </div>
            </div>
        </div>

        <!-- 메인 캘린더 영역 -->
        <div class="main-calendar">
            <div class="calendar-header">
                <div class="current-date">2025년 4월</div>
                <div class="nav-buttons">
                    <button class="nav-button">&lt;</button>
                    <button class="nav-button">&gt;</button>
                </div>
                <button class="today-button">오늘</button>
            </div>

            <div class="calendar-grid">
                <!-- 요일 헤더 -->
                <div class="day-header weekend">일</div>
                <div class="day-header">월</div>
                <div class="day-header">화</div>
                <div class="day-header">수</div>
                <div class="day-header">목</div>
                <div class="day-header">금</div>
                <div class="day-header weekend">토</div>

                <!-- 첫째 주 -->
                <div class="calendar-cell other-month">
                    <div class="day-header weekend">일<br><span class="day-number">30</span></div>
                </div>
                <div class="calendar-cell other-month">
                    <div class="day-header">월<br><span class="day-number">31</span></div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header">화<br><span class="day-number">1</span></div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header">수<br><span class="day-number">2</span></div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header">목<br><span class="day-number">3</span></div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header">금<br><span class="day-number">4</span></div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header weekend">토<br><span class="day-number">5</span></div>
                    <div class="event green">식목일</div>
                </div>

                <!-- 둘째 주 -->
                <div class="calendar-cell">
                    <div class="day-header weekend">일<br><span class="day-number">6</span></div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header">월<br><span class="day-number">7</span></div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header">화<br><span class="day-number">8</span></div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header">수<br><span class="day-number">9</span></div>
                    <div class="event blue">타사 미팅팅 미팅팅</div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header">목<br><span class="day-number">10</span></div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header">금<br><span class="day-number">11</span></div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header weekend">토<br><span class="day-number">12</span></div>
                </div>

                <!-- 셋째 주 -->
                <div class="calendar-cell">
                    <div class="day-header weekend">일<br><span class="day-number">13</span></div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header">월<br><span class="day-number">14</span></div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header">화<br><span class="day-number">15</span></div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header">수<br><span class="day-number">16</span></div>
                    <div class="event blue">네트웍스 미팅</div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header">목<br><span class="day-number">17</span></div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header">금<br><span class="day-number">18</span></div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header weekend">토<br><span class="day-number">19</span></div>
                </div>

                <!-- 넷째 주 -->
                <div class="calendar-cell">
                    <div class="day-header weekend">일<br><span class="day-number">20</span></div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header">월<br><span class="day-number">21</span></div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header">화<br><span class="day-number">22</span></div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header">수<br><span class="day-number">23</span></div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header">목<br><span class="day-number">24</span></div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header">금<br><span class="day-number">25</span></div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header weekend">토<br><span class="day-number">26</span></div>
                </div>

                <!-- 다섯째 주 -->
                <div class="calendar-cell">
                    <div class="day-header weekend">일<br><span class="day-number">27</span></div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header">월<br><span class="day-number">28</span></div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header">화<br><span class="day-number">29</span></div>
                </div>
                <div class="calendar-cell">
                    <div class="day-header">수<br><span class="day-number">30</span></div>
                </div>
                <div class="calendar-cell other-month">
                    <div class="day-header">목<br><span class="day-number">1</span></div>
                </div>
                <div class="calendar-cell other-month">
                    <div class="day-header">금<br><span class="day-number">2</span></div>
                </div>
                <div class="calendar-cell other-month">
                    <div class="day-header weekend">토<br><span class="day-number">3</span></div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // 월 이동 버튼 이벤트
            const prevButton = document.querySelector('.nav-buttons button:first-child');
            const nextButton = document.querySelector('.nav-buttons button:last-child');
            const currentDateEl = document.querySelector('.current-date');
            
            let currentYear = 2025;
            let currentMonth = 4;
            
            prevButton.addEventListener('click', function() {
                currentMonth--;
                if (currentMonth < 1) {
                    currentMonth = 12;
                    currentYear--;
                }
                currentDateEl.textContent = `${currentYear}년 ${currentMonth}월`;
                // 실제 구현에서는 여기서 해당 월의 캘린더를 다시 렌더링해야 함
            });
            
            nextButton.addEventListener('click', function() {
                currentMonth++;
                if (currentMonth > 12) {
                    currentMonth = 1;
                    currentYear++;
                }
                currentDateEl.textContent = `${currentYear}년 ${currentMonth}월`;
                // 실제 구현에서는 여기서 해당 월의 캘린더를 다시 렌더링해야 함
            });
            
            // 오늘 버튼 이벤트
            const todayButton = document.querySelector('.today-button');
            todayButton.addEventListener('click', function() {
                currentYear = 2025;
                currentMonth = 4;
                currentDateEl.textContent = `${currentYear}년 ${currentMonth}월`;
                // 실제 구현에서는 여기서 오늘이 포함된 월의 캘린더를 다시 렌더링해야 함
            });
            
            // 뷰 버튼 토글
            const viewButtons = document.querySelectorAll('.view-button');
            viewButtons.forEach(button => {
                button.addEventListener('click', function() {
                    viewButtons.forEach(btn => btn.classList.remove('active'));
                    this.classList.add('active');
                });
            });
            
            // 미니 캘린더 상호작용
            const miniCalendarDays = document.querySelectorAll('.mini-calendar-day');
            miniCalendarDays.forEach(day => {
                day.addEventListener('click', function() {
                    miniCalendarDays.forEach(d => d.classList.remove('today'));
                    this.classList.add('today');
                    // 실제 구현에서는 해당 날짜로 캘린더를 업데이트해야 함
                });
            });
            
            // 이벤트 클릭
            const events = document.querySelectorAll('.event');
            events.forEach(event => {
                event.addEventListener('click', function(e) {
                    e.stopPropagation();
                    alert(`이벤트 '${this.textContent}'의 상세 정보를 볼 수 있습니다.`);
                });
            });
        });
    </script>
</body>
</html>