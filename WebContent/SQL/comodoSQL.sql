/* 외박 테이블 쿼리문입니다.*/
/* 입맛대로 수정해서 사용하세요*/

/* Sleep */
CREATE TABLE SLEEP_TAB (
	S_Board_Num NUMBER(100) NOT NULL, /* 글번호 */
	S_HakNum NUMBER(10) NOT NULL, /* 학번 */
	S_Name VARCHAR2(10) NOT NULL, /* 이름 */
	S_Subject VARCHAR2(100) NOT NULL, /* 제목 */
	S_Content VARCHAR2(1000) NOT NULL, /* 내용 */
	S_Date DATE NOT NULL, /* 외박날짜 */
	S_Confirm NUMBER(1), /* 승인여부 */
	S_Confirm_Date DATE /* 승인시간 */
);

/* DB에 주석넣는 쿼리문입니다. */
/* SQL Developer 에서 테이블 구조 확인하면 주석도 출력됩니다. */
COMMENT ON TABLE SLEEP_TAB IS 'Sleep';

COMMENT ON COLUMN SLEEP_TAB.S_Board_Num IS '글번호';

COMMENT ON COLUMN SLEEP_TAB.S_HakNum IS '학번';

COMMENT ON COLUMN SLEEP_TAB.S_Name IS '이름';

COMMENT ON COLUMN SLEEP_TAB.S_Subject IS '제목';

COMMENT ON COLUMN SLEEP_TAB.S_Content IS '내용';

COMMENT ON COLUMN SLEEP_TAB.S_Date IS '외박날짜';

COMMENT ON COLUMN SLEEP_TAB.S_Confirm IS '승인여부';

COMMENT ON COLUMN SLEEP_TAB.S_Confirm_Date IS '승인시간';

/* 기본키 설정하는 부분입니다. 애매하면 지우고 실행하세요. 나중에 추가가능!!! */
ALTER TABLE SLEEP_TAB
	ADD
		CONSTRAINT PK_TABLE
		PRIMARY KEY (
			S_Board_Num
		);
		
		
/*=========================*/
/*=========================*/
/*        QnA 게시판             */
/*=========================*/
/*=========================*/
		
/* QnA */
CREATE TABLE qna_tab (
	q_board_num NUMBER(100) NOT NULL, /* 글번호 */
	q_haknum NUMBER(10) NOT NULL, /* 학번 */
	q_subject VARCHAR2(100) NOT NULL, /* 제목 */
	q_content VARCHAR2(1000) NOT NULL, /* 내용 */
	q_check varchar2(2) DEFAULT 0, /* 예정) 답변여부 혹은 비밀글여부 */
	q_reg_date DATE, /* 작성 날짜 */
	q_regupdate_date  DATE, /* 수정 날짜 */
);

/* DB에 주석넣는 쿼리문입니다. */
/* SQL Developer 에서 테이블 구조 확인하면 주석도 출력됩니다. */
--COMMENT ON TABLE SLEEP_TAB IS 'Sleep';
--
--COMMENT ON COLUMN SLEEP_TAB.S_Board_Num IS '글번호';
--
--COMMENT ON COLUMN SLEEP_TAB.S_HakNum IS '학번';
--
--COMMENT ON COLUMN SLEEP_TAB.S_Name IS '이름';
--
--COMMENT ON COLUMN SLEEP_TAB.S_Subject IS '제목';
--
--COMMENT ON COLUMN SLEEP_TAB.S_Content IS '내용';
--
--COMMENT ON COLUMN SLEEP_TAB.S_Date IS '외박날짜';
--
--COMMENT ON COLUMN SLEEP_TAB.S_Confirm IS '승인여부';
--
--COMMENT ON COLUMN SLEEP_TAB.S_Confirm_Date IS '승인시간';

/* 기본키 설정하는 부분입니다. 애매하면 지우고 실행하세요. 나중에 추가가능!!! */
ALTER TABLE SLEEP_TAB
	ADD
		CONSTRAINT PK_TABLE
		PRIMARY KEY (
			S_Board_Num
		);
		
	
--==============================================================
		