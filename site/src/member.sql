CREATE TABLE member(
	number 		int 		AUTO_INCREMENT,	 	/* 회원번호 */
	member_id 	varchar(30)	NOT NULL,			/* 아이디 */
	member_pwd 	varchar(20) NOT NULL,			/* 비밀번호 */
	member_name varchar(15)	NOT NULL,			/* 회원이름 */
	member_postcode	 varchar(10),	            /* 우편번호 */
	member_address	 varchar(100),	            /* 주소 */
	member_address2	 varchar(50),	            /* 상세주소 */
	member_number	 varchar(20),	            /* 회원 이름 */
	member_email	 varchar(30),	            /* 회원 이름 */
	member_team 	 varchar(50),	            /* 응원팀 */
	member_birth	 varchar(20),	            /* 응원팀 */
	PRIMARY KEY(number, member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;