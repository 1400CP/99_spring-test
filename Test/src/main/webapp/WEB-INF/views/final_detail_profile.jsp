<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 편집</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif;
        }

        body {
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .profile-container {
            width: 100%;
            max-width: 500px;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .profile-header {
            position: relative;
        }

        .cover-photo {
            height: 150px;
            background-color: #87CEFA;
            width: 100%;
        }

        .profile-photo-container {
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            top: 70px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .profile-photo {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border: 4px solid white;
            object-fit: cover;
            background-color: #ddd;
        }

        .profile-name {
            margin-top: 10px;
            color: white;
            font-size: 20px;
            font-weight: bold;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.3);
        }

        .purple-section {
            background-color: #9370DB;
            height: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-top: 25px;
        }

        .form-container {
            background-color: #f0f2f5;
            padding: 20px;
            border-radius: 8px;
            margin: 20px;
            margin-top: 60px;
        }

        .form-title {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
            color: #333;
        }

        .form-title svg {
            width: 20px;
            height: 20px;
        }

        .form-group {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            margin-bottom: 15px;
        }

        .input-field {
            margin-bottom: 15px;
        }

        .input-field label {
            display: block;
            font-size: 14px;
            color: #333;
            margin-bottom: 5px;
        }

        .input-field input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            background-color: white;
        }

        .input-field input::placeholder {
            color: #999;
        }

        .full-width {
            grid-column: span 2;
        }

        .button-group {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 20px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .btn-primary {
            background-color: #00BFFF;
            color: white;
        }

        .btn-secondary {
            background-color: #f0f2f5;
            color: #333;
            border: 1px solid #ddd;
        }

        .btn:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <div class="profile-header">
            <div class="cover-photo"></div>
            <div class="purple-section"></div>
            <div class="profile-photo-container">
                <img src="" id="profile-image" class="profile-photo" alt="프로필 사진">
                <div class="profile-name">이름을자리</div>
            </div>
        </div>

        <div class="form-container">
            <div class="form-title">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M12 20h9"></path>
                    <path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path>
                </svg>
                <h2>프로필 편집</h2>
            </div>

            <form id="profile-form">
                <div class="form-group">
                    <div class="input-field">
                        <label for="name">이름</label>
                        <input type="text" id="name" name="name" placeholder="전송">
                    </div>
                    <div class="input-field">
                        <label for="contact">연락처</label>
                        <input type="text" id="contact" name="contact" placeholder="전송">
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-field">
                        <label for="password">비밀번호</label>
                        <input type="password" id="password" name="password" placeholder="전송">
                    </div>
                    <div class="input-field">
                        <label for="email">이메일</label>
                        <input type="email" id="email" name="email" placeholder="전송">
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-field">
                        <label for="password-confirm">비밀번호 확인</label>
                        <input type="password" id="password-confirm" name="password-confirm" placeholder="전송">
                    </div>
                    <div class="input-field">
                        <label for="birthdate">생년월일</label>
                        <input type="text" id="birthdate" name="birthdate" placeholder="전송">
                    </div>
                </div>

                <div class="input-field full-width">
                    <label for="status">상태메시지</label>
                    <input type="text" id="status" name="status" placeholder="전송">
                </div>

                <div class="button-group">
                    <button type="button" class="btn btn-secondary" id="cancel-btn">취소</button>
                    <button type="submit" class="btn btn-primary" id="submit-btn">수정</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // 기본 프로필 이미지 설정
            const profileImage = document.getElementById('profile-image');
            profileImage.src = 'https://via.placeholder.com/100';

            // 이미지가 로드되지 않았을 때 기본 이미지로 대체
            profileImage.onerror = function() {
                this.src = 'https://via.placeholder.com/100';
            };

            // 폼 제출 이벤트 처리
            const profileForm = document.getElementById('profile-form');
            profileForm.addEventListener('submit', function(event) {
                event.preventDefault();
                
                // 폼 데이터 수집
                const formData = new FormData(profileForm);
                const profileData = {};
                
                formData.forEach((value, key) => {
                    profileData[key] = value;
                });
                
                // 비밀번호 일치 확인
                if (profileData.password !== profileData['password-confirm']) {
                    alert('비밀번호가 일치하지 않습니다.');
                    return;
                }
                
                // 여기서 데이터를 서버로 전송하는 코드를 추가할 수 있습니다.
                console.log('프로필 데이터:', profileData);
                alert('프로필이 성공적으로 수정되었습니다.');
            });
            
            // 취소 버튼 이벤트 처리
            const cancelBtn = document.getElementById('cancel-btn');
            cancelBtn.addEventListener('click', function() {
                if (confirm('변경사항이 저장되지 않습니다. 정말 취소하시겠습니까?')) {
                    // 이전 페이지로 돌아가거나 리다이렉트
                    // window.history.back() 또는 window.location.href = '경로';
                    profileForm.reset();
                }
            });
            
            // 입력 필드에 포커스가 오면 placeholder 텍스트 지우기
            const inputFields = document.querySelectorAll('input');
            inputFields.forEach(field => {
                field.addEventListener('focus', function() {
                    this.placeholder = '';
                });
                
                field.addEventListener('blur', function() {
                    if (!this.value) {
                        this.placeholder = '전송';
                    }
                });
            });
        });
    </script>
</body>
</html>