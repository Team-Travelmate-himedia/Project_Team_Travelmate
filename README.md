# ✈️ GetSetGo! - 나만의 맞춤형 여행 일정 플래너

> **"고민만 하던 여행 계획을 GetSetGo!를 통해 빠르게 만들고 함께 공유해보세요!"**
> 
> **GetSetGo!**는 마이로(MYRO) 벤치마킹을 기반으로 기획된 여행 일정 플래너 웹 플랫폼입니다.  
> 여행지와 숙소 검색부터 위치 기반 지도 맵핑, 카테고리별 찜꽁(Wishlist) 기능, 고유 코드를 활용한 실시간 일정 공유 기능까지 제공하여 손쉬운 여행 계획 작성을 돕습니다.

---

## 📌 목차

1. [프로젝트 개요](#1-프로젝트-개요)
2. [기술 스택 (Tech Stack)](#2-기술-스택-tech-stack)
3. [주요 기능 및 시스템 구조](#3-주요-기능-및-시스템-구조)
4. [데이터베이스 설계 (ERD)](#4-데이터베이스-설계-erd)
5. [개발 일정 및 프로세스](#5-개발-일정-및-프로세스)
6. [시작하기 (Getting Started)](#6-시작하기-getting-started)
7. [프로젝트 아쉬운 점 및 회고](#7-프로젝트-아쉬운-점-및-회고)

---

## 1. 프로젝트 개요

* **프로젝트명**: GetSetGo! (팀 Team Travelmate)
* **주요 타겟층**: 20~40대 (한눈에 여행 일정을 정리·관리하고 타인과 공유하고 싶은 사용자)
* **개발 목표**:
  * 카카오 지도를 연동하여 장소/숙소 위치를 시각적으로 확인하고 동선 파악 지원
  * 개인별 찜목록(Wishlist) 데이터를 일정 작성(Scheduling)에 직접 끌어오는 연동 기능
  * 고유 코드를 통한 비회원/타인 간의 일정 불러오기 및 공유 기능 구현
  * 관리자를 위한 관광지, 숙소, 회원 정보의 C.R.U.D 대시보드 구축

---

## 2. 기술 스택 (Tech Stack)

### Development Environment & Tools

| 구분 | 기술 / 도구 |
| :--- | :--- |
| **Language** | Java 17, HTML5, CSS3, JavaScript, jQuery |
| **Backend Framework** | Spring Boot 3.x, MyBatis |
| **Frontend & View** | JSP, Bootstrap |
| **Database** | MySQL, MySQL Workbench |
| **WAS / Server** | Apache Tomcat |
| **External API** | Kakao Maps API, Kakao 로그인 API, OpenWeather API |
| **Tools & Collaboration** | IntelliJ IDEA, Git, GitHub, Slack |

---

## 3. 주요 기능 및 시스템 구조

### 👤 사용자 기능 (User)
* **회원 관리 & 인증**:
  * 일반 회원가입(유효성 검사, 아이디 중복 체크, 우편번호 검색 API)
  * 카카오 소셜 로그인 연동
  * 아이디 및 비밀번호 찾기 (이메일 인증 기반 재설정)
  * 마이페이지 정보 수정 및 회원 탈퇴
* **장소 및 숙소 탐색**:
  * 카테고리별(BEST, HOT, ALL) 필터링 및 키워드 검색
  * 상세 정보 팝업 및 **Kakao Map 위치 맵핑**
  * 날씨 API를 연동한 실시간 정보 제공 및 오늘의 인생샷 추천 멘트
* **찜꽁 (Wishlist)**:
  * 마음에 드는 장소/숙소를 개별 찜목록에 담기
  * 찜목록 카테고리 생성, 수정 및 항목 관리
* **여행 일정 스케줄링 (Plan)**:
  * 최대 5일까지 선택 가능한 여행 스케줄러 (달력 인터페이스)
  * 찜꽁 데이터 또는 직접 입력을 통한 시간대별 일정 등록/수정/삭제
  * 일정 작성 시 생성되는 **고유 공유 코드(Code)**를 활용한 일정 불러오기

---

### 🛡️ 관리자 기능 (Admin)
* **장소/숙소(Place/Hotel) 관리**:
  * 신규 장소 및 숙소 등록 (사진 파일 업로드 기능 제공)
  * 등록된 데이터 목록 조회, 수정 및 삭제
* **회원 및 통계 관리**:
  * 전체 회원 가입 목록 및 회원 상세 조회
  * 카테고리별 정렬 및 데이터 관리

---

## 4. 데이터베이스 설계 (ERD)

```
team-travelmate (MySQL)
├── member          # 회원 정보 (로그인, 카카오 API, 주소 등)
├── admins          # 관리자 계정 정보
├── place           # 관광명소/장소 정보 (위치, 이미지, 카테고리 등)
├── hotel           # 숙소 정보 (가격, 위치, 이미지, 카테고리 등)
├── wishlist        # 사용자 생성 찜목록 상위 개념
├── wishlist_detail # 찜목록에 담긴 장소/숙소 상세 데이터
├── plan            # 일정(스케줄) 기본 정보 (여행날짜, 고유 plan_code)
└── plan_detail     # 일자별/시간대별 세부 일시 및 색상 정보
```

---

## 5. 개발 일정 및 프로세스

```text
[1주차] 기획 및 설계  ──>  [2주차] 회원/장소/일정 개발  ──>  [3주차] 관리자 및 통합
 - 주제 선정 & UI 기획     - 시큐리티 & OAuth 적용            - Admin C.R.U.D 구축
 - 요구사항 정의서          - Kakao Map & Weather API         - AJAX 연동 & 최종 점검
 - DB ERD 설계             - 찜꽁/일정 스케줄러 구현
```

---

## 6. 시작하기 (Getting Started)

### Prerequisites
* **Java 17** 이상
* **MySQL 8.0** 이상

### Installation & Run

1. **저장소 클론 (Repository Clone)**
   ```bash
   git clone https://github.com/your-repo/team-travelmate.git
   cd team-travelmate
   ```

2. **데이터베이스 설정 (`application.yml` 또는 `properties`)**
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/team_travelmate?useSSL=false&serverTimezone=UTC
   spring.datasource.username=root
   spring.datasource.password=your_password
   ```

3. **프로젝트 빌드 및 실행**
   ```bash
   ./gradlew bootRun
   ```

4. **웹 브라우저 접속**
   * 사용자 페이지: `http://localhost:8070/`
   * 관리자 페이지: `http://localhost:8070/admin`

---

## 7. 프로젝트 아쉬운 점 및 회고

* **중복 코드 및 컴포넌트 재사용성**: 
  * 장소와 숙소 탭에서 동일한 찜꽁 기능을 구현할 때 같은 HTML 및 함수 구조를 묶는 과정에서 표현 방식 충돌 문제 발생. 공통 함수 분리의 중요성을 체감.
* **상태 유지 및 예외 처리**:
  * 장소/숙소 검색 후 찜 목록을 생성할 때 페이지가 새로고침되며 기존 검색 기록이 유실되는 현상 발생. 
* **스케줄링 디테일**:
  * 일정 추가 시 시간 단위만 고려되었고 분 단위 스케줄 설정 로직을 완성하지 못한 아쉬움이 남아 향후 리팩토링 목표로 설정.