<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat, java.util.Calendar" %>
<%
    // 현재 날짜/시간 정보 가져오기
    Date now = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
    SimpleDateFormat dayFormat = new SimpleDateFormat("E요일");
    
    String today = dateFormat.format(now);
    String dayOfWeek = dayFormat.format(now);
    
    // 현재 시간 정보
    Calendar cal = Calendar.getInstance();
    int hour = cal.get(Calendar.HOUR_OF_DAY);
    int minute = cal.get(Calendar.MINUTE);
    
    // 시간 반올림 (10분 단위)
    minute = (minute / 10) * 10;
    
    String ampm = hour < 12 ? "오전" : "오후";
    int displayHour = hour % 12;
    if (displayHour == 0) displayHour = 12;
    
    String currentTime = String.format("%s %d:%02d", ampm, displayHour, minute);
    
    // 종료 시간은 1시간 후로 설정
    cal.add(Calendar.HOUR_OF_DAY, 1);
    hour = cal.get(Calendar.HOUR_OF_DAY);
    minute = cal.get(Calendar.MINUTE);
    
    ampm = hour < 12 ? "오전" : "오후";
    displayHour = hour % 12;
    if (displayHour == 0) displayHour = 12;
    
    String endTime = String.format("%s %d:%02d", ampm, displayHour, minute);
