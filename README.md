# πΆ μ²«λ²μ§Έ κ°μΈ νλ‘μ νΈ - Petopia

## π  κ°λ°νκ²½
+ κ°λ°μ°μΆλ¬Έμ - Excel
+ DBμ€κ³ - Oracle SQL Developer
+ IDE λκ΅¬ - Eclipse
+ μΉ μλ² - Apache Tomcat 9.0
+ μΈμ΄ - JAVA / Javascript / HTML
+ μ£Όμ λΌμ΄λΈλ¬λ¦¬ - jQuery / Lombok / Mybatis
+ νλ μμν¬ - Spring
---
#### βοΈ Oracle λ°μ΄ν°λ² μ΄μ€ λ° μ¬μ©μ μμ± 
```
CREATE USER PETOPIA IDENTIFIED BY 1234;
GRANT DBA TO PETOPIA;
```
#### βοΈ OracleDB νμ΄λΈ μμ±
+ νμ νμ΄λΈ
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
+ λΆμ κ²μν νμ΄λΈ
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
+ μ©νκ±°λ κ²μν νμ΄λΈ
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
#### π» κΈ°λ₯ κ΅¬ν (μ²«νλ©΄)
+ μ²«νμ΄μ§μλ νμκ°μ, λ‘κ·ΈμΈ, κ²μν λ§ν¬κ° λμ΅λλ€.

![1  μ²«νμ΄μ§](https://user-images.githubusercontent.com/82364353/149646692-0c03d1ba-5dc3-4c37-972f-48b84e0b7a91.png)
---
#### π» κΈ°λ₯ κ΅¬ν (νμκ°μ)
+ νμκ°μ νΌμλλ€.

![2  νμκ°μνμ΄μ§](https://user-images.githubusercontent.com/82364353/149646779-a578cd19-d843-4370-aea4-bc4fbb041406.png)
+ μμ΄λ μ κ·μ μ μ©νλ©΄μλλ€.

![2-1  μμ΄λ1](https://user-images.githubusercontent.com/82364353/149646780-c7f53d56-7e6b-451c-9d7b-5a04220ac548.png)
![2-1  μμ΄λ2](https://user-images.githubusercontent.com/82364353/149646781-d1a82ca5-8318-41d4-b80e-858b1935089d.png)
![2-1  μμ΄λ3](https://user-images.githubusercontent.com/82364353/149646782-b50aef29-11ce-40f5-870d-b4332c3cf06e.png)
+ λΉλ°λ²νΈ μ κ·μ μ μ©νλ©΄μλλ€.

![2-2  λΉλ°λ²νΈ1](https://user-images.githubusercontent.com/82364353/149646783-64e089d3-4d81-4260-b1dc-b42c0a5fc4ce.png)
![2-2  λΉλ°λ²νΈ2](https://user-images.githubusercontent.com/82364353/149646784-cecf3493-2d98-4f75-bd15-7ae9846ff7c8.png)
![2-2  λΉλ°λ²νΈ3](https://user-images.githubusercontent.com/82364353/149646785-3686925e-8283-4bde-9aa1-dd70949017a8.png)
+ μ΄λ¦μ νμ μλ ₯ μ¬ν­μλλ€.

![2-3  μ΄λ¦1](https://user-images.githubusercontent.com/82364353/149646786-c29f7b68-bbda-492a-9a4b-0610a4a78bed.png)
+ μ νλ²νΈ μ κ·μ μ μ©νλ©΄μλλ€.

![2-4  μ νλ²νΈ1](https://user-images.githubusercontent.com/82364353/149646787-ff06f4eb-2e00-4d24-8eee-2b64dec67bc6.png)
![2-4  μ νλ²νΈ2](https://user-images.githubusercontent.com/82364353/149646788-0d8fe548-fa3c-47f7-a1a6-aac5eb609f34.png)
+ λͺ¨λ μ νν κΈ°μνλ©΄ κ°μμ΄ κ°λ₯ν©λλ€.

![2-5  κ°μ1](https://user-images.githubusercontent.com/82364353/149646789-1b51619a-9f55-4022-b633-3781293716a8.png)
---
#### π» κΈ°λ₯ κ΅¬ν (λ‘κ·ΈμΈ)
+ λ‘κ·ΈμΈ νλ©΄μλλ€.

![3  λ‘κ·ΈμΈνμ΄μ§](https://user-images.githubusercontent.com/82364353/149646790-c23b7b7d-f8a5-408c-9a5d-0436ccbc88e9.png)
+ κ΄λ¦¬μλ‘ λ‘κ·ΈμΈνμλ λμ€λ νμ΄μ§μλλ€.

![3-1  κ΄λ¦¬μλ‘κ·ΈμΈ](https://user-images.githubusercontent.com/82364353/149646791-5aa3d5fb-8a67-4ebf-83b8-37126db27ca9.png)
+ νμλͺ©λ‘ μ‘°ν, μ­μ  κΈ°λ₯μλλ€.

![3-1  νμλͺ©λ‘ μ‘°ν](https://user-images.githubusercontent.com/82364353/149646793-ad536594-5389-4716-93b0-a708942000e7.png)
+ νμμΌλ‘ λ‘κ·ΈμΈνμλ λμ€λ νμ΄μ§μλλ€.

![3-2  νμλ‘κ·ΈμΈ](https://user-images.githubusercontent.com/82364353/149646794-b8cef799-ea70-4f40-a674-a47e14593288.png)
+ λ§μ΄νμ΄μ§λ‘ λ€μ΄κ°λ©΄ νμμ λ³΄ μμ νλ λ²νΌμ΄ λ³΄μλλ€.

![3-3  λ§μ΄νμ΄μ§](https://user-images.githubusercontent.com/82364353/149646795-bf912554-df17-463d-b7be-5fe152b56cf4.png)
+ νμ μ λ³΄λ₯Ό μμ ν  μ μλ κΈ°λ₯μλλ€.

![3-4  νμμ λ³΄μμ ](https://user-images.githubusercontent.com/82364353/149646796-35944168-5988-4f5f-9b6f-b52b43910932.png)
---
#### π» κΈ°λ₯ κ΅¬ν (λΆμκ²μν)
+ λΆμκ²μν λ¦¬μ€νΈ νλ©΄μλλ€.

![4  λΆμκ²μν](https://user-images.githubusercontent.com/82364353/149646797-fd3947bc-2469-40e5-89f2-f7e9485e3738.png)
+ λΆμκ²μν κΈμ°κΈ° νλ©΄μλλ€.

![4-1  κΈμ°κΈ°νμ΄μ§](https://user-images.githubusercontent.com/82364353/149646798-589b8ec8-1ad2-406f-a7e1-ead56756765a.png)
---
#### π» κΈ°λ₯ κ΅¬ν (μ©νκ²μν)
+ μ©νκ²μν λ¦¬μ€νΈ νλ©΄μλλ€.

![5  μ©νκ²μν](https://user-images.githubusercontent.com/82364353/149646799-312d0556-7c76-4746-83ed-93badb279a4e.png)
+ μ§μ­ μΉ΄νκ³ λ¦¬ μ ν κΈ°λ₯μλλ€.

![5-1  μΉ΄νκ³ λ¦¬μ ν](https://user-images.githubusercontent.com/82364353/149646800-03521748-93f4-4aa0-8766-b0e559394f1d.png)

![5-1  μΉ΄νκ³ λ¦¬μ ν2](https://user-images.githubusercontent.com/82364353/149646801-53b8736d-9807-4d1b-9865-d1d5ca0e525c.png)
