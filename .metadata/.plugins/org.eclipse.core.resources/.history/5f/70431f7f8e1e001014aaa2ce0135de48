<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일정 등록</title>
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
    }
    
    .container {
        max-width: 500px;
        margin: 0 auto;
        background-color: #fff;
        height: 100vh;
    }
    
    .header {
        display: flex;
        align-items: center;
        padding: 16px;
        border-bottom: 1px solid #eee;
        position: relative;
    }
    
    .header h1 {
        margin: 0 auto;
        font-size: 18px;
        text-align: center;
        flex-grow: 1;
    }
    
    .back-button {
        display: flex;
        align-items: center;
        background: none;
        border: none;
        cursor: pointer;
        font-size: 16px;
    }
    
    .save-button {
        background: none;
        border: none;
        color: #333;
        font-weight: bold;
        cursor: pointer;
    }
    
    .form-container {
        padding: 20px;
    }
    
    .form-group {
        margin-bottom: 24px;
    }
    
    .form-group.with-icon {
        display: flex;
        align-items: center;
    }
    
    .form-icon {
        width: 24px;
        height: 24px;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-right: 12px;
        color: #6200ee;
    }
    
    .form-input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 16px;
    }
    
    .form-textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 16px;
        resize: none;
        min-height: 100px;
    }
    
    .text-counter {
        text-align: right;
        font-size: 12px;
        color: #888;
        margin-top: 4px;
    }
    
    .date-time-container {
        display: flex;
        align-items: center;
        gap: 8px;
    }
    
    .date-input, .time-input {
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 14px;
    }
    
    .option-group {
        display: flex;
        gap: 20px;
        margin-top: 12px;
    }
    
    .option-item {
        display: flex;
        align-items: center;
    }
    
    .radio-input {
        margin-right: 6px;
    }
    
    .select-input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 16px;
        background-color: #fff;
    }
    
    .tag-container {
        display: flex;
        gap: 8px;
        margin-top: 20px;
    }
    
    .tag {
        padding: 8px 16px;
        border-radius: 20px;
        background-color: #f5f5f5;
        font-size: 14px;
        cursor: pointer;
    }
    
    .tag.selected {
        background-color: #e0e0e0;
    }
    
    .purple-dot {
        display: inline-block;
        width: 10px;
        height: 10px;
        background-color: #6200ee;
        border-radius: 50%;
        margin-right: 8px;
    }
    
    .submit-button {
        display: block;
        width: 100%;
        padding: 12px;
        background-color: #6200ee;
        color: #fff;
        border: none;
        border-radius: 4px;
        font-size: 16px;
        cursor: pointer;
        margin-top: 16px;
    }
    
    .alert-container {
        background-color: #f5f5f5;
        border-radius: 4px;
        padding: 8px 16px;
        margin-top: 12px;
        display: flex;
        align-items: center;
    }
    
    .alert-icon {
        margin-right: 8px;
    }
    </style>
