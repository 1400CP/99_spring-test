<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메시지 갤러리</title>
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
        }

        .gallery-header {
            padding: 20px;
            border-bottom: 1px solid #e1e1e1;
            display: flex;
            align-items: center;
        }

        .gallery-profile {
            display: flex;
            align-items: center;
        }

        .gallery-profile-img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 15px;
            overflow: hidden;
        }

        .gallery-profile-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .gallery-tabs {
            display: flex;
            margin-left: 20px;
            border-bottom: 1px solid #e1e1e1;
        }

        .gallery-tab {
            padding: 10px 20px;
            cursor: pointer;
            margin-right: 10px;
            position: relative;
        }

        .gallery-tab.active::after {
            content: '';
            position: absolute;
            bottom: -1px;
            left: 0;
            width: 100%;
            height: 2px;
            background-color: #4a8cff;
        }

        .gallery-count {
            margin-left: auto;
            color: #888;
        }

        .gallery-date {
            padding: 10px 20px;
            color: #666;
            font-size: 14px;
            border-bottom: 1px solid #e1e1e1;
        }

        .gallery-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            padding: 20px;
            overflow-y: auto;
        }

        .gallery-item {
            position: relative;
            aspect-ratio: 1 / 1;
            overflow: hidden;
            border-radius: 4px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .gallery-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .file-info {
            position: absolute;
            bottom: 0;
            right: 0;
            background-color: white;
            padding: 10px;
            border-top-left-radius: 4px;
            font-size: 12px;
            border: 1px solid #e1e1e1;
        }

        .file-title {
            font-weight: bold;
            margin-bottom: 3px;
        }

        .file-size {
            color: #666;
        }

        /* 채팅 영역 */
        .chat-container {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            overflow: hidden;
        }

        .chat-tabs {
            display: flex;
            border-bottom: 1px solid #e1e1e1;
            background-color: #fff;
        }

        .chat-tab {
            padding: 15px 25px;
            cursor: pointer;
            position: relative;
            font-size: 14px;
            color: #555;
        }

        .chat-tab.active {
            color: #4a8cff;
            font-weight: bold;
        }

        .chat-tab.active::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 2px;
            background-color: #4a8cff;
        }

        .chat-messages {
            flex-grow: 1;
            overflow-y: auto;
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 15px;
            background-color: #f5f5f5;
        }

        .message-bubble {
            max-width: 70%;
            padding: 12px 15px;
            border-radius: 18px;
            position: relative;
            word-break: break-word;
        }

        .message-time {
            font-size: 11px;
            color: #888;
            margin-top: 5px;
            white-space: nowrap;
        }

        .message-left, .message-right {
            display: flex;
            gap: 8px;
            align-items: flex-end;
        }

        .message-left {
            align-self: flex-start;
        }

        .message-right {
            align-self: flex-end;
            flex-direction: row-reverse;
        }

        .message-left .message-bubble {
            background-color: white;
            border: 1px solid #e1e1e1;
            border-bottom-left-radius: 5px;
        }

        .message-right .message-bubble {
            background-color: #4a8cff;
            color: white;
            border-bottom-right-radius: 5px;
        }

        .message-right .message-time {
            text-align: right;
        }

        .message-date {
            align-self: center;
            background-color: rgba(0, 0, 0, 0.1);
            color: #666;
            font-size: 12px;
            padding: 5px 15px;
            border-radius: 15px;
            margin: 10px 0;
        }

        .file-message {
            display: flex;
            gap: 10px;
            align-items: center;
            background-color: #f9f9f9;
            padding: 10px;
            border-radius: 10px;
            margin-top: 5px;
            border: 1px solid #e1e1e1;
        }

        .file-icon {
            font-size: 24px;
            color: #4a8cff;
        }

        .file-message-info {
            display: flex;
            flex-direction: column;
        }

        .file-message-name {
            font-weight: bold;
        }

        .file-message-size {
            font-size: 12px;
            color: #666;
        }

        .image-message {
            max-width: 200px;
            border-radius: 10px;
            overflow: hidden;
            margin-top: 5px;
        }

        .image-message img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }

        .audio-message {
            display: flex;
            align-items: center;
            background-color: #f0f0f0;
            border-radius: 20px;
            padding: 8px 15px;
            margin-top: 5px;
        }

        .audio-play {
            width: 30px;
            height: 30px;
            background-color: #4a8cff;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
            color: white;
            cursor: pointer;
        }

        .audio-waveform {
            flex-grow: 1;
            height: 20px;
            background-image: url('data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgogIDxwYXRoIGQ9Ik0wLDEwIFExMCwzMCAyMCwxMCBUNDAsMTAgVDYwLDEwIFQ4MCwxMCBUMTAwLDEwIFQxMjAsMTAgVDE0MCwxMCBUMTYwLDEwIFQxODAsMTAgVDIwMCwxMCIgc3Ryb2tlPSIjNGE4Y2ZmIiBmaWxsPSJub25lIi8+Cjwvc3ZnPg==');
            background-size: contain;
            background-repeat: no-repeat;
        }

        .audio-duration {
            margin-left: 10px;
            font-size: 12px;
            color: #666;
        }

        .chat-input-container {
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
            border-radius: 50%;
        }

        .tool-button:hover {
            background-color: #f0f0f0;
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

        .chat-input-field:focus {
            border-color: #4a8cff;
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

        /* 갤러리 탭 컨텐츠 */
        .tab-content {
            flex-grow: 1;
            overflow-y: auto;
            display: none;
        }

        .tab-content.active {
            display: flex;
            flex-direction: column;
        }

        /* 반응형 디자인 */
        @media (max-width: 900px) {
            .sidebar {
                width: 70px;
            }
            
            .message-sidebar {
                width: 250px;
            }
            
            .gallery-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 600px) {
            .sidebar {
                width: 60px;
            }
            
            .message-sidebar {
                width: 200px;
            }
            
            .gallery-grid {
                grid-template-columns: 1fr;
            }
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
    <div class="message-sidebar">
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

    <!-- 메인 콘텐츠 -->
    <div class="main-content">
        <div class="gallery-header">
            <div class="gallery-profile">
                <div class="gallery-profile-img">
                    <img src="https://via.placeholder.com/50/4a8cff/ffffff?text=팀" alt="프로필">
                </div>
                <h2>집주인 첫째 딸</h2>
            </div>
        </div>

        <!-- 채팅 탭 추가 -->
        <div class="chat-tabs">
            <div class="chat-tab active">채팅</div>
            <div class="chat-tab">사진</div>
            <div class="chat-tab">파일</div>
        </div>

        <!-- 채팅 탭 컨텐츠 -->
        <div class="tab-content active">
            <div class="chat-container">
                <div class="chat-messages">
                    <div class="message-date">2025년 4월 20일</div>
                    
                    <div class="message-left">
                        <div class="profile-img">
                            <img src="https://via.placeholder.com/40/4a8cff/ffffff?text=팀" alt="프로필">
                        </div>
                        <div>
                            <div class="message-bubble">
                                아 어디야
                            </div>
                            <div class="message-time">오전 11:30</div>
                        </div>
                    </div>

                    <div class="message-right">
                        <div>
                            <div class="message-bubble">
                                나 곧 도착할 것 같아
                            </div>
                            <div class="message-time">오전 11:45</div>
                        </div>
                    </div>

                    <div class="message-left">
                        <div class="profile-img">
                            <img src="https://via.placeholder.com/40/4a8cff/ffffff?text=팀" alt="프로필">
                        </div>
                        <div>
                            <div class="message-bubble">
                                이거 어때?
                                <div class="image-message">
                                    <img src="https://via.placeholder.com/300/eee/999?text=사이드+테이블" alt="사이드 테이블">
                                </div>
                            </div>
                            <div class="message-time">오후 1:12</div>
                        </div>
                    </div>

                    <div class="message-left">
                        <div class="profile-img">
                            <img src="https://via.placeholder.com/40/4a8cff/ffffff?text=팀" alt="프로필">
                        </div>
                        <div>
                            <div class="message-bubble">
                                이거 어디에 방에 놓으려고 해
                            </div>
                            <div class="message-time">오후 1:12</div>
                        </div>
                    </div>

                    <div class="message-right">
                        <div>
                            <div class="message-bubble">
                                그냥 갤러리 나보자 언제나 너보다 고자질해
                            </div>
                            <div class="message-time">오후 1:15</div>
                        </div>
                    </div>

                    <div class="message-right">
                        <div>
                            <div class="message-bubble">
                                아 이거네
                                <div class="file-message">
                                    <div class="file-icon">📄</div>
                                    <div class="file-message-info">
                                        <div class="file-message-name">자소서.pdf</div>
                                        <div class="file-message-size">120 kB</div>
                                    </div>
                                </div>
                            </div>
                            <div class="message-time">오후 1:17</div>
                        </div>
                    </div>

                    <div class="message-left">
                        <div class="profile-img">
                            <img src="https://via.placeholder.com/40/4a8cff/ffffff?text=팀" alt="프로필">
                        </div>
                        <div>
                            <div class="message-bubble">
                                너 연습좀 더 해야겠다. 자소서 엉망이야.
                                <div class="file-message">
                                    <div class="file-icon">📄</div>
                                    <div class="file-message-info">
                                        <div class="file-message-name">수정본.pdf</div>
                                        <div class="file-message-size">150 kB</div>
                                    </div>
                                </div>
                            </div>
                            <div class="message-time">오후 2:12</div>
                        </div>
                    </div>

                    <div class="message-left">
                        <div class="profile-img">
                            <img src="https://via.placeholder.com/40/4a8cff/ffffff?text=팀" alt="프로필">
                        </div>
                        <div>
                            <div class="message-bubble">
                                너 연습좀 더 해야겠다. 자소서 엉망이야 파트 꼭 고쳐
                            </div>
                            <div class="message-time">오후 2:12</div>
                        </div>
                    </div>

                    <div class="message-right">
                        <div>
                            <div class="message-bubble">
                                <div class="audio-message">
                                    <div class="audio-play">▶</div>
                                    <div class="audio-waveform"></div>
                                    <div class="audio-duration">0:56</div>
                                </div>
                            </div>
                            <div class="message-time">오후 2:25</div>
                        </div>
                    </div>
                </div>

                <div class="chat-input-container">
                    <div class="chat-input-tools">
                        <button class="tool-button">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <rect x="3" y="3" width="18" height="18" rx="2" ry="2"/>
                                <circle cx="8.5" cy="8.5" r="1.5"/>
                                <polyline points="21 15 16 10 5 21"/>
                            </svg>
                        </button>
                        <button class="tool-button">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/>
                                <polyline points="7 10 12 15 17 10"/>
                                <line x1="12" y1="15" x2="12" y2="3"/>
                            </svg>
                        </button>
                    </div>
                    <input type="text" class="chat-input-field" placeholder="메시지를 입력하세요...">
                    <button class="chat-send-button">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <line x1="22" y1="2" x2="11" y2="13"/>
                            <polygon points="22 2 15 22 11 13 2 9 22 2"/>
                        </svg>
                    </button>
                </div>
            </div>
        </div>

        <!-- 사진 탭 컨텐츠 -->
        <div class="tab-content">
            <div class="gallery-grid">
                <div class="gallery-item">
                    <img src="https://via.placeholder.com/300/eee/999?text=사이드+테이블" alt="사이드 테이블">
                </div>
                <div class="gallery-item">
                    <img src="https://via.placeholder.com/300/f0f0f0/888?text=책상" alt="책상">
                </div>
                <div class="gallery-item">
                    <img src="https://via.placeholder.com/