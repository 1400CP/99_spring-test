<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>월별 달력</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #f5f5f5;
            padding: 20px;
        }
        
        .calendar-container {
            width: 100%;
            max-width: 500px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .year-month {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }
        
        .nav-buttons {
            display: flex;
            gap: 10px;
        }
        
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        
        button:hover {
            background-color: #45a049;
        }
        
        .weekdays {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            text-align: center;
            font-weight: bold;
            margin-bottom: 10px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
        }
        
        .days-grid {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            gap: 5px;
        }
        
        .day {
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .day:hover {
            background-color: #f0f0f0;
        }
        
        .current-day {
            background-color: #4CAF50;
            color: white;
        }
        
        .other-month {
            color: #aaa;
        }
        
        .info {
            margin-top: 20px;
            font-size: 14px;
            color: #666;
            text-align: center;
        }
        
        .leap-year {
            color: #e91e63;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="calendar-container">
        <div class="header">
            <div class="nav-buttons">
                <button id="prev-year">◀◀</button>
                <button id="prev-month">◀</button>
            </div>
            <div class="year-month" id="year-month"></div>
            <div class="nav-buttons">
                <button id="next-month">▶</button>
                <button id="next-year">▶▶</button>
            </div>
        </div>
        
        <div class="weekdays">
            <div>일</div>
            <div>월</div>
            <div>화</div>
            <div>수</div>
            <div>목</div>
            <div>금</div>
            <div>토</div>
        </div>
        
        <div class="days-grid" id="days-grid"></div>
        
        <div class="info" id="info">
            <p>현재 월: <span id="month-days"></span>일</p>
            <p id="leap-year-info"></p>
        </div>
    </div>
    
    <script>
        // 현재 날짜 정보
        let today = new Date();
        let currentMonth = today.getMonth();
        let currentYear = today.getFullYear();
        let currentDay = today.getDate();
        
        // 요일 이름 배열
        const weekdays = ["일", "월", "화", "수", "목", "금", "토"];
        
        // 월 이름 배열
        const monthNames = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
        
        // 월별 일수 계산 함수 (윤년 고려)
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
        
        // 윤년 확인 함수
        function isLeapYear(year) {
            return (year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0);
        }
        
        // 달력 그리기
        function renderCalendar() {
            // 해당 월의 첫째 날
            const firstDay = new Date(currentYear, currentMonth, 1);
            // 해당 월의 마지막 날
            const lastDay = new Date(currentYear, currentMonth, getDaysInMonth(currentYear, currentMonth));
            
            // 헤더 업데이트
            document.getElementById('year-month').innerText = `${currentYear}년 ${monthNames[currentMonth]}`;
            
            // 월별 일수 정보 업데이트
            document.getElementById('month-days').innerText = getDaysInMonth(currentYear, currentMonth);
            
            // 윤년 정보 업데이트
            const leapYearInfo = document.getElementById('leap-year-info');
            if (isLeapYear(currentYear)) {
                leapYearInfo.innerHTML = `<span class="leap-year">${currentYear}년은 윤년입니다. 2월은 29일까지 있습니다.</span>`;
            } else {
                leapYearInfo.innerText = `${currentYear}년은 평년입니다. 2월은 28일까지 있습니다.`;
            }
            
            // 달력 그리드 초기화
            const daysGrid = document.getElementById('days-grid');
            daysGrid.innerHTML = '';
            
            // 이전 달의 마지막 날들 추가
            const firstDayOfWeek = firstDay.getDay();
            if (firstDayOfWeek > 0) {
                const prevMonthLastDay = new Date(currentYear, currentMonth, 0).getDate();
                for (let i = firstDayOfWeek - 1; i >= 0; i--) {
                    const dayDiv = document.createElement('div');
                    dayDiv.className = 'day other-month';
                    dayDiv.innerText = prevMonthLastDay - i;
                    daysGrid.appendChild(dayDiv);
                }
            }
            
            // 현재 달의 날짜들 추가
            for (let i = 1; i <= getDaysInMonth(currentYear, currentMonth); i++) {
                const dayDiv = document.createElement('div');
                dayDiv.className = 'day';
                
                // 오늘 날짜 강조
                if (currentYear === today.getFullYear() && 
                    currentMonth === today.getMonth() && 
                    i === today.getDate()) {
                    dayDiv.classList.add('current-day');
                }
                
                dayDiv.innerText = i;
                daysGrid.appendChild(dayDiv);
            }
            
            // 다음 달의 첫 날들 추가
            const lastDayOfWeek = lastDay.getDay();
            if (lastDayOfWeek < 6) {
                for (let i = 1; i <= 6 - lastDayOfWeek; i++) {
                    const dayDiv = document.createElement('div');
                    dayDiv.className = 'day other-month';
                    dayDiv.innerText = i;
                    daysGrid.appendChild(dayDiv);
                }
            }
        }
        
        // 이전 달로 이동
        document.getElementById('prev-month').addEventListener('click', () => {
            currentMonth--;
            if (currentMonth < 0) {
                currentMonth = 11;
                currentYear--;
            }
            renderCalendar();
        });
        
        // 다음 달로 이동
        document.getElementById('next-month').addEventListener('click', () => {
            currentMonth++;
            if (currentMonth > 11) {
                currentMonth = 0;
                currentYear++;
            }
            renderCalendar();
        });
        
        // 이전 해로 이동
        document.getElementById('prev-year').addEventListener('click', () => {
            currentYear--;
            renderCalendar();
        });
        
        // 다음 해로 이동
        document.getElementById('next-year').addEventListener('click', () => {
            currentYear++;
            renderCalendar();
        });
        
        // 초기 달력 렌더링
        renderCalendar();
    </script>
</body>
</html>