DROP SEQUENCE MEMBER_SEQ;
DROP SEQUENCE QNA_SEQ;
DROP SEQUENCE STREAM_SEQ;
DROP SEQUENCE FILE_SEQ;
DROP SEQUENCE CHAT_SEQ;
DROP SEQUENCE DANCE_SEQ;
DROP SEQUENCE SONG_SEQ;
DROP SEQUENCE FREE_SEQ;
DROP SEQUENCE COMMENT_SEQ;

DROP TABLE MEMBER_BOARD;
DROP TABLE QNA_BOARD;
DROP TABLE STREAM_BOARD;
DROP TABLE FILE_UPLOAD;
DROP TABLE CHAT_BOARD;
DROP TABLE DANCE_BOARD;
DROP TABLE SONG_BOARD;
DROP TABLE FREE_BOARD;
DROP TABLE COMMENT_TABLE;
DROP TABLE LOGIN_API;

CREATE SEQUENCE MEMBER_SEQ;
CREATE SEQUENCE QNA_SEQ;
CREATE SEQUENCE STREAM_SEQ;
CREATE SEQUENCE FILE_SEQ;
CREATE SEQUENCE CHAT_SEQ;
CREATE SEQUENCE DANCE_SEQ;
CREATE SEQUENCE SONG_SEQ;
CREATE SEQUENCE FREE_SEQ;
CREATE SEQUENCE COMMENT_SEQ;


select * from member_board;

CREATE TABLE LOGIN_API(
	MEMBER_SEQ NUMBER NOT NULL,
	ID VARCHAR2(30) NOT NULL,
	NAME VARCHAR2(30) NOT NULL,
	EMAIL VARCHAR(100) NOT NULL,
	MEMBERSHIP VARCHAR2(7) NOT NULL,
	
);


CREATE TABLE MEMBER_BOARD(
	MEMBER_SEQ NUMBER NOT NULL,
	ID VARCHAR2(20) NOT NULL,
	PW VARCHAR2(20) NOT NULL,
	NAME VARCHAR2(20) NOT NULL,
	NICKNAME VARCHAR2(20) NOT NULL,
	GRADE VARCHAR2(20) NOT NULL,
	EMAIL VARCHAR2(100) NOT NULL,
	BIRTHDAY VARCHAR2(10) NOT NULL,
	PHONE VARCHAR2(20) NOT NULL,
	ADDR VARCHAR2(100) NOT NULL,
	MEMBERSHIP VARCHAR2(7),
	DELFLAG VARCHAR2(2) NOT NULL,
	REGDATE DATE NOT NULL,
	
	CONSTRAINT PK_MEMBER_SEQ PRIMARY KEY (MEMBER_SEQ),
	CONSTRAINT UK_ID UNIQUE (ID),
	CONSTRAINT UK_NICKNAME UNIQUE (NICKNAME),
	CONSTRAINT CK_GRADE CHECK (GRADE IN('USER','ADMIN')),
	CONSTRAINT UK_PHONE UNIQUE (PHONE),
	CONSTRAINT CK_MEMBERSHIP CHECK (MEMBERSHIP IN('ONE','ALL','NOPAY')),
	CONSTRAINT CK_DELFLAG CHECK (DELFLAG IN('Y','N'))
);

CREATE TABLE QNA_BOARD(
	QNA_NO NUMBER NOT NULL,
	QNA_TITLE VARCHAR2(20) NOT NULL,
	QNA_CONTENT VARCHAR2(20) NOT NULL,
	QAN_REGDATE DATE NOT NULL,
	QNA_ANSWER VARCHAR2(2) NOT NULL,
	MEMBER_SEQ NUMBER NOT NULL,
	
	CONSTRAINT PK_QNA_NO PRIMARY KEY (QNA_NO),
	CONSTRAINT FK_QNA_SEQ FOREIGN KEY(MEMBER_SEQ) REFERENCES MEMBER_BOARD (MEMBER_SEQ)
);

CREATE TABLE STREAM_BOARD(
	STREAM_NO NUMBER NOT NULL,
	STREAM_TITLE VARCHAR2(100) NOT NULL,
	MEMBER_SEQ NUMBER NOT NULL,
	
	CONSTRAINT PK_STREAM_NO PRIMARY KEY (STREAM_NO),
	CONSTRAINT FK_STREAM_SEQ FOREIGN KEY(MEMBER_SEQ) REFERENCES MEMBER_BOARD (MEMBER_SEQ)
);