</head>
<body>
    <div class="container">
    <div class="header">
        <button class="back-button">
        ← 일정 등록
        </button>
        <button class="save-button">저장</button>
    </div>
    
    <div class="form-container">
        <div class="form-group">
        <div style="display: flex; align-items: center; margin-bottom: 12px;">
            <span class="purple-dot"></span>
            <span>일정 제목</span>
        </div>
        </div>
        
        <div class="form-group with-icon">
        <div class="form-icon">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M12 2C6.5 2 2 6.5 2 12C2 17.5 6.5 22 12 22C17.5 22 22 17.5 22 12C22 6.5 17.5 2 12 2ZM12 20C7.59 20 4 16.41 4 12C4 7.59 7.59 4 12 4C16.41 4 20 7.59 20 12C20 16.41 16.41 20 12 20ZM12.5 7H11V13L16.2 16.2L17 14.9L12.5 12.2V7Z" fill="#6200ee"/>
            </svg>
        </div>
        <div style="flex-grow: 1;">
            <div class="date-time-container">
            <input type="text" class="date-input" value="2025.04.16 수요일" readonly>
            <span>오후 5:00</span>
            </div>
            <div class="date-time-container" style="margin-top: 8px;">
            <span>~</span>
            <input type="text" class="date-input" value="2025.04.16 수요일" readonly>
            <span>오후 6:00</span>
            </div>
            <div class="option-group">
            <div class="option-item">
                <input type="radio" id="all-day" name="time-option" class="radio-input">
                <label for="all-day">하루 종일</label>
            </div>
            <div class="option-item">
                <input type="radio" id="specific-time" name="time-option" class="radio-input" checked>
                <label for="specific-time">종일</label>
            </div>
            <div class="option-item">
                <span style="color: #888;">시간대 없음</span>
            </div>
            </div>
        </div>
        </div>
        
        <div class="form-group with-icon">
        <div class="form-icon">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M19 3H5C3.9 3 3 3.9 3 5V19C3 20.1 3.9 21 5 21H19C20.1 21 21 20.1 21 19V5C21 3.9 20.1 3 19 3ZM19 5V19H5V5H19ZM17 12H12V17H10V12H7V10H10V7H12V10H17V12Z" fill="#6200ee"/>
            </svg>
        </div>
        <select class="select-input">
            <option>내 캘린더</option>
        </select>
        </div>
        
        <div class="form-group with-icon">
        <div class="form-icon">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M12 2C8.13 2 5 5.13 5 9C5 14.25 12 22 12 22C12 22 19 14.25 19 9C19 5.13 15.87 2 12 2ZM12 11.5C10.62 11.5 9.5 10.38 9.5 9C9.5 7.62 10.62 6.5 12 6.5C13.38 6.5 14.5 7.62 14.5 9C14.5 10.38 13.38 11.5 12 11.5Z" fill="#6200ee"/>
            </svg>
        </div>
        <input type="text" class="form-input" placeholder="장소 입력">
        </div>
        
        <div class="form-group with-icon">
        <div class="form-icon">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M12 4C7 4 2.73 7.11 1 11.5C2.73 15.89 7 19 12 19C17 19 21.27 15.89 23 11.5C21.27 7.11 17 4 12 4ZM12 16.5C9.24 16.5 7 14.26 7 11.5C7 8.74 9.24 6.5 12 6.5C14.76 6.5 17 8.74 17 11.5C17 14.26 14.76 16.5 12 16.5ZM12 8.5C10.34 8.5 9 9.84 9 11.5C9 13.16 10.34 14.5 12 14.5C13.66 14.5 15 13.16 15 11.5C15 9.84 13.66 8.5 12 8.5Z" fill="#6200ee"/>
            </svg>
        </div>
        <button class="form-input" style="text-align: left; background: white;">만날 수 있음</button>
        </div>
        
        <div class="form-group with-icon">
        <div class="form-icon">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M12 22C6.49 22 2 17.51 2 12C2 6.49 6.49 2 12 2C17.51 2 22 6.49 22 12C22 17.51 17.51 22 12 22ZM12 20C16.42 20 20 16.42 20 12C20 7.58 16.42 4 12 4C7.58 4 4 7.58 4 12C4 16.42 7.58 20 12 20ZM14.59 8.59L16 10L12 14L8 10L9.41 8.59L12 11.17L14.59 8.59Z" fill="#6200ee"/>
            </svg>
        </div>
        <select class="select-input">
            <option>10분 전</option>
        </select>
        </div>
        
        <div class="form-group">
        <input type="text" class="form-input" placeholder="참석자 찾기 입력">
        </div>
        
        <div class="form-group">
        <textarea class="form-textarea" placeholder="설명 추가"></textarea>
        <div class="text-counter">0 / 2000</div>
        </div>
        
        <div class="tag-container">
        <div class="tag">교육</div>
        <div class="tag">생일</div>
        <div class="tag">기념일</div>
        <div class="tag">모임</div>
        </div>
        
        <button class="submit-button">일정 추가</button>
    </div>
    </div>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const textArea = document.querySelector('.form-textarea');
        const textCounter = document.querySelector('.text-counter');
        const saveButton = document.querySelector('.save-button');
        const submitButton = document.querySelector('.submit-button');
        const tagButtons = document.querySelectorAll('.tag');
        
        // 텍스트 영역 글자수 카운터
        textArea.addEventListener('input', function() {
        const length = this.value.length;
        textCounter.textContent = `${length} / 2000`;
        });
        
        // 태그 선택
        tagButtons.forEach(tag => {
        tag.addEventListener('click', function() {
            this.classList.toggle('selected');
        });
        });
        
        // 저장 버튼 클릭 이벤트
        saveButton.addEventListener('click', function() {
        alert('일정이 저장되었습니다.');
        });
        
        // 일정 추가 버튼 클릭 이벤트
        submitButton.addEventListener('click', function() {
        alert('일정이 추가되었습니다.');
        });
    });
    </script>
</body>
</html>