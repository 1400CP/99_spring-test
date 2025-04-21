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

        /* 채팅 컨테이너 */
        .chat-container {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            overflow: hidden;
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

        .chat-message {
            display: flex;
            margin-bottom: 15px;
        }

        .chat-message.user {
            justify-content: flex-end;
        }

        .chat-bubble {
            max-width: 70%;
            padding: 12px;
            border-radius: 18px;
            word-break: break-word;
            position: relative;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
        }

        .chat-message .chat-bubble {
            background-color: white;
            border-bottom-left-radius: 4px;
        }

        .chat-message.user .chat-bubble {
            background-color: #4a8cff;
            color: white;
            border-bottom-right-radius: 4px;
        }

        .chat-bubble.file {
            background-color: #f0f7ff;
            border: 1px solid #e1e1e1;
        }

        .chat-bubble.audio {
            width: 300px;
        }

        /* 메시지 입력 영역 */
        .chat-input-area {
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
        
        <!-- 채팅 컨테이너 -->
        <div class="chat-container">
            <div class="chat-messages" id="chatMessages">
                <!-- 채팅 메시지들이 여기에 추가됨 -->
            </div>
            
            <!-- 메시지 입력 영역 -->
            <div class="chat-input-area">
                <div class="chat-input-tools">
                    <button class="tool-button" id="fileButton">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/>
                            <polyline points="7 10 12 15 17 10"/>
                            <line x1="12" y1="15" x2="12" y2="3"/>
                        </svg>
                    </button>
                    <button class="tool-button" id="imageButton">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="3" y="3" width="18" height="18" rx="2" ry="2"/>
                            <circle cx="8.5" cy="8.5" r="1.5"/>
                            <polyline points="21 15 16 10 5 21"/>
                        </svg>
                    </button>
                </div>
                <input type="text" class="chat-input-field" id="messageInput" placeholder="메시지를 입력하세요...">
                <button class="chat-send-button" id="sendButton">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="22" y1="2" x2="11" y2="13"/>
                        <polygon points="22 2 15 22 11 13 2 9 22 2"/>
                    </svg>
                </button>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // 탭 전환 기능
            const tabs = document.querySelectorAll('.tab');
            tabs.forEach(tab => {
                tab.addEventListener('click', function() {
                    tabs.forEach(t => t.classList.remove('active'));
                    this.classList.add('active');
                });
            });

            // 메시지 항목 클릭 이벤트
            const messageItems = document.querySelectorAll('.message-item');
            messageItems.forEach(item => {
                item.addEventListener('click', function() {
                    messageItems.forEach(i => i.classList.remove('active'));
                    this.classList.add('active');
                    
                    // 메시지 선택 시 이름 변경
                    const name = this.querySelector('.message-name').textContent;
                    document.querySelector('.gallery-profile h2').textContent = name;
                    
                    // 대화 내용 초기화 (새로운 대화상대로 변경)
                    document.getElementById('chatMessages').innerHTML = '';
                    
                    // 초기 메시지 불러오기 - 실제로는 서버에서 가져와야 함
                    loadInitialMessages(name);
                });
            });

            
            
            // 초기 메시지 표시
            loadInitialMessages('집주인 첫째 딸');
            
            // 메시지 전송 기능
            const messageInput = document.getElementById('messageInput');
            const sendButton = document.getElementById('sendButton');
            const fileButton = document.getElementById('fileButton');
            const imageButton = document.getElementById('imageButton');
            
            // 메시지 전송 함수
            function sendMessage() {
                const messageText = messageInput.value.trim();
                if (messageText !== '') {
                    // 사용자 메시지 추가
                    addMessage('user', 'text', messageText);
                    
                    // 입력 필드 초기화
                    messageInput.value = '';
                    
                    // 자동 응답 (실제 서비스에서는 서버로 전송하고 응답을 받아야 함)
                    setTimeout(() => {
                        const responses = [
                            '알겠어요!',
                            '네, 확인했습니다.',
                            '그렇군요. 더 필요한 것이 있으신가요?',
                            '감사합니다.',
                            '조금만 기다려주세요.'
                        ];
                        const randomResponse = responses[Math.floor(Math.random() * responses.length)];
                        addMessage('owner', 'text', randomResponse);
                    }, 1000);
                }
            }
            
            // 전송 버튼 클릭 이벤트
            sendButton.addEventListener('click', sendMessage);
            
            // 엔터 키 입력 이벤트
            messageInput.addEventListener('keypress', function(e) {
                if (e.key === 'Enter' && !e.shiftKey) {
                    e.preventDefault(); // 폼 제출 방지
                    sendMessage();
                }
            });
            
            // 파일 첨부 기능
            fileButton.addEventListener('click', function() {
                // 실제로는 파일 선택 다이얼로그를 열고 파일을 선택하도록 해야 함
                // 여기서는 데모를 위해 가상의 파일을 첨부
                addMessage('user', 'file', { filename: '새문서.pdf', size: '250kB' });
                
                // 자동 응답
                setTimeout(() => {
                    addMessage('owner', 'text', '파일을 받았습니다. 확인해볼게요.');
                }, 1000);
            });
            
            // 이미지 첨부 기능
            imageButton.addEventListener('click', function() {
                // 실제로는 이미지 선택 다이얼로그를 열고 이미지를 선택하도록 해야 함
                // 여기서는 데모를 위해 가상의 이미지를 첨부
                addMessage('user', 'image', 'https://via.placeholder.com/300/cccccc/666666?text=이미지');
            });
        });
        
        // 초기 메시지 불러오기 함수
        function loadInitialMessages(contactName) {
            // 실제로는 서버에서 해당 대화상대와의 메시지 기록을 가져와야 함
            // 여기서는 데모를 위해 고정된 메시지 세트를 사용
            
            const messagesByContact = {
                '집주인 첫째 딸': [
                    { sender: 'owner', type: 'text', content: '이거 어때? 방에 놔두려고 답장 빨리 해' },
                    { sender: 'user', type: 'text', content: '그냥 깡패여 나쁘지 않네, 이거나 고쳐줘봐' },
                    { sender: 'user', type: 'file', filename: '자소서.pdf', size: '120kB' },
                    { sender: 'owner', type: 'file', filename: '수정본.pdf', size: '150kB' },
                    { sender: 'owner', type: 'text', content: '너 연습좀 더 해야겠다. 자소서 왜케 못쓰냐?' }
                ],
                '여자친구❤': [
                    { sender: 'owner', type: 'text', content: '어디야' },
                    { sender: 'user', type: 'text', content: '지금 가는 중' },
                    { sender: 'owner', type: 'text', content: '언제 오는데' },
                    { sender: 'user', type: 'text', content: '15분 뒤에' }
                ],
                '집주인': [
                    { sender: 'owner', type: 'text', content: '일마 오늘 맛있는거 사와' },
                    { sender: 'user', type: 'text', content: '네 무슨 음식 드시고 싶으세요?' },
                    { sender: 'owner', type: 'text', content: '치킨 사와' }
                ]
            };
            
            // 해당 대화상대의 메시지가 있으면 표시, 없으면 빈 대화
            const messages = messagesByContact[contactName] || [];
            messages.forEach(msg => {
                if (msg.type === 'text') {
                    addMessage(msg.sender, 'text', msg.content);
                } else if (msg.type === 'file') {
                    addMessage(msg.sender, 'file', { filename: msg.filename, size: msg.size });
                } else if (msg.type === 'image') {
                    addMessage(msg.sender, 'image', msg.content);
                } else if (msg.type === 'audio') {
                    addMessage(msg.sender, 'audio', msg.duration);
                }
            });
        }
        
        // 메시지 추가 함수
        function addMessage(sender, type, content) {
            const chatMessages = document.getElementById('chatMessages');
            const messageDiv = document.createElement('div');
            messageDiv.classList.add('chat-message');
            
            if (sender === 'user') {
                messageDiv.classList.add('user');
            }
            
            const bubble = document.createElement('div');
            bubble.classList.add('chat-bubble');
            
            if (type === 'text') {
                bubble.textContent = content;
            } else if (type === 'file') {
                bubble.classList.add('file');
                bubble.innerHTML = `
                    <strong>${content.filename}</strong><br>
                    <small>${content.size}</small>
                `;
            } else if (type === 'image') {
                bubble.innerHTML = `
                    <img src="${content}" alt="첨부 이미지" style="max-width: 200px; border-radius: 8px;">
                `;
            } else if (type === 'audio') {
                bubble.classList.add('audio');
                bubble.innerHTML = `
                    <audio controls style="width: 100%;">
                        <source src="#" type="audio/mpeg">
                        오디오를 지원하지 않는 브라우저입니다.
                    </audio>
                    <small>${content}</small>
                `;
            }
            
            messageDiv.appendChild(bubble);
            chatMessages.appendChild(messageDiv);
            
            // 스크롤을 맨 아래로 이동
            chatMessages.scrollTop = chatMessages.scrollHeight;
            
            // 메시지 미리보기 업데이트 (나중에 선택한 대화상대의 미리보기만 업데이트하도록 수정 필요)
            if (type === 'text' && sender === 'user') {
                updateMessagePreview(document.querySelector('.message-item.active'), content);
            }
        }
        
        // 메시지 미리보기 업데이트 함수
        function updateMessagePreview(messageItem, previewText) {
            if (messageItem) {
                const previewElement = messageItem.querySelector('.message-preview');
                if (previewElement) {
                    previewElement.textContent = previewText;
                }
            }
        }
    </script>
</body>
</html>