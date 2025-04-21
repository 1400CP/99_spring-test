<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>달력 및 일정 관리</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Noto Sans KR', sans-serif;
        }
        
        body {
            background-color: #f5f5f5;
            color: #333;
            line-height: 1.6;
        }
        
        .container {
            display: flex;
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        
        .sidebar {
            width: 250px;
            background-color: #f9f9f9;
            border-right: 1px solid #eaeaea;
            padding: 20px;
        }
        
        .main-content {
            flex: 1;
            padding: 20px;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding: 10px 0;
            border-bottom: 1px solid #eaeaea;
        }
        
        .logo {
            display: flex;
            align-items: center;
            font-size: 24px;
            font-weight: bold;
            color: #007bff;
        }
        
        .logo-icon {
            margin-right: 8px;
            color: #007bff;
            font-size: 28px;
        }
        
        .search-bar {
            display: flex;
            align-items: center;
            background: #f5f5f5;
            border-radius: 20px;
            padding: 5px 15px;
            width: 300px;
            border: 1px solid #ddd;
        }
        
        .search-bar input {
            border: none;
            background: transparent;
            flex: 1;
            padding: 8px;
            outline: none;
        }
        
        .search-icon {
            margin-right: 8px;
            color: #777;
        }
        
        .user-profile {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #ddd;
            overflow: hidden;
        }
        
        .user-profile img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .calendar-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .year-month {
            font-size: 28px;
            font-weight: bold;
        }
        
        .calendar-nav {
            display: flex;
            align-items: center;
        }
        
        .nav-button {
            background: none;
            border: none;
            font-size: 20px;
            cursor: pointer;
            margin: 0 5px;
            width: 30px;
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 4px;
        }
        
        .nav-button:hover {
            background-color: #f0f0f0;
        }
        
        .today-button {
            background-color: #f0f0f0;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
            margin-left: 10px;
        }
        
        .today-button:hover {
            background-color: #e0e0e0;
        }
        
        .calendar-view-tabs {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
        
        .tab-button {
            background: none;
            border: 1px solid #ddd;
            padding: 8px 16px;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .tab-button.active {
            background-color: #007bff;
            color: white;
            border-color: #007bff;
        }
        
        .calendar-grid {
            width: 100%;
        }
        
        .weekdays {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            text-align: center;
            font-weight: bold;
            margin-bottom: 10px;
            color: #666;
        }
        
        .weekday {
            padding: 10px;
            font-size: 14px;
        }
        
        .calendar-days {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            gap: 10px;
        }
        
        .day-cell {
            border: 1px solid #eaeaea;
            min-height: 100px;
            padding: 8px;
            position: relative;
        }
        
        .day-cell.other-month {
            background-color: #f9f9f9;
            color: #aaa;
        }
        
        .day-number {
            position: absolute;
            top: 8px;
            left: 8px;
            width: 25px;
            height: 25px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            border-radius: 50%;
        }
        
        .current-day .day-number {
            background-color: #007bff;
            color: white;
        }
        
        .today {
            background-color: #e6f7ff;
        }
        
        .events-container {
            margin-top: 30px;
        }
        
        .event {
            background-color: #e6f7ff;
            border-left: 3px solid #007bff;
            padding: 5px 8px;
            margin-bottom: 5px;
            font-size: 12px;
            border-radius: 3px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            cursor: pointer;
        }
        
        .event.holiday {
            background-color: #d4edda;
            border-left-color: #28a745;
        }
        
        .event.important {
            background-color: #f8d7da;
            border-left-color: #dc3545;
        }
        
        .sidebar-section {
            margin-bottom: 20px;
        }
        
        .sidebar-title {
            font-weight: bold;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }
        
        .sidebar-icon {
            margin-right: 8px;
            width: 16px;
            height: 16px;
        }
        
        .sidebar-list {
            list-style-type: none;
        }
        
        .sidebar-list li {
            padding: 8px 0;
            display: flex;
            align-items: center;
            cursor: pointer;
        }
        
        .sidebar-list li:hover {
            color: #007bff;
        }
        
        .sidebar-list li:before {
            content: "●";
            margin-right: 10px;
            font-size: 8px;
            color: #777;
        }
        
        /* 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }
        
        .modal-content {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            width: 400px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        
        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .modal-title {
            font-size: 18px;
            font-weight: bold;
        }
        
        .close-button {
            background: none;
            border: none;
            font-size: 20px;
            cursor: pointer;
            color: #777;
        }
        
        .modal-form {
            display: flex;
            flex-direction: column;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        
        .form-group input, .form-group select, .form-group textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        
        .form-group textarea {
            height: 100px;
            resize: vertical;
        }
        
        .color-options {
            display: flex;
            gap: 10px;
        }
        
        .color-option {
            width: 24px;
            height: 24px;
            border-radius: 50%;
            cursor: pointer;
            border: 2px solid transparent;
        }
        
        .color-option.selected {
            border-color: #333;
        }
        
        .button-group {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 15px;
        }
        
        .button {
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }
        
        .button-primary {
            background-color: #007bff;
            color: white;
        }
        
        .button-secondary {
            background-color: #f0f0f0;
            color: #333;
        }
        
        .button-danger {
            background-color: #dc3545;
            color: white;
        }
        
        /* 기념일 표시 스타일 */
        .holiday-marker {
            position: absolute;
            top: 8px;
            right: 8px;
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background-color: #28a745;
        }
        
        /* 이벤트 조회 모달 스타일 */
        .modal-event-list {
            max-height: 250px;
            overflow-y: auto;
            margin-bottom: 15px;
        }
        
        .modal-event-item {
            padding: 10px;
            border-left: 3px solid #007bff;
            margin-bottom: 10px;
            background-color: #f8f9fa;
            border-radius: 4px;
        }
        
        .modal-event-item.holiday {
            border-left-color: #28a745;
        }
        
        .modal-event-item.important {
            border-left-color: #dc3545;
        }
        
        .modal-event-title {
            font-weight: bold;
            margin-bottom: 5px;
        }
        
        .modal-event-description {
            font-size: 14px;
            color: #666;
        }
        
        .modal-event-category {
            font-size: 12px;
            padding: 2px 6px;
            border-radius: 10px;
            background-color: #e6f7ff;
            display: inline-block;
            margin-top: 5px;
        }
        
        .modal-event-category.holiday {
            background-color: #d4edda;
            color: #155724;
        }
        
        .modal-event-category.important {
            background-color: #f8d7da;
            color: #721c24;
        }
        
        .date-header {
            font-weight: bold;
            margin-bottom: 10px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- 사이드바 -->
        <div class="sidebar">
            <div class="sidebar-section">
                <div class="sidebar-title">
                    <span class="sidebar-icon">📅</span> 캘린더
                </div>
                <ul class="sidebar-list">
                    <li>월별 일정표</li>
                    <li>할 일 일정표</li>
                </ul>
            </div>
            
            <div class="sidebar-section">
                <div class="sidebar-title">
                    <span class="sidebar-icon">🔖</span> 일정 선택 목록
                </div>
                <ul class="sidebar-list">
                    <li>내 일정</li>
                    <li>가족일정</li>
                    <li>직장일정1 일정</li>
                    <li>직장일정2 일정</li>
                    <li>직장일정3 일정</li>
                </ul>
            </div>
            
            <div class="sidebar-section">
                <div class="sidebar-title">
                    <span class="sidebar-icon">👥</span> 기념일
                </div>
                <ul class="sidebar-list">
                    <li>대한민국 기념일</li>
                    <li>내 기념일</li>
                    <li>친구 기념일</li>
                    <li>직장일정1 기념일</li>
                </ul>
            </div>
            
            <div class="sidebar-section">
                <div class="sidebar-title">
                    <span class="sidebar-icon">⚙️</span> 설정
                </div>
            </div>
        </div>
        
        <!-- 메인 콘텐츠 -->
        <div class="main-content">
            <!-- 헤더 -->
            <div class="header">
                <div class="logo">
                    <span class="logo-icon">📅</span> 티캘린더
                </div>
                <div class="search-bar">
                    <span class="search-icon">🔍</span>
                    <input type="text" placeholder="일정 검색">
                </div>
                <div class="user-profile">
                    <img src="/api/placeholder/40/40" alt="사용자 프로필">
                </div>
            </div>
            
            <!-- 캘린더 탭 -->
            <div class="calendar-view-tabs">
                <button class="tab-button">일별 일정표</button>
                <button class="tab-button active">월별 일정표</button>
            </div>
            
            <!-- 캘린더 헤더 -->
            <div class="calendar-header">
                <div class="year-month" id="currentYearMonth"></div>
                <div class="calendar-nav">
                    <button class="nav-button" id="prevMonth">◀</button>
                    <button class="nav-button" id="nextMonth">▶</button>
                    <button class="today-button" id="todayButton">오늘</button>
                </div>
            </div>
            
            <!-- 캘린더 그리드 -->
            <div class="calendar-grid">
                <div class="weekdays">
                    <div class="weekday">일</div>
                    <div class="weekday">월</div>
                    <div class="weekday">화</div>
                    <div class="weekday">수</div>
                    <div class="weekday">목</div>
                    <div class="weekday">금</div>
                    <div class="weekday">토</div>
                </div>
                <div class="calendar-days" id="calendarDays">
                    <!-- 여기에 JavaScript로 날짜가 생성됩니다 -->
                </div>
            </div>
        </div>
    </div>
    
    <!-- 일정 추가 모달 -->
    <div class="modal" id="eventModal">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title">일정 추가</div>
                <button class="close-button" id="closeModal">&times;</button>
            </div>
            <form class="modal-form" id="eventForm">
                <div class="form-group">
                    <label for="eventTitle">일정 제목</label>
                    <input type="text" id="eventTitle" required>
                </div>
                <div class="form-group">
                    <label for="eventDate">날짜</label>
                    <input type="date" id="eventDate" required>
                </div>
                <div class="form-group">
                    <label for="eventCategory">카테고리</label>
                    <select id="eventCategory">
                        <option value="default">기본 일정</option>
                        <option value="holiday">휴일</option>
                        <option value="important">중요 일정</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="eventDesc">설명</label>
                    <textarea id="eventDesc"></textarea>
                </div>
                <div class="button-group">
                    <button type="button" class="button button-secondary" id="cancelButton">취소</button>
                    <button type="submit" class="button button-primary">저장</button>
                </div>
            </form>
        </div>
    </div>
    
    <!-- 일정 조회 모달 -->
    <div class="modal" id="viewEventModal">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title">일정 조회</div>
                <button class="close-button" id="closeViewModal">&times;</button>
            </div>
            <div class="date-header" id="viewDateHeader"></div>
            <div class="modal-event-list" id="eventList">
                <!-- 여기에 해당 날짜의 일정이 표시됩니다 -->
            </div>
            <div class="button-group">
                <button type="button" class="button button-secondary" id="closeViewButton">닫기</button>
                <button type="button" class="button button-primary" id="addEventButton">일정 추가</button>
            </div>
        </div>
    </div>
    
    <script>
        // 현재 날짜 정보
        let today = new Date();
        let currentMonth = today.getMonth();
        let currentYear = today.getFullYear();
        
        // 모든 일정을 저장할 객체
        let events = {};
        
        // 월 이름
        const monthNames = ["1월", "2월", "3월", "4월", "5월", "6월",
                           "7월", "8월", "9월", "10월", "11월", "12월"];
        
        // 요일 이름
        const weekdays = ["일", "월", "화", "수", "목", "금", "토"];
        
        // DOM 요소
        const calendarDays = document.getElementById('calendarDays');
        const currentYearMonthElement = document.getElementById('currentYearMonth');
        const prevMonthButton = document.getElementById('prevMonth');
        const nextMonthButton = document.getElementById('nextMonth');
        const todayButton = document.getElementById('todayButton');
        const eventModal = document.getElementById('eventModal');
        const viewEventModal = document.getElementById('viewEventModal');
        const closeModalButton = document.getElementById('closeModal');
        const closeViewModalButton = document.getElementById('closeViewModal');
        const cancelButton = document.getElementById('cancelButton');
        const closeViewButton = document.getElementById('closeViewButton');
        const addEventButton = document.getElementById('addEventButton');
        const eventForm = document.getElementById('eventForm');
        const eventDateInput = document.getElementById('eventDate');
        const eventList = document.getElementById('eventList');
        const viewDateHeader = document.getElementById('viewDateHeader');
        
        // 현재 선택된 날짜
        let selectedDate = '';
        
        // 윤년 확인 함수
        function isLeapYear(year) {
            return (year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0);
        }
        
        // 월별 일수 계산 함수
        function getDaysInMonth(year, month) {
            // 31일인 월: 1, 3, 5, 7, 8, 10, 12
            if ([0, 2, 4, 6, 7, 9, 11].includes(month)) {
                return 31;
            } 
            // 30일인 월: 4, 6, 9, 11
            else if ([3, 5, 8, 10].includes(month)) {
                return 30;
            } 
            // 2월: 윤년이면 29일, 아니면 28일
            else {
                return isLeapYear(year) ? 29 : 28;
            }
        }
        
        // 날짜 형식화 함수
        function formatDate(dateString) {
            const date = new Date(dateString);
            const year = date.getFullYear();
            const month = monthNames[date.getMonth()];
            const day = date.getDate();
            return `${year}년 ${month} ${day}일`;
        }
        
        // 캘린더 렌더링 함수
        function renderCalendar() {
            // 현재 연도와 월 표시
            currentYearMonthElement.textContent = `${currentYear}년 ${monthNames[currentMonth]}`;
            
            // 캘린더 초기화
            calendarDays.innerHTML = '';
            
            // 해당 월의 첫 날
            const firstDay = new Date(currentYear, currentMonth, 1);
            // 해당 월의 마지막 날
            const lastDay = new Date(currentYear, currentMonth, getDaysInMonth(currentYear, currentMonth));
            
            // 이전 달의 날짜 표시
            const firstDayOfWeek = firstDay.getDay();
            if (firstDayOfWeek > 0) {
                const prevMonthLastDate = new Date(currentYear, currentMonth, 0).getDate();
                for (let i = 0; i < firstDayOfWeek; i++) {
                    const dayNumber = prevMonthLastDate - firstDayOfWeek + i + 1;
                    const prevMonthYear = currentMonth === 0 ? currentYear - 1 : currentYear;
                    const prevMonth = currentMonth === 0 ? 11 : currentMonth - 1;
                    const dateString = `${prevMonthYear}-${String(prevMonth + 1).padStart(2, '0')}-${String(dayNumber).padStart(2, '0')}`;
                    const dayCell = createDayCell(dayNumber, true, `${prevMonthYear}-${String(prevMonth + 1).padStart(2, '0')}-${String(dayNumber).padStart(2, '0')}`);
                    // const dayCell = createDayCell(dayNumber, true, dateString);
                    calendarDays.appendChild(dayCell);
                }
            }
            
            // 현재 달의 날짜 표시
            for (let i = 1; i <= getDaysInMonth(currentYear, currentMonth); i++) {
                const dateString = `${currentYear}-${String(currentMonth + 1).padStart(2, '0')}-${String(i).padStart(2, '0')}`;
                const isToday = i === today.getDate() && currentMonth === today.getMonth() && currentYear === today.getFullYear();
                const dayCell = createDayCell(i, false, dateString, isToday);
                calendarDays.appendChild(dayCell);
            }
            
            // 다음 달의 날짜 표시
            const lastDayOfWeek = lastDay.getDay();
            if (lastDayOfWeek < 6) {
                for (let i = 1; i <= 6 - lastDayOfWeek; i++) {
                    const nextMonthYear = currentMonth === 11 ? currentYear + 1 : currentYear;
                    const nextMonth = currentMonth === 11 ? 0 : currentMonth + 1;
                    const dateString = `${nextMonthYear}-${String(nextMonth + 1).padStart(2, '0')}-${String(i).padStart(2, '0')}`;
                    const dayCell = createDayCell(i, true, dateString);
                    calendarDays.appendChild(dayCell);
                }
            }
            
            // 날짜 이동 후 이벤트 다시 표시
            displayEvents();
        }
        
        // 날짜 셀 생성 함수
        function createDayCell(day, isOtherMonth, dateString, isToday = false) {
            const dayCell = document.createElement('div');
            dayCell.className = 'day-cell';
            if (isOtherMonth) {
                dayCell.classList.add('other-month');
            }
            if (isToday) {
                dayCell.classList.add('today');
            }
            
            const dayNumber = document.createElement('div');
            dayNumber.className = 'day-number';
            dayNumber.textContent = day;
            
            if (isToday) {
                dayNumber.classList.add('current-day');
            }
            
            dayCell.appendChild(dayNumber);

            // 이벤트 컨테이너 추가
            const eventsContainer = document.createElement('div');
            eventsContainer.className = 'events-container';
            eventsContainer.dataset.date = dateString;
            dayCell.appendChild(eventsContainer);

            // 클릭 이벤트 처리
            dayCell.addEventListener('click', function() {
            selectedDate = dateString;
            const dateEvents = events[dateString] || [];
                
            // 날짜에 이벤트가 있는 경우 조회 모달을 표시
                if (dateEvents.length > 0) {
                    showViewEventModal(dateString, dateEvents);
                } else {
                    // 이벤트가 없는 경우 일정 추가 모달 표시
                    showAddEventModal(dateString);
                }
            });
            
            // 기념일 표시 (국가 기념일이 있는 경우)
            const dateEvents = events[dateString] || [];
            const hasHoliday = dateEvents.some(event => event.category === "holiday");
            if (hasHoliday) {
                const holidayMarker = document.createElement('div');
                holidayMarker.className = 'holiday-marker';
                dayCell.appendChild(holidayMarker);
            }

            return dayCell;
        }
        
        // 일정 표시 함수
        function displayEvents() {
            // 모든 날짜별 이벤트 컨테이너 가져오기
            const eventContainers = document.querySelectorAll('.events-container');
            
            // 각 컨테이너에 해당 날짜의 이벤트 표시
            eventContainers.forEach(container => {
                const dateString = container.dataset.date;
                const dateEvents = events[dateString] || [];
                
                // 컨테이너 초기화
                container.innerHTML = '';
                
                // 이벤트 표시
                dateEvents.forEach(event => {
                    const eventElement = document.createElement('div');
                    eventElement.className = `event ${event.category}`;
                    eventElement.textContent = event.title;
                    eventElement.title = event.description || event.title;
                    
                    // 이벤트 클릭 시 이벤트 전파 방지 및 상세 보기
                    eventElement.addEventListener('click', function(e) {
                        e.stopPropagation();
                        showViewEventModal(dateString, dateEvents);
                    });
        
        // events 객체를 localStorage에 저장하는 함수
        function saveEvents() {
            localStorage.setItem('calendarEvents', JSON.stringify(events));
        }

        // localStorage에서 events 객체를 불러오는 함수
        function loadEvents() {
            const savedEvents = localStorage.getItem('calendarEvents');
            if (savedEvents) {
                events = JSON.parse(savedEvents);
            }
        }

        // 일정 추가 모달 표시 함수
        function showAddEventModal(dateString) {
            eventDateInput.value = dateString;
            document.getElementById('eventTitle').value = '';
            document.getElementById('eventCategory').value = 'default';
            document.getElementById('eventDesc').value = '';
            
            // 모달 제목 변경
            document.querySelector('#eventModal .modal-title').textContent = '일정 추가';
            
            // 모달 표시
            eventModal.style.display = 'flex';
        }

        // 일정 조회 모달 표시 함수
        function showViewEventModal(dateString, dateEvents) {
            // 날짜 헤더 설정
            viewDateHeader.textContent = formatDate(dateString);
            
            // 이벤트 목록 초기화
            eventList.innerHTML = '';
            
            // 이벤트 목록 생성
            dateEvents.forEach((event, index) => {
                const eventItem = document.createElement('div');
                eventItem.className = `modal-event-item ${event.category}`;
                
                const eventTitle = document.createElement('div');
                eventTitle.className = 'modal-event-title';
                eventTitle.textContent = event.title;
                
                const eventDesc = document.createElement('div');
                eventDesc.className = 'modal-event-description';
                eventDesc.textContent = event.description || '설명 없음';
                
                const eventCategory = document.createElement('div');
                eventCategory.className = `modal-event-category ${event.category}`;
                
                // 카테고리 텍스트 설정
                if (event.category === 'holiday') {
                    eventCategory.textContent = '휴일';
                } else if (event.category === 'important') {
                    eventCategory.textContent = '중요';
                } else {
                    eventCategory.textContent = '일반';
                }
                
                // 이벤트 항목에 추가
                eventItem.appendChild(eventTitle);
                eventItem.appendChild(eventDesc);
                eventItem.appendChild(eventCategory);
                
                // 이벤트 편집/삭제 버튼
                const buttonGroup = document.createElement('div');
                buttonGroup.className = 'button-group';
                buttonGroup.style.marginTop = '10px';
                
                const editButton = document.createElement('button');
                editButton.className = 'button button-secondary';
                editButton.textContent = '편집';
                editButton.style.marginRight = '5px';
                editButton.addEventListener('click', function() {
                    // 이벤트 편집 모달 표시
                    editEvent(dateString, index);
                });
                
                const deleteButton = document.createElement('button');
                deleteButton.className = 'button button-danger';
                deleteButton.textContent = '삭제';
                deleteButton.addEventListener('click', function() {
                    // 이벤트 삭제
                    events[dateString].splice(index, 1);
                    
                    // 해당 날짜에 이벤트가 없으면 해당 속성 삭제
                    if (events[dateString].length === 0) {
                        delete events[dateString];
                    }
                    
                    // 이벤트 저장 및 다시 표시
                    saveEvents();
                    displayEvents();
                    
                    // 모달 닫기
                    viewEventModal.style.display = 'none';
                });
                
                buttonGroup.appendChild(editButton);
                buttonGroup.appendChild(deleteButton);
                eventItem.appendChild(buttonGroup);
                
                // 이벤트 목록에 추가
                eventList.appendChild(eventItem);
            });
            
            // 모달 표시
            viewEventModal.style.display = 'flex';
        }

        // 이벤트 편집 함수
        function editEvent(dateString, index) {
            const event = events[dateString][index];
            
            // 폼에 이벤트 정보 설정
            document.getElementById('eventTitle').value = event.title;
            document.getElementById('eventDate').value = event.date;
            document.getElementById('eventCategory').value = event.category;
            document.getElementById('eventDesc').value = event.description || '';
            
            // 모달 제목 변경
            document.querySelector('#eventModal .modal-title').textContent = '일정 편집';
            
            // 폼 제출 핸들러 변경
            const originalSubmitHandler = eventForm.onsubmit;
            eventForm.onsubmit = function(e) {
                e.preventDefault();
                
                // 이벤트 업데이트
                const updatedEvent = {
                    title: document.getElementById('eventTitle').value,
                    date: document.getElementById('eventDate').value,
                    category: document.getElementById('eventCategory').value,
                    description: document.getElementById('eventDesc').value
                };
                
                // 날짜가 변경된 경우
                if (updatedEvent.date !== dateString) {
                    // 원래 날짜에서 이벤트 제거
                    events[dateString].splice(index, 1);
                    
                    // 해당 날짜에 이벤트가 없으면 해당 속성 삭제
                    if (events[dateString].length === 0) {
                        delete events[dateString];
                    }
                    
                    // 새 날짜에 이벤트 추가
                    if (!events[updatedEvent.date]) {
                        events[updatedEvent.date] = [];
                    }
                    events[updatedEvent.date].push(updatedEvent);
                } else {
                    // 같은 날짜에 업데이트
                    events[dateString][index] = updatedEvent;
                }
                
                // 이벤트 저장 및 다시 표시
                saveEvents();
                displayEvents();
                
                // 모달 닫기
                eventModal.style.display = 'none';
                viewEventModal.style.display = 'none';
                
                // 원래 이벤트 핸들러 복원
                eventForm.onsubmit = originalSubmitHandler;
            };
            
            // 조회 모달 닫기 및 편집 모달 표시
            viewEventModal.style.display = 'none';
            eventModal.style.display = 'flex';
        }

        // 이벤트 컨테이너에 이벤트 추가 (displayEvents 함수의 미완성 부분 완성)
        function displayEvents() {
            // 모든 날짜별 이벤트 컨테이너 가져오기
            const eventContainers = document.querySelectorAll('.events-container');
            
            // 각 컨테이너에 해당 날짜의 이벤트 표시
            eventContainers.forEach(container => {
                const dateString = container.dataset.date;
                const dateEvents = events[dateString] || [];
                
                // 컨테이너 초기화
                container.innerHTML = '';
                
                // 이벤트 표시 (최대 3개까지만)
                const maxDisplay = 3;
                const displayCount = Math.min(dateEvents.length, maxDisplay);
                
                for (let i = 0; i < displayCount; i++) {
                    const event = dateEvents[i];
                    const eventElement = document.createElement('div');
                    eventElement.className = `event ${event.category}`;
                    eventElement.textContent = event.title;
                    eventElement.title = event.description || event.title;
                    
                    // 이벤트 클릭 시 이벤트 전파 방지 및 상세 보기
                    eventElement.addEventListener('click', function(e) {
                        e.stopPropagation();
                        showViewEventModal(dateString, dateEvents);
                    });
                    
                    container.appendChild(eventElement);
                }
                
                // 표시할 이벤트가 더 있는 경우 '더 보기' 표시
                if (dateEvents.length > maxDisplay) {
                    const moreElement = document.createElement('div');
                    moreElement.className = 'event more';
                    moreElement.textContent = `+ ${dateEvents.length - maxDisplay} 더 보기`;
                    moreElement.style.textAlign = 'center';
                    moreElement.style.fontSize = '10px';
                    moreElement.style.color = '#666';
                    moreElement.style.cursor = 'pointer';
                    
                    moreElement.addEventListener('click', function(e) {
                        e.stopPropagation();
                        showViewEventModal(dateString, dateEvents);
                    });
                    
                    container.appendChild(moreElement);
                }
            });
        }

        // 일정 추가 함수
        function addEvent(event) {
            const dateString = event.date;
            
            // 해당 날짜의 이벤트 배열이 없으면 생성
            if (!events[dateString]) {
                events[dateString] = [];
            }
            
            // 이벤트 추가
            events[dateString].push(event);
            
            // 이벤트 저장
            saveEvents();
            
            // 이벤트 표시 업데이트
            displayEvents();
        }

        // 국가 공휴일 데이터
        function addNationalHolidays(year) {
            // 고정 공휴일
            const fixedHolidays = [
                { month: 1, day: 1, title: "신정", description: "새해 첫날" },
                { month: 3, day: 1, title: "삼일절", description: "3.1운동 기념일" },
                { month: 5, day: 5, title: "어린이날", description: "어린이를 위한 날" },
                { month: 6, day: 6, title: "현충일", description: "나라를 위해 희생한 분들을 기리는 날" },
                { month: 8, day: 15, title: "광복절", description: "대한민국 광복 기념일" },
                { month: 10, day: 3, title: "개천절", description: "단군왕검이 고조선을 건국한 날" },
                { month: 10, day: 9, title: "한글날", description: "한글 반포 기념일" },
                { month: 12, day: 25, title: "크리스마스", description: "기독교 예수 탄생일" }
            ];
            
            // 고정 공휴일 추가
            fixedHolidays.forEach(holiday => {
                const dateString = `${year}-${String(holiday.month).padStart(2, '0')}-${String(holiday.day).padStart(2, '0')}`;
                
                // 이미 해당 날짜에 같은 제목의 이벤트가 있는지 확인
                const dateEvents = events[dateString] || [];
                const exists = dateEvents.some(event => event.title === holiday.title);
                
                if (!exists) {
                    addEvent({
                        title: holiday.title,
                        date: dateString,
                        category: "holiday",
                        description: holiday.description
                    });
                }
            });
            
            // 실제로는 음력 휴일(설날, 추석 등)도 추가해야 하지만,
            // 이 예제에서는 고정 공휴일만 추가합니다.
        }

        // 모달 관련 추가 이벤트 리스너
        function setupAdditionalEventListeners() {
            // 일정 조회 모달 닫기 버튼
            closeViewModalButton.addEventListener('click', function() {
                viewEventModal.style.display = 'none';
            });
            
            // 일정 조회 모달의 닫기 버튼
            closeViewButton.addEventListener('click', function() {
                viewEventModal.style.display = 'none';
            });
            
            // 일정 조회 모달의 일정 추가 버튼
            addEventButton.addEventListener('click', function() {
                viewEventModal.style.display = 'none';
                showAddEventModal(selectedDate);
            });
            
            // 배경 클릭시 일정 조회 모달 닫기
            window.addEventListener('click', function(event) {
                if (event.target === viewEventModal) {
                    viewEventModal.style.display = 'none';
                }
            });
        }

        // 초기화 함수 업데이트
        function init() {
            // localStorage에서 이벤트 로드
            loadEvents();
            
            // 캘린더 렌더링
            renderCalendar();
            
            // 이벤트 리스너 설정
            setupEventListeners();
            setupAdditionalEventListeners();
            
            // 국가 공휴일 추가
            addNationalHolidays(currentYear);
            
            // 이벤트가 없는 경우에만 기본 이벤트 추가
            if (Object.keys(events).length === 0) {
                addDefaultEvents();
            }
            
            // 이벤트 표시
            displayEvents();
        }

        // 일정 추가 함수
        function addEvent(event) {
            const dateString = event.date;
            
            // 해당 날짜의 이벤트 배열이 없으면 생성
            if (!events[dateString]) {
                events[dateString] = [];
            }
            
            // 이벤트 추가
            events[dateString].push(event);
            
            // 이벤트 표시 업데이트
            displayEvents();
        }
        
        // 기본 일정 데이터 추가
        function addDefaultEvents() {
            // 현재 월의 공휴일 또는 특별한 날 추가
            const thisYear = today.getFullYear();
            const thisMonth = today.getMonth();
            
            // 어린이날
            if (thisMonth === 4) { // 5월
                addEvent({
                    title: "어린이날",
                    date: `${thisYear}-05-05`,
                    category: "holiday",
                    description: "어린이날 공휴일"
                });
            }
            
            // 설날 (음력 기준이라 실제로는 더 복잡)
            // 이 예제에서는 간단히 처리
            if (thisMonth === 1) { // 2월
                addEvent({
                    title: "설날",
                    date: `${thisYear}-02-10`, // 예시: 2월 10일이라고 가정
                    category: "holiday",
                    description: "설날 연휴"
                });
            }
            
            // 추석 (음력 기준)
            if (thisMonth === 8) { // 9월
                addEvent({
                    title: "추석",
                    date: `${thisYear}-09-15`, // 예시: 9월 15일이라고 가정
                    category: "holiday",
                    description: "추석 연휴"
                });
            }
            
            // 더미 일정 몇 개 추가
            const currentMonthStr = String(currentMonth + 1).padStart(2, '0');
            
            // 더미 회의 일정
            addEvent({
                title: "팀 회의",
                date: `${currentYear}-${currentMonthStr}-09`,
                category: "default",
                description: "주간 팀 회의"
            });
            
            // 더미 생일 일정
            addEvent({
                title: "성태 생일",
                date: `${currentYear}-${currentMonthStr}-12`,
                category: "important",
                description: "생일 축하 파티"
            });
            
            // 더미 데드라인 일정
            addEvent({
                title: "프로젝트 데드라인",
                date: `${currentYear}-${currentMonthStr}-16`,
                category: "important",
                description: "프로젝트 최종 제출일"
            });
            
            // 더미 정기 일정
            addEvent({
                title: "네트워크 점검",
                date: `${currentYear}-${currentMonthStr}-25`,
                category: "default",
                description: "월간 네트워크 점검"
            });
        }
        
        // 이벤트 리스너 설정
        function setupEventListeners() {
            // 이전 달 버튼
            prevMonthButton.addEventListener('click', function() {
                currentMonth--;
                if (currentMonth < 0) {
                    currentMonth = 11;
                    currentYear--;
                }
                renderCalendar();
            });
            
            // 다음 달 버튼
            nextMonthButton.addEventListener('click', function() {
                currentMonth++;
                if (currentMonth > 11) {
                    currentMonth = 0;
                    currentYear++;
                }
                renderCalendar();
            });
            
            // 오늘 버튼
            todayButton.addEventListener('click', function() {
                currentMonth = today.getMonth();
                currentYear = today.getFullYear();
                renderCalendar();
            });
            
            // 모달 닫기 버튼
            closeModalButton.addEventListener('click', function() {
                eventModal.style.display = 'none';
            });
            
            // 취소 버튼
            cancelButton.addEventListener('click', function() {
                eventModal.style.display = 'none';
            });
            
            // 배경 클릭시 모달 닫기
            window.addEventListener('click', function(event) {
                if (event.target === eventModal) {
                    eventModal.style.display = 'none';
                }
            });
            
            // 이벤트 폼 제출
            eventForm.addEventListener('submit', function(e) {
                e.preventDefault();
                const title = document.getElementById('eventTitle').value;
                const date = document.getElementById('eventDate').value;
                const category = document.getElementById('eventCategory').value;
                const description = document.getElementById('eventDesc').value;
                
                addEvent({
                    title,
                    date,
                    category,
                    description
                });
                
                eventModal.style.display = 'none';
            });
        }
        
        // 초기화 함수
        function init() {
            renderCalendar();
            setupEventListeners();
            addDefaultEvents();
        }
        
        // 페이지 로드시 초기화
        window.addEventListener('DOMContentLoaded', init);
    </script>
</body>
</html>