CREATE TABLE FILE_UPLOAD(
	FILE_NO NUMBER NOT NULL,
	FILE_RNAME VARCHAR2(100) NOT NULL,
	FILE_NAME VARCHAR2(100) NOT NULL,
	MEMBER_SEQ NUMBER NOT NULL,
	
	CONSTRAINT PK_FILE_NO PRIMARY KEY (FILE_NO),
	CONSTRAINT FK_FILE_SEQ FOREIGN KEY(MEMBER_SEQ) REFERENCES MEMBER_BOARD (MEMBER_SEQ)
);

CREATE TABLE CHAT_BOARD(
	CHAT_NO NUMBER NOT NULL,
	CHAT_TITLE VARCHAR2(100) NOT NULL,
	MEMBER_SEQ NUMBER NOT NULL,
	
	CONSTRAINT PK_CHAT_NO PRIMARY KEY (CHAT_NO),
	CONSTRAINT FK_CHAT_SEQ FOREIGN KEY(MEMBER_SEQ) REFERENCES MEMBER_BOARD (MEMBER_SEQ)
);

CREATE TABLE DANCE_BOARD(
	DANCE_NO NUMBER NOT NULL,
	DANCE_TITLE VARCHAR2(100) NOT NULL,
	DANCE_CONTENT VARCHAR2(3000) NOT NULL,
	DANCE_REGDATE DATE NOT NULL,
	DANCE_CNT NUMBER NOT NULL,
	MEMBER_SEQ NUMBER NOT NULL,
	
	CONSTRAINT PK_DANCE_NO PRIMARY KEY (DANCE_NO),
	CONSTRAINT FK_DANCE_SEQ FOREIGN KEY(MEMBER_SEQ) REFERENCES MEMBER_BOARD (MEMBER_SEQ)
);

CREATE TABLE SONG_BOARD(
	SONG_NO NUMBER NOT NULL,
	SONG_TITLE VARCHAR2(100) NOT NULL,
	SONG_CONTENT VARCHAR2(3000) NOT NULL,
	SONG_REGDATE DATE NOT NULL,
	SONG_CNT NUMBER NOT NULL,
	MEMBER_SEQ NUMBER NOT NULL,
	
	CONSTRAINT PK_SONG_NO PRIMARY KEY (SONG_NO),
	CONSTRAINT FK_SONG_SEQ FOREIGN KEY(MEMBER_SEQ) REFERENCES MEMBER_BOARD (MEMBER_SEQ)
);

CREATE TABLE FREE_BOARD(
	FREE_NO NUMBER NOT NULL,
	FREE_TITLE VARCHAR2(100) NOT NULL,
	FREE_CONTENT VARCHAR2(3000) NOT NULL,
	FREE_REGDATE DATE NOT NULL,
	FREE_CNT NUMBER NOT NULL,
	MEMBER_SEQ NUMBER NOT NULL,
	
	CONSTRAINT PK_FREE_NO PRIMARY KEY (FREE_NO),
	CONSTRAINT FK_FREE_SEQ FOREIGN KEY(MEMBER_SEQ) REFERENCES MEMBER_BOARD (MEMBER_SEQ)
);

CREATE TABLE COMMENT_TABLE(
	COMMENT_NO NUMBER NOT NULL,
	COMMENT_REGDATE DATE NOT NULL,
	DANCE_NO NUMBER,
	MEMBER_SEQ NUMBER NOT NULL,
	SONG_NO NUMBER,
	FREE_NO NUMBER,
	
	CONSTRAINT PK_COMMENT_NO PRIMARY KEY (COMMENT_NO),
	CONSTRAINT FK_COMMENT_DANCE_NO FOREIGN KEY(DANCE_NO) REFERENCES DANCE_BOARD (DANCE_NO) ON DELETE CASCADE,
	CONSTRAINT FK_COMMENT_MEMBER_SEQ FOREIGN KEY(MEMBER_SEQ) REFERENCES MEMBER_BOARD (MEMBER_SEQ),
	CONSTRAINT FK_COMMENT_SONG_NO FOREIGN KEY(SONG_NO) REFERENCES SONG_BOARD (SONG_NO) ON DELETE CASCADE,
	CONSTRAINT FK_COMMENT_FREE_NO FOREIGN KEY(FREE_NO) REFERENCES FREE_BOARD (FREE_NO) ON DELETE CASCADE
);