%>
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
            flex-wrap: wrap;
        }
        .date-input {
            padding: 8px;
            border: 1px solid #e0e0e0;
            border-radius: 5px;
            width: 170px;
            margin-right: 5px;
        }
        .time-wrapper {
            display: flex;
            align-items: center;
        }
        .ampm-select {
            padding: 8px;
            border: 1px solid #e0e0e0;
            border-radius: 5px;
            margin-right: 5px;
        }
        .time-input {
            width: 70px;
            padding: 8px;
            border: 1px solid #e0e0e0;
            border-radius: 5px;
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
        .hashtag-container {
            margin-top: 20px;
        }
        .hashtag-input {
            width: 100%;
            padding: 10px;
            border: 1px solid #e0e0e0;
            border-radius: 5px;
        }
        .hashtag-list {
            display: flex;
            flex-wrap: wrap;
            margin-top: 10px;
            gap: 8px;
        }
        .hashtag {
            background-color: #e0e0ff;
            color: #5e72e4;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 14px;
            display: flex;
            align-items: center;
        }
        .hashtag .remove {
            margin-left: 5px;
            cursor: pointer;
            font-size: 18px;
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
            <button type="button" class="back-button" onclick="history.back()">
                ← <span>일정 등록</span>
            </button>
            <button type="submit" class="save-button" form="eventForm">저장</button>
        </div>

        <form id="eventForm" action="saveEvent.jsp" method="post">
            <div class="form-content">
                <div class="form-group">
                    <div class="color-select">
                        <div class="color-circle"></div>
                        <input type="text" class="input-title" placeholder="일정 제목" id="eventTitle" name="eventTitle" required>
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
                            <div style="display: flex; align-items: center; margin-bottom: 10px; width: 100%;">
                                <input type="text" class="date-input" id="startDate" name="startDate" value="<%= today %> <%= dayOfWeek %>" readonly>
                                <div class="time-wrapper">
                                    <select class="ampm-select" id="startAmPm" name="startAmPm">
                                        <option value="오전" <%= ampm.equals("오전") ? "selected" : "" %>>오전</option>
                                        <option value="오후" <%= ampm.equals("오후") ? "selected" : "" %>>오후</option>
                                    </select>
                                    <input type="text" class="time-input" id="startTime" name="startTime" value="<%= displayHour %>:<%= String.format("%02d", minute) %>">
                                </div>
                            </div>
                            <div style="width: 100%; display: flex; align-items: center;">
                                <span class="separator">~</span>
                            </div>
                            <div style="display: flex; align-items: center; margin-top: 10px; width: 100%;">
                                <input type="text" class="date-input" id="endDate" name="endDate" value="<%= today %> <%= dayOfWeek %>" readonly>
                                <div class="time-wrapper">
                                    <select class="ampm-select" id="endAmPm" name="endAmPm">
                                        <option value="오전" <%= ampm.equals("오전") ? "selected" : "" %>>오전</option>
                                        <option value="오후" <%= ampm.equals("오후") ? "selected" : "" %>>오후</option>
                                    </select>
                                    <input type="text" class="time-input" id="endTime" name="endTime" value="<%= displayHour %>:<%= String.format("%02d", minute) %>">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="all-day">
                        <input type="checkbox" id="allDay" name="allDay">
                        <label for="allDay">하루 종일</label>
                    </div>
                </div>

                <div class="form-group">
                    <div class="description">
                        <textarea id="description" name="description" placeholder="설명 추가"></textarea>
                        <div class="char-count">0 / 2000</div>
                    </div>
                </div>

                <div class="hashtag-container">
                    <input type="text" class="hashtag-input" id="hashtagInput" placeholder="#태그 추가 (엔터키로 구분)">
                    <div class="hashtag-list" id="hashtagList"></div>
                    <input type="hidden" id="hashtagValues" name="hashtags" value="">
                </div>
            </div>
        </form>
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
            
            // 하루 종일 체크박스 기능
            const allDayCheckbox = document.getElementById('allDay');
            const startAmPm = document.getElementById('startAmPm');
            const startTime = document.getElementById('startTime');
            const endAmPm = document.getElementById('endAmPm');
            const endTime = document.getElementById('endTime');
            
            allDayCheckbox.addEventListener('change', function() {
                if (this.checked) {
                    startAmPm.value = '오전';
                    startTime.value = '12:00';
                    endAmPm.value = '오후';
                    endTime.value = '11:59';
                    startAmPm.disabled = true;
                    startTime.disabled = true;
                    endAmPm.disabled = true;
                    endTime.disabled = true;
                } else {
                    startAmPm.disabled = false;
                    startTime.disabled = false;
                    endAmPm.disabled = false;
                    endTime.disabled = false;
                }
            });
            
            // 해시태그 기능
            const hashtagInput = document.getElementById('hashtagInput');
            const hashtagList = document.getElementById('hashtagList');
            const hashtagValues = document.getElementById('hashtagValues');
            let hashtags = [];
            
            // 해시태그 입력 처리
            hashtagInput.addEventListener('keypress', function(e) {
                if (e.key === 'Enter') {
                    e.preventDefault();
                    
                    let tagText = this.value.trim();
                    if (!tagText) return;
                    
                    // # 없으면 추가
                    if (!tagText.startsWith('#')) {
                        tagText = '#' + tagText;
                    }
                    
                    // 중복 방지
                    if (!hashtags.includes(tagText)) {
                        addHashtag(tagText);
                        this.value = '';
                    } else {
                        alert('이미 추가된 태그입니다.');
                    }
                }
            });
            
            // 해시태그 추가 함수
            function addHashtag(tag) {
                hashtags.push(tag);
                
                const tagElement = document.createElement('div');
                tagElement.className = 'hashtag';
                tagElement.innerHTML = `
                    ${tag}
                    <span class="remove">&times;</span>
                `;
                
                const removeButton = tagElement.querySelector('.remove');
                removeButton.addEventListener('click', function() {
                    hashtagList.removeChild(tagElement);
                    hashtags = hashtags.filter(t => t !== tag);
                    updateHashtagValues();
                });
                
                hashtagList.appendChild(tagElement);
                updateHashtagValues();
            }
            
            // 해시태그 hidden input 업데이트
            function updateHashtagValues() {
                hashtagValues.value = hashtags.join(',');
            }
            
            // 폼 제출 전 유효성 검사
            document.getElementById('eventForm').addEventListener('submit', function(e) {
                const eventTitle = document.getElementById('eventTitle').value;
                if (!eventTitle.trim()) {
                    e.preventDefault();
                    alert('일정 제목을 입력해주세요.');
                    return;
                }
                
                // 여기에 더 많은 유효성 검사를 추가할 수 있습니다
            });
        });
    </script>
</body>
</html>