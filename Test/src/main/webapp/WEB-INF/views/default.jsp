<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메시지</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Noto Sans KR', sans-serif;
        }
        
        body {
            background-color: #f5f5f5;
        }
        
        .container {
            display: flex;
            max-width: 1200px;
            margin: 0 auto;
            height: 100vh;
        }
        
        /* 왼쪽 사이드바 */
        .sidebar {
            width: 80px;
            background-color: #ffffff;
            border-right: 1px solid #e0e0e0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .logo {
            padding: 20px 0;
            width: 60px;
            height: 60px;
        }
        
        .logo img {
            width: 100%;
            height: 100%;
        }
        
        .nav-item {
            width: 100%;
            height: 70px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: #888;
            font-size: 12px;
            cursor: pointer;
        }
        
        .nav-item.active {
            background-color: #e6f7ff;
            color: #3498db;
            border-left: 3px solid #3498db;
        }
        
        .nav-item i {
            font-size: 24px;
            margin-bottom: 5px;
        }
        
        .sidebar-profile {
            margin-top: auto;
            padding: 15px 0;
            width: 50px;
            height: 50px;
            position: relative;
        }
        
        .sidebar-profile img {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            object-fit: cover;
        }
        
        .online-indicator {
            width: 10px;
            height: 10px;
            background-color: #2ecc71;
            border-radius: 50%;
            position: absolute;
            bottom: 15px;
            right: 0;
            border: 2px solid #fff;
        }
        
        /* 채팅 목록 영역 */
        .chat-list-container {
            width: 350px;
            background-color: #ffffff;
            border-right: 1px solid #e0e0e0;
        }
        
        .chat-list-header {
            padding: 20px;
            border-bottom: 1px solid #e0e0e0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .chat-list-header h1 {
            font-size: 24px;
            font-weight: bold;
        }
        
        .chat-list {
            overflow-y: auto;
            height: calc(100% - 70px);
        }
        
        .chat-item {
            padding: 15px 20px;
            display: flex;
            border-bottom: 1px solid #f0f0f0;
            cursor: pointer;
            position: relative;
        }
        
        .chat-item:hover {
            background-color: #f9f9f9;
        }
        
        .chat-item.active {
            background-color: #f0f0f0;
        }
        
        .chat-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 15px;
            position: relative;
        }
        
        .chat-avatar img {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            object-fit: cover;
        }
        
        .chat-content {
            flex: 1;
            overflow: hidden;
        }
        
        .chat-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 5px;
        }
        
        .chat-name {
            font-weight: bold;
            font-size: 16px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
        .chat-time {
            font-size: 12px;
            color: #888;
            white-space: nowrap;
        }
        
        .chat-message {
            font-size: 14px;
            color: #666;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
        .chat-badge {
            width: 20px;
            height: 20px;
            background-color: #e74c3c;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: bold;
            position: absolute;
            right: 20px;
            bottom: 15px;
        }
        
        /* 채팅 상세 영역 */
        .chat-detail {
            flex: 1;
            background-color: #f5f5f5;
            padding: 20px;
            position: relative;
        }
        
        .chat-detail-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .chat-detail-header img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 15px;
        }
        
        .chat-detail-info h2 {
            font-size: 18px;
            margin-bottom: 5px;
        }
        
        .participants {
            font-size: 14px;
            color: #888;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- 왼쪽 사이드바 -->
        <div class="sidebar">
            <div class="logo">
                <img src="/api/placeholder/60/60" alt="로고">
            </div>
            <div class="nav-item">
                <i>🏠</i>
                <span>홈</span>
            </div>
            <div class="nav-item active">
                <i>💬</i>
                <span>채팅</span>
            </div>
            <div class="nav-item">
                <i>📁</i>
                <span>타임랩</span>
            </div>
            <div class="nav-item">
                <i>🔔</i>
                <span>알림</span>
            </div>
            <div class="sidebar-profile">
                <img src="/api/placeholder/50/50" alt="프로필">
                <div class="online-indicator"></div>
            </div>
        </div>
        
        <!-- 채팅 목록 -->
        <div class="chat-list-container">
            <div class="chat-list-header">
                <h1>Messages</h1>
            </div>
            <div class="chat-list" id="chatList">
                <!-- 채팅 목록이 자바스크립트로 채워집니다 -->
            </div>
        </div>
        
        <!-- 채팅 상세 -->
        <div class="chat-detail">
            <div class="chat-detail-header">
                <img src="/api/placeholder/40/40" alt="채팅 프로필">
                <div class="chat-detail-info">
                    <h2>집주인 첫째 딸</h2>
                    <div class="participants">2 participants</div>
                </div>
            </div>
            <!-- 채팅 내용 영역 -->
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // 채팅 데이터
            const chatData = [
                {
                    id: 1,
                    name: '집주인 첫째 딸',
                    message: '야 어디야',
                    time: '08:00',
                    avatar: '/api/placeholder/50/50',
                    unread: 0,
                    isActive: true
                },
                {
                    id: 2,
                    name: '여자친구❤',
                    message: '어디야',
                    time: 'June 1st',
                    avatar: '/api/placeholder/50/50',
                    unread: 3,
                    isActive: false
                },
                {
                    id: 3,
                    name: '집주인',
                    message: '임마 오늘 맛있는거 사와',
                    time: 'May 26th',
                    avatar: '/api/placeholder/50/50',
                    unread: 0,
                    isActive: false
                },
                {
                    id: 4,
                    name: 'fire egg friend',
                    message: '야 근일날 ㄷㄷ ㄹㅇ',
                    time: 'May 25th',
                    avatar: '/api/placeholder/50/50',
                    unread: 6,
                    isActive: false
                },
                {
                    id: 5,
                    name: '고영훈',
                    message: '임마 프사 GD네 ㅋㅋ',
                    time: 'May 19th',
                    avatar: '/api/placeholder/50/50',
                    unread: 0,
                    isActive: false
                },
                {
                    id: 6,
                    name: '스승님',
                    message: '어? 먹 어? 하면 되는데 그걸 못해?',
                    time: 'May 15th',
                    avatar: '/api/placeholder/50/50',
                    unread: 0,
                    isActive: false
                },
                {
                    id: 7,
                    name: '간성훈',
                    message: '내 위에 버부',
                    time: 'May 26th',
                    avatar: '/api/placeholder/50/50',
                    unread: 0,
                    isActive: false
                },
                {
                    id: 8,
                    name: '세미 프로젝트 조',
                    message: '이호석 : 나는 웹게 잘생겼...',
                    time: 'May 25th',
                    avatar: '/api/placeholder/50/50',
                    unread: 8,
                    isActive: false
                }
            ];
            
            // 채팅 목록 렌더링 함수
            function renderChatList() {
                const chatListElement = document.getElementById('chatList');
                chatListElement.innerHTML = '';
                
                chatData.forEach(chat => {
                    const chatItem = document.createElement('div');
                    chatItem.className = `chat-item${chat.isActive ? ' active' : ''}`;
                    chatItem.dataset.id = chat.id;
                    
                    let chatHtml = `
                        <div class="chat-avatar">
                            <img src="${chat.avatar}" alt="${chat.name}">
                        </div>
                        <div class="chat-content">
                            <div class="chat-header">
                                <div class="chat-name">${chat.name}</div>
                                <div class="chat-time">${chat.time}</div>
                            </div>
                            <div class="chat-message">${chat.message}</div>
                        </div>
                    `;
                    
                    if (chat.unread > 0) {
                        chatHtml += `<div class="chat-badge">${chat.unread}</div>`;
                    }
                    
                    chatItem.innerHTML = chatHtml;
                    
                    // 채팅 항목 클릭 이벤트
                    chatItem.addEventListener('click', function() {
                        // 현재 활성화된 채팅 비활성화
                        const activeItems = document.querySelectorAll('.chat-item.active');
                        activeItems.forEach(item => {
                            item.classList.remove('active');
                        });
                        
                        // 클릭한 채팅 활성화
                        this.classList.add('active');
                        
                        // 채팅 데이터 업데이트
                        const chatId = parseInt(this.dataset.id);
                        chatData.forEach(chat => {
                            chat.isActive = (chat.id === chatId);
                        });
                        
                        // 채팅 상세 정보 업데이트
                        updateChatDetail(chatId);
                    });
                    
                    chatListElement.appendChild(chatItem);
                });
            }
            
            // 채팅 상세 정보 업데이트 함수
            function updateChatDetail(chatId) {
                const chat = chatData.find(c => c.id === chatId);
                if (!chat) return;
                
                const chatDetailHeader = document.querySelector('.chat-detail-header');
                chatDetailHeader.innerHTML = `
                    <img src="${chat.avatar}" alt="${chat.name}">
                    <div class="chat-detail-info">
                        <h2>${chat.name}</h2>
                        <div class="participants">2 participants</div>
                    </div>
                `;
                
                // 여기에 채팅 메시지 렌더링 코드가 추가될 수 있습니다.
            }
            
            // 초기 채팅 목록 렌더링
            renderChatList();
        });
    </script>
</body>
</html>