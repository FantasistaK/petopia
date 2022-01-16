# 🐶 첫번째 개인 프로젝트 - Petopia

## 🛠 개발환경
+ 개발산출문서 - Excel
+ DB설계 - Oracle SQL Developer
+ IDE 도구 - Eclipse
+ 웹 서버 - Apache Tomcat 9.0
+ 언어 - JAVA / Javascript / HTML
+ 주요 라이브러리 - jQuery / Lombok / Mybatis
+ 프레임워크 - Spring
---
#### ⚙️ Oracle 데이터베이스 및 사용자 생성 
```
CREATE USER PETOPIA IDENTIFIED BY 1234;
GRANT DBA TO PETOPIA;
```
#### ⚙️ OracleDB 테이블 생성
+ 회원 테이블
```
CREATE TABLE PMEMBER(
    MID NVARCHAR2(50) CONSTRAINT PK_PMEMBER PRIMARY KEY,
    MPASSWORD NVARCHAR2(50) NOT NULL,
    MNAME NVARCHAR2(50) NOT NULL,
    MPHONE NVARCHAR2(50) NOT NULL,
    MEMAIL NVARCHAR2(50) NOT NULL,
    MADDRESS NVARCHAR2(200) NOT NULL
);
```
+ 분양 게시판 테이블
```
CREATE TABLE RBOARD(
    RBNUMBER NUMBER CONSTRAINT PK_RBOARD PRIMARY KEY,
    RBWRITER NVARCHAR2(50) CONSTRAINT FK_RBOARD REFERENCES PMEMBER(MID),
    RBTITLE NVARCHAR2(50),
    RBADDRESS NVARCHAR2(200),
    RBCATEGORY NVARCHAR2(50),
    RBCONTENTS NVARCHAR2(1000),
    RBDATE DATE,
    RBHITS NUMBER,
    RBLIKES NUMBER,
    RBFILENAME NVARCHAR2(50)
);
```
+ 용품거래 게시판 테이블
```
CREATE TABLE SBOARD(
    SBNUMBER NUMBER CONSTRAINT PK_SBOARD PRIMARY KEY,
    SBWRITER NVARCHAR2(50) CONSTRAINT FK_SBOARD REFERENCES PMEMBER(MID),
    SBTITLE NVARCHAR2(50),
    SBADDRESS NVARCHAR2(200),
    SBCONTENTS NVARCHAR2(1000),
    SBDATE DATE,
    SBPRICE NUMBER,
    SBHITS NUMBER,
    SBLIKES NUMBER,
    SBFILENAME NVARCHAR2(50)
);
```
---
#### 💻 기능 구현 (첫화면)
+ 첫페이지에는 회원가입, 로그인, 게시판 링크가 나옵니다.

![1  첫페이지](https://user-images.githubusercontent.com/82364353/149646692-0c03d1ba-5dc3-4c37-972f-48b84e0b7a91.png)
---
#### 💻 기능 구현 (회원가입)
+ 회원가입 폼입니다.

![2  회원가입페이지](https://user-images.githubusercontent.com/82364353/149646779-a578cd19-d843-4370-aea4-bc4fbb041406.png)
+ 아이디 정규식 적용화면입니다.

![2-1  아이디1](https://user-images.githubusercontent.com/82364353/149646780-c7f53d56-7e6b-451c-9d7b-5a04220ac548.png)
![2-1  아이디2](https://user-images.githubusercontent.com/82364353/149646781-d1a82ca5-8318-41d4-b80e-858b1935089d.png)
![2-1  아이디3](https://user-images.githubusercontent.com/82364353/149646782-b50aef29-11ce-40f5-870d-b4332c3cf06e.png)
+ 비밀번호 정규식 적용화면입니다.

![2-2  비밀번호1](https://user-images.githubusercontent.com/82364353/149646783-64e089d3-4d81-4260-b1dc-b42c0a5fc4ce.png)
![2-2  비밀번호2](https://user-images.githubusercontent.com/82364353/149646784-cecf3493-2d98-4f75-bd15-7ae9846ff7c8.png)
![2-2  비밀번호3](https://user-images.githubusercontent.com/82364353/149646785-3686925e-8283-4bde-9aa1-dd70949017a8.png)
+ 이름은 필수 입력 사항입니다.

![2-3  이름1](https://user-images.githubusercontent.com/82364353/149646786-c29f7b68-bbda-492a-9a4b-0610a4a78bed.png)
+ 전화번호 정규식 적용화면입니다.

![2-4  전화번호1](https://user-images.githubusercontent.com/82364353/149646787-ff06f4eb-2e00-4d24-8eee-2b64dec67bc6.png)
![2-4  전화번호2](https://user-images.githubusercontent.com/82364353/149646788-0d8fe548-fa3c-47f7-a1a6-aac5eb609f34.png)
+ 모두 정확히 기입하면 가입이 가능합니다.

![2-5  가입1](https://user-images.githubusercontent.com/82364353/149646789-1b51619a-9f55-4022-b633-3781293716a8.png)
---
#### 💻 기능 구현 (로그인)
+ 로그인 화면입니다.

![3  로그인페이지](https://user-images.githubusercontent.com/82364353/149646790-c23b7b7d-f8a5-408c-9a5d-0436ccbc88e9.png)
+ 관리자로 로그인했을때 나오는 페이지입니다.

![3-1  관리자로그인](https://user-images.githubusercontent.com/82364353/149646791-5aa3d5fb-8a67-4ebf-83b8-37126db27ca9.png)
+ 회원목록 조회, 삭제 기능입니다.

![3-1  회원목록 조회](https://user-images.githubusercontent.com/82364353/149646793-ad536594-5389-4716-93b0-a708942000e7.png)
+ 회원으로 로그인했을때 나오는 페이지입니다.

![3-2  회원로그인](https://user-images.githubusercontent.com/82364353/149646794-b8cef799-ea70-4f40-a674-a47e14593288.png)
+ 마이페이지로 들어가면 회원정보 수정하는 버튼이 보입니다.

![3-3  마이페이지](https://user-images.githubusercontent.com/82364353/149646795-bf912554-df17-463d-b7be-5fe152b56cf4.png)
+ 회원 정보를 수정할 수 있는 기능입니다.

![3-4  회원정보수정](https://user-images.githubusercontent.com/82364353/149646796-35944168-5988-4f5f-9b6f-b52b43910932.png)
---
#### 💻 기능 구현 (분양게시판)
+ 분양게시판 리스트 화면입니다.

![4  분양게시판](https://user-images.githubusercontent.com/82364353/149646797-fd3947bc-2469-40e5-89f2-f7e9485e3738.png)
+ 분양게시판 글쓰기 화면입니다.

![4-1  글쓰기페이지](https://user-images.githubusercontent.com/82364353/149646798-589b8ec8-1ad2-406f-a7e1-ead56756765a.png)
---
#### 💻 기능 구현 (용품게시판)
+ 용품게시판 리스트 화면입니다.

![5  용품게시판](https://user-images.githubusercontent.com/82364353/149646799-312d0556-7c76-4746-83ed-93badb279a4e.png)
+ 지역 카테고리 선택 기능입니다.

![5-1  카테고리선택](https://user-images.githubusercontent.com/82364353/149646800-03521748-93f4-4aa0-8766-b0e559394f1d.png)

![5-1  카테고리선택2](https://user-images.githubusercontent.com/82364353/149646801-53b8736d-9807-4d1b-9865-d1d5ca0e525c.png)
