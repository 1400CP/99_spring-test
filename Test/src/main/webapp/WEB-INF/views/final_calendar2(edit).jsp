

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일정 등록</title>
    <style>
        * {
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }
        body {
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 768px;
            margin: 0 auto;
            background-color: white;
            min-height: 100vh;
        }
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 15px;
            border-bottom: 1px solid #e0e0e0;
        }
        .back-button {
            display: flex;
            align-items: center;
            font-size: 16px;
            background: none;
            border: none;
            cursor: pointer;
        }
        .back-button span {
            margin-left: 5px;
        }
        .title {
            font-size: 18px;
            font-weight: bold;
        }
        .save-button {
            background-color: #f7f7f7;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-content {
            padding: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .color-select {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .color-circle {
            width: 24px;
            height: 24px;
            background-color: #5e72e4;
            border-radius: 50%;
            margin-right: 10px;
        }
        .input-title {
            width: 100%;
            padding: 10px;
            border: none;
            font-size: 16px;
            outline: none;
            border-bottom: 1px solid #e0e0e0;
        }
        .date-time {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .date-time-icon {
            margin-right: 15px;
        }
        .date-time-inputs {
            flex: 1;
            display: flex;
            align-items: center;
        }
        .date-input, .time-input {
            padding: 8px;
            border: 1px solid #e0e0e0;
            border-radius: 5px;
        }
        .date-input {
            width: 170px;
        }
        .time-input {
            width: 110px;
        }
        .separator {
            margin: 0 10px;
        }
        .all-day {
            display: flex;
            align-items: center;
            margin-left: 40px;
        }
        .all-day input {
            margin-right: 10px;
        }
        .description {
            position: relative;
        }
        .description textarea {
            width: 100%;
            height: 150px;
            padding: 10px;
            border: 1px solid #e0e0e0;
            border-radius: 5px;
            resize: none;
            outline: none;
        }
        .char-count {
            position: absolute;
            right: 10px;
            bottom: 10px;
            color: #999;
            font-size: 14px;
        }
        .tags {
            display: flex;
            margin-top: 20px;
        }
        .tag {
            margin-right: 10px;
            padding: 8px 15px;
            background-color: #f7f7f7;
            border-radius: 20px;
            font-size: 14px;
            cursor: pointer;
        }
        .tag.active {
            background-color: #e0e0ff;
            color: #5e72e4;
        }
        .footer {
            padding: 15px;
            display: flex;
            justify-content: flex-start;
            border-top: 1px solid #e0e0e0;
        }
        .visily-credit {
            color: #999;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <button class="back-button">
                ← <span>일정 등록</span>
            </button>
            <button class="save-button" id="saveButton">저장</button>
        </div>

        <div class="form-content">
            <div class="form-group">
                <div class="color-select">
                    <div class="color-circle"></div>
                    <input type="text" class="input-title" placeholder="일정 제목" id="eventTitle">
                </div>
            </div>

            <div class="form-group">
                <div class="date-time">
                    <div class="date-time-icon">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M12 22C17.5228 22 22 17.5228 22 12C22 6.47715 17.5228 2 12 2C6.47715 2 2 6.47715 2 12C2 17.5228 6.47715 22 12 22Z" stroke="black" stroke-width="2"/>
                            <path d="M12 6V12L16 14" stroke="black" stroke-width="2" stroke-linecap="round"/>
                        </svg>
                    </div>
                    <div class="date-time-inputs">
                        <input type="text" class="date-input" id="startDate" value="2025.04.16 수요일" readonly>
                        <input type="text" class="time-input" id="startTime" value="오후 5:00">
                        <span class="separator">~</span>
                        <input type="text" class="date-input" id="endDate" value="2025.04.16 수요일" readonly>
                        <input type="text" class="time-input" id="endTime" value="오후 6:00">
                    </div>
                </div>
                <div class="all-day">
                    <input type="checkbox" id="allDay">
                    <label for="allDay">하루 종일</label>
                </div>
            </div>

            <div class="form-group">
                <div class="description">
                    <textarea id="description" placeholder="설명 추가"></textarea>
                    <div class="char-count">0 / 2000</div>
                </div>
            </div>

            <div class="tags">
                <div class="tag" data-tag="wedding">결혼</div>
                <div class="tag" data-tag="birthday">생일</div>
                <div class="tag" data-tag="anniversary">기념일</div>
                <div class="tag" data-tag="meeting">모임</div>
            </div>
        </div>

        <div class="footer">
            <div class="visily-credit">Made with Visily</div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // 문자 수 카운트 기능
            const descriptionTextarea = document.getElementById('description');
            const charCount = document.querySelector('.char-count');
            
            descriptionTextarea.addEventListener('input', function() {
                const currentLength = this.value.length;
                charCount.textContent = currentLength + ' / 2000';
                
                // 최대 글자수 제한
                if (currentLength > 2000) {
                    this.value = this.value.substring(0, 2000);
                    charCount.textContent = '2000 / 2000';
                }
            });
            
            // 태그 선택 기능
            const tags = document.querySelectorAll('.tag');
            tags.forEach(tag => {
                tag.addEventListener('click', function() {
                    this.classList.toggle('active');
                });
            });
            
            // 하루 종일 체크박스 기능
            const allDayCheckbox = document.getElementById('allDay');
            const startTime = document.getElementById('startTime');
            const endTime = document.getElementById('endTime');
            
            allDayCheckbox.addEventListener('change', function() {
                if (this.checked) {
                    startTime.value = '오전 12:00';
                    endTime.value = '오후 11:59';
                    startTime.disabled = true;
                    endTime.disabled = true;
                } else {
                    startTime.value = '오후 5:00';
                    endTime.value = '오후 6:00';
                    startTime.disabled = false;
                    endTime.disabled = false;
                }
            });
            
            // 저장 버튼 기능
            const saveButton = document.getElementById('saveButton');
            saveButton.addEventListener('click', function() {
                const eventTitle = document.getElementById('eventTitle').value;
                const startDate = document.getElementById('startDate').value;
                const startTimeValue = document.getElementById('startTime').value;
                const endDate = document.getElementById('endDate').value;
                const endTimeValue = document.getElementById('endTime').value;
                const description = document.getElementById('description').value;
                const isAllDay = document.getElementById('allDay').checked;
                
                // 선택된 태그들 수집
                const selectedTags = [];
                document.querySelectorAll('.tag.active').forEach(tag => {
                    selectedTags.push(tag.getAttribute('data-tag'));
                });
                
                // 여기서 데이터를 서버로 전송하는 로직을 추가할 수 있습니다
                console.log({
                    title: eventTitle,
                    startDate: startDate,
                    startTime: startTimeValue,
                    endDate: endDate,
                    endTime: endTimeValue,
                    isAllDay: isAllDay,
                    description: description,
                    tags: selectedTags
                });
                
                alert('일정이 저장되었습니다!');
                // 실제로는 여기서 form을 제출하거나 AJAX 요청을 보냅니다
            });
            
            // 뒤로가기 버튼 기능
            const backButton = document.querySelector('.back-button');
            backButton.addEventListener('click', function() {
                // 페이지 뒤로가기
                history.back();
            });
        });
    </script>
</body>
</html>