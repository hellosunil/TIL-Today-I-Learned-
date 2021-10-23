-- 대소문자 구분 안 하지만, 다른 프로그래밍 언어와의 구분을 위해 보통 대문자 사용
DESC EMP;
DESC DEPT;
DESC SALGRADE;

-- SELECTION은 행 단위로 선택 FROM은 조회할 테이블 명을 사용
-- PROJECTION은 열 단위로 선택
-- SELECTION과 PROJECTION 동시에 사용하여 행/열 단위로 선택
-- JOIN은 테이블 간 결합

-- EMP 테이블 전체 열 조회하기

SELECT * FROM EMP;

SELECT EMPNO, ENAME, DEPTNO
    FROM EMP;

-- SELECT문은 결과 순서를 보장하지 않음 ==> ORDER BY 사용하여 순서 설정

SELECT EMPNO, DEPTNO
    FROM EMP;
    
-- DISTINCT는 중복값을 제거하는 데 사용
SELECT DEPTNO
    FROM EMP;

-- 열이 한 개 일 때 중복값 제거
SELECT DISTINCT DEPTNO
    FROM EMP;
    
-- 열이 여러 개일때 중복값 제거
SELECT DISTINCT JOB, DEPTNO
    FROM EMP;
-- ==> (JOB, DEPTNO) 결합이 중복인지 판단

-- 모두 뽑기
SELECT ALL JOB, DEPTNO
    FROM EMP;
    
-- 별칭 사용하기(열의 이름을 임시로 설정) SAL=월급, COMM=추가 수당
SELECT ENAME, SAL, SAL*12+COMM, COMM
    FROM EMP;
-- 이때, COMM = NULL이면 아예 출력되지 않음

-- 별칭을 지정하는 방법
-- 1. SAL*12+COMM ANNSAL
-- 2. SAL*12+COMM "ANNSAL"
-- 3. SAL*12+COMM AS ANNSAL
-- 4. SAL*12+COMM AS "ANNSAL"
-- 다른 프로그래밍 언어와의 호환을 위해 3번으로 보통 사용

SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
    FROM EMP;

-- 테이블 정렬하기 ORDER BY ==> SELECT절의 가장 마지막 행에 씀
-- SELECT [열], [열2], ..., [열N]
--    FROM [테이블]
--    ...[그 밖의 절]
--    ORDER BY [정렬하려는 열(여러개 가능)][정렬옵션];
--                        # ASC(오름차순), DESC(내림차순)

-- 오름차순(ASC) 사용하기(오름차순이 기본)
SELECT *
    FROM EMP
    ORDER BY SAL;

-- 사원번호 기준으로 내림차순 정렬하기    
SELECT *
    FROM EMP
    ORDER BY EMPNO DESC;
    
-- 각각의 열에 내림차순과 올림차순 동시에 사용하기
-- 1순위 정렬 후, 2순위 정렬 방식
SELECT *
    FROM EMP
    ORDER BY DEPTNO ASC, SAL DESC;
    
-- ORDER BY는 시간복잡도가 크므로 왠만하면 사용하지 않는 것을 권장

-- Q2 92P
SELECT DISTINCT JOB
    FROM EMP;
    
-- Q3 92P
SELECT EMPNO AS EMPLOYEE_NO, ENAME AS EMPLOYEE_NAME,
    DEPTNO AS DEPARTMENT_NO
    FROM EMP
    ORDER BY DEPTNO DESC, ENAME ASC;
    
-- 필요 데이터만 출력하는 WHERE

SELECT *
    FROM EMP
    WHERE DEPTNO = 30;
    
SELECT *
    FROM EMP
    WHERE EMPNO = 7782;
    
-- WHERE 이후 조건식을 넣어주면 됨

SELECT *
    FROM EMP
    WHERE DEPTNO = 30 
    AND JOB ='SALESMAN';
    -- WHERE 절에서는 비교 데이터가 문자열일 경우 '' 써줘야 함

SELECT *
    FROM EMP
    WHERE DEPTNO = 30 
    OR JOB = 'CLERK';
    
-- 곱샘 연산자를 사용한 WHERE문
SELECT *
    FROM EMP
    WHERE SAL * 12 >= 36000;
    
SELECT *
    FROM EMP
    WHERE SAL >= 2500
    AND JOB = 'ANALYST';
    
-- 문자열을 비교 연산자로 비교하기

SELECT *
    FROM EMP
    WHERE ENAME >= 'F';
    -- 이름 첫 문자가 F거나 뒤쪽인 것만 출력

SELECT *
    FROM EMP
    WHERE ENAME <= 'FORZ';
    
-- 등가 비교 연산자 =, !=

SELECT *
    FROM EMP
    WHERE SAL != 3000;
    
SELECT *
    FROM EMP
    WHERE NOT SAL = 3000;
    -- NOT의 경우, 조건문 앞에 온다!

-- IN 연산자

SELECT *
    FROM EMP
    WHERE JOB = 'MANAGER'
    OR JOB = 'SALESMAN'
    OR JOB = 'CLERK';

-- IN 연산자를 써서 간단하게 표현하기
SELECT *
    FROM EMP
    WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');

SELECT *
    FROM EMP
    WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK');

SELECT *
    FROM EMP
    WHERE DEPTNO IN (10, 20);
    
-- BETWEEN A AND B 연산자

SELECT *
    FROM EMP
    WHERE SAL >= 2000
    AND SAL <= 3000;
    
SELECT *
    FROM EMP
    WHERE SAL BETWEEN 2000 AND 3000;
    
SELECT *
    FROM EMP
    WHERE SAL NOT BETWEEN 2000 AND 3000;
    
-- LIKE 연산자는 일부 문자열이 포함된 데이터를 조회

SELECT *
    FROM EMP
    WHERE ENAME LIKE 'S%';
    
-- _ : 어떤 값이든 상관없이 한 개의 문자 데이터를 의미
-- % : 길이와 상관없이(문자 없는 경우도 포함) 모든 문자 데이터를 의미

-- 사원 이름의 두 번째 글자가 L인 사원만 출력하기

SELECT *
    FROM EMP
    WHERE ENAME LIKE '_L%';
    -- L 앞에 단 하나의 문자가 와야함
    
SELECT *
    FROM EMP
    WHERE ENAME LIKE '__L%';
    -- L 앞에 단 두개의 문자가 와야함
    -- %는 뒤에 어떤 종류의 문자가 몇 개가 오더라도 상관 없음
    
-- 사원 이름에 AM이 포함되어 있는 사원 데이터만 출력하기

SELECT *
    FROM EMP
    WHERE ENAME LIKE '%AM%';
    
SELECT *
    from EMP
    WHERE ENAME NOT LIKE '%AM%';
    
-- 와일드 카드 문자가 데이터의 일부인 경우 ==> ESCAPE
-- A_A 문자열을 가지고 있는 데이터 찾기

SELECT *
    FROM SOME_TABLE
    WHERE SOME_COLUMN LIKE 'A\_A%' ESCAPE '\';
    
-- NULL 값을 가진 행 출력하기

SELECT *
    FROM EMP
    WHERE COMM IS NULL;
    
-- 직속 상관이 있는 사원 데이터만 출력하기

SELECT *
    FROM EMP
    WHERE MGR IS NOT NULL;

-- AND 연산자와 IS NULL 연산자 사용하기

SELECT *
    FROM EMP
    WHERE SAL > NULL
    AND COMM IS NULL;
    
SELECT *
    FROM EMP
    WHERE SAL > NULL
    OR COMM IS NULL;

-- 집합연산자(UNION) 사용하여 출력하기

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
    OR DEPTNO = 20;

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
    UNION
    SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 20;
    
-- UNION 사용시 주의점! ==> 출력 열의 개수와 자료형이 같아야 함

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION
SELECT SAL, JOB, DEPTNO, SAL
    FROM EMP
    WHERE DEPTNO = 20;
-- ==> 결과는 이상하지만 열 개수와 자료형이 같기 때문에 오류 없이 출력!

-- 집합 연산자의 종류 및 기능
-- UNION : 합집합 // 중복값은 제거됨
-- UNION ALL : 합집합 // 중복값도 중복 표시
-- MINUS : 차집합
-- INTERSECT : 교집합

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION ALL -- UNION을 쓴다면 한번씩만, UNION ALL을 쓰면 두번씩 반복해서 결과 출력
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10;
    
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10;
    
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10;
    
    
-- Q1 P125

SELECT *
    FROM EMP
    WHERE ENAME LIKE '%S';

-- Q2 P125

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 30
    AND JOB = 'SALESMAN';
    
-- Q3 P125

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO IN (20, 30)
    AND SAL >2000;
    
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 20
    AND SAL > 2000
UNION
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 30
    AND SAL > 2000;
    
-- Q4 P126

SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
    FROM EMP
    WHERE SAL >= 2000
    OR SAL <= 3000;
    
-- Q5 P126

SELECT ENAME, EMPNO, SAL, DEPTNO
    FROM EMP
    WHERE ENAME LIKE '%E%'
    AND DEPTNO = 30
    AND SAL NOT BETWEEN 1000 AND 2000;
    
-- Q6 P126

SELECT *
    FROM EMP
    WHERE COMM IS NULL
    AND MGR IS NOT NULL
    AND JOB IN ('MANAGER', 'CLERK')
    AND ENAME NOT LIKE '_L';


-- 데이터 처리와 가공을 위한 오라클 함수 사용하기
-- 내장 함수의 종류
-- 단일행 함수 : 행별로 함수 처리
-- 다중행 함수 : 여러 행에 함수가 동시에 처리되어 단일 행 출력

-- 문자 데이터를 가공하는 문자 함수

-- 대소문자를 바꾸는 UPPER, LOWER, INITCAP
-- UPEER(문자열) : 문자열 모두를 대문자로 변환
-- LOWER(문자열) : 문자열 모두를 소문자로 변환
-- INITCAP(문자열) : 첫글자는 대문자로, 나머지는 소문자로 변환

SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
    FROM EMP;
    
-- 활용 : 문자열 데이터는 대소문자를 구분하기 때문에 문자열 데이터를 찾을 때 이용

SELECT *
    FROM EMP
    WHERE UPPER(ENAME) = UPPER('SCOTT');
    
SELECT *
    FROM EMP
    WHERE UPPER(ENAME) LIKE UPPER('%SCOTT%');

-- 사원 이름을 모두 대문자로 출력    
SELECT UPPER(ENAME)
    FROM EMP;
    
-- 문자열의 길이를 구하는 LENGTH 함수

SELECT ENAME, LENGTH(ENAME)
    FROM EMP;
    
-- WHERE 절에서 LENGTH 함수 사용하기

SELECT ENAME, LENGTH(ENAME)
    FROM EMP
    WHERE LENGTH(ENAME) >= 5;

-- LENGTH 함수와 LENGTHB 함수

SELECT LENGTH('한글'), LENGTHB('한글')
    FROM DUAL;
    
-- 직책이름이 6글자 이상인 데이터만 출력

SELECT *
    FROM EMP
    WHERE LENGTH(JOB) >= 6;
    
-- 문자열 일부를 추출하는 SUBSTR 함수

-- SUBSTR(문자열 데이터, 시작 위치, 추출 길이)
-- SUBSTR(문자열 데이터, 시작 위치) : 시작위치 ~ 끝까지 출력

SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5)
    FROM EMP;

SELECT SUBSTR(ENAME, 3)
    FROM EMP;
    
-- SUBSTR 함수 안에 다른 함수 함께 사용하기
SELECT JOB,
    SUBSTR(JOB, -LENGTH(JOB)),
    SUBSTR(JOB, -LENGTH(JOB), 2),
    SUBSTR(JOB, -3)
    FROM EMP;
    
-- 문자열 데이터 안에서 특정 문자의 위치를 찾는 INSTR함수

SELECT INSTR('HELLO, ORACLE', 'L') AS INSTR_1,
    INSTR('HELLO, ORACLE', 'L', 5) AS INSTR_2, #몇 번째 부터
    INSTR('HELLO, ORACLE', 'L', 2, 2) AS INSTR_3 # 몇 번째 L
    FROM DUAL;

-- 특정 문자를 포함하고 있는 행 찾기
-- INSTR함수로 사원 이름에 문자 S가 있는 행 구하기

SELECT *
    FROM EMP
    WHERE INSTR(ENAME, 'S') > 0;
    
SELECT *
    FROM EMP
    WHERE ENAME LIKE '%S%';
    
-- 특정 문자를 다른 문자열로 바꾸는 REPLACE함수

SELECT '010-1234-5678' AS REPLACE_BEFORE,
    REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1,
    REPLACE('010-1234-5678', '-') AS REPLACE_2
    FROM DUAL;
    
-- 데이터의 빈 공간을 특정 문자로 채우는 LPAD, RPAD 함수

SELECT 'Oracle',
    LPAD('Oracle', 10, '#') AS LPAD_1,
    RPAD('Oracle', 10, '*') AS RPAD_1,
    LPAD('Oracle', 10) AS LAPD_2,
    RPAD('Oracle', 10) AS RPAD_2
    FROM DUAL;
    
SELECT
    RPAD('971125-', 14, '*') AS RPAD_JMNO,
    RPAD('010-1234-', 13, '*') AS RPAD_PHONE
    FROM DUAL;
    
-- 두 문자열 데이터를 합치는 CONCAT 함수

SELECT CONCAT(EMPNO, ENAME),
    CONCAT(EMPNO, CONCAT(':', ENAME))
    FROM EMP
    WHERE ENAME = 'SCOTT';
    
-- 문자열 데이터를 연결하는 ||연산자

SELECT EMPNO || ENAME,
    EMPNO || ':' || ENAME
    FROM EMP;
    
-- 특정 문자를 지우는 TRIM, LTRIM, RTRIM 함수
-- TRIM([삭제 옵션(선택)/없으면 공백 제거][삭제할문자(선택)] FROM [원본 문자열 데이터(필수)])

SELECT '[' || TRIM(' _ _ Oracle_ _ ') || ']' AS TRIM,
    '[' || TRIM(LEADING FROM ' _ _ Oracle_ _ ') || ']' AS TRIM_LEADING,
    '[' || TRIM(TRAILING FROM ' _ _ Oracle_ _ ') || ']' AS TRIM_TRAILING,
    '[' || TRIM(BOTH FROM ' _ _ Oracle_ _ ') || ']' AS TRIM_BOTH
    FROM DUAL;
    
SELECT '[' || TRIM('_' FROM '_ _ Oracle_ _ ') || ']' AS TRIM,
    '[' || TRIM(LEADING '_' FROM '_ _ Oracle_ _ ') || ']' AS TRIM_LEADING,
    '[' || TRIM(TRAILING '_' FROM '_ _ Oracle_ _ ') || ']' AS TRIM_TRAILING,
    '[' || TRIM(BOTH '_' FROM '_ _ Oracle_ _ ') || ']' AS TRIM_BOTH
    FROM DUAL;
    
-- LTRIM과 RTRIM 사용하기
-- LTRIM([원본 문자열 데이터(필수)], [삭제할 문자 집합(선택)])
-- RTRIM([원본 문자열 데이터(필수)], [삭제할 문자 집합(선택)])

SELECT '[' || TRIM(' _Oracle_ ') || ']' AS TRIM,
    '[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM,
    '[' || LTRIM(' <_Oracle_> ', '_<') || ']' AS LTRIM_2,
    '[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM,
    '[' || RTRIM(' <_Oracle_> ', '>_ ') || ']' AS RTRIM_2
    FROM DUAL;
    
-- LTRIM과 RTRIM ==> 해당 문자열이 가질 수 있는 모든 조합을 왼쪽/오른쪽 부터 순서대로 제거

-- 숫자 함수

-- ROUND : 반올림
-- TRUNC : 버림
-- CEIL : 지정한 숫자보다 큰 정수 중 가장 작은 정수를 반환
-- FLOOR : 지정한 숫자보다 작은 정수 중 가장 큰 수를 반환
-- MOD : 나머지 값을 반환


--SELECT ROUND(1234.5678) AS ROUND,   정수반환
--    ROUND(1234.5678, 0) AS ROUND_0, 정수반환
--    ROUND(1234.5678, 2) AS ROUND_2, 소수 둘째 자리까지
--    ROUND(1234.5678, -2) AS ROUND_MINUS2    자연수 둘째 자리에서 반올림
--    FROM DUAL;

SELECT TRUNC(1234.5678) AS TRUNC,
    TRUNC(1234.5678, 0) AS TRUNC_0,
    TRUNC(1234.5678, 2) AS TRUNC_2,
    TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
    TRUNC(1234.5678, -2) AS TRUNC_MINUS2
    FROM DUAL;
    
--지정한 숫자와 가까운 값을 찾는 CEIL, FLOOR

SELECT CEIL(3.14),
       FLOOR(3.14),
       CEIL(-3.14),
       FLOOR(-3.14)
    FROM DUAL;
    
SELECT MOD(15, 6),
       MOD(10, 2),
       MOD(11, 2)
    FROM DUAL;
    


--날짜를 다루는 함수(DATE형을 다루는 함수)

--DATE +- NUMBER : 숫자 일수 이후/이전의 DATE
--DATE - DATE : 두 DATE 간의 일수 차이
--DATE + DATE : 연산 불가!!

SELECT SYSDATE AS NOW,
       SYSDATE-1 AS YESTERDAY,
       SYSDATE+1 AS TOMORROW
    FROM DUAL;
    
--몇 개월 이후의 날짜를 구하는 ADD_MONTHS 함수

SELECT SYSDATE,
       ADD_MONTHS(SYSDATE, 3)
    FROM DUAL;
    
DESC EMP;

--입사 10주년이 되는 사원들 데이터 출력하기

SELECT EMPNO, ENAME, HIREDATE,
       ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR
    FROM EMP;
    
--입사 32년 이상의 사원 데이터 출력하기

SELECT EMPNO,
       ENAME, HIREDATE
    FROM EMP
  WHERE ADD_MONTHS(HIREDATE, 384) <= SYSDATE;
  

--현재 날짜와 6개월 후의 날짜 출력하기

SELECT SYSDATE,
       ADD_MONTHS(SYSDATE, 6)
    FROM DUAL;
    
    
--두 개월 수 간의 차이를 구하는 MONTHS_BETWEEN 함수

SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
       MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTHS1,
       MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS2,
       TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS3
    FROM EMP;
    
    
--NEXT_DAY : 돌아오는 요일
--LAST_DAY : 달의 마지막 날짜

SELECT SYSDATE,
       NEXT_DAY(SYSDATE, '월요일'),
       LAST_DAY(SYSDATE)
    FROM DUAL;
    
    
--자료형 변환 함수

SELECT EMPNO, ENAME, EMPNO+'500'
    FROM EMP
  WHERE ENAME = 'SCOTT';

--==> '500'은 문자형이지만, 자동으로 숫자형으로 변환되어 계산됨

SELECT 'ABCD' + EMPNO, EMPNO
    FROM EMP
  WHERE ENAME = 'SCOTT';
  
--==> 계산 불가능!!
--==> 숫자처럼 생긴 문자형은 숫자로 자동 변환, 문자처럼 생긴 문자열은 변환x

--TO_CHAR     : 문자형으로 변환
--TO_NUMBER   : 숫자형으로 변환
--TO_DATE     : 날짜형으로 변환

--날짜 형식 지정하여(TO_CHAR) 출력하기

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간
    FROM DUAL;
    
SELECT SYSDATE,
       TO_CHAR(SYSDATE, 'MM') AS MM,
       TO_CHAR(SYSDATE, 'MON') AS MON,
       TO_CHAR(SYSDATE, 'MONTH') AS MONTH,
       TO_CHAR(SYSDATE, 'DD') AS DD,
       TO_CHAR(SYSDATE, 'DY') AS DY,
       TO_CHAR(SYSDATE, 'DAY') AS DAY
    FROM DUAL;
    
--특정 언어로 출력하기

SELECT SYSDATE,
       TO_CHAR(SYSDATE, 'MM') AS MM,
       TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KOR,
       TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN,
       TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_ENG
    FROM DUAL;
    
    
--숫자 데이터에 형식을 지정하여 출력하기

SELECT SAL,
       TO_CHAR(SAL, '$999,999') AS SAL_$,
       TO_CHAR(SAL, 'L999,999') AS SAL_L,
       TO_CHAR(SAL, '999,999.00') AS SAL_1,
       TO_CHAR(SAL, '000,999,999.00') AS SAL_2,
       TO_CHAR(SAL, '000999999.99') AS SAL_3,
       TO_CHAR(SAL, '999,999,00') AS SAL_4
    FROM EMP;
    
    
SELECT 1300 - '1500',
       '1300' + 1500
    FROM DUAL;
--==> 연간 가능


SELECT '1,300' - '1,500'
    FROM DUAL;
--==> 연산불가 ,때문에 숫자형으로 인식하지 못함

SELECT TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999')
    FROM DUAL;
    
--문자 데이터를 날짜 데이터로 변환하기

SELECT TO_DATE('2018-07-14', 'YYYY-MM-DD') AS TODATE1,
       TO_DATE('20180714', 'YYYY-MM-DD') AS TODATE2
    FROM DUAL;
    
    
--1981년 6월 1일 이후 입사한 사원 정보 추출하기

SELECT *
    FROM EMP
   WHERE HIREDATE > TO_DATE('19810601', 'YYYY-MM-DD');
   
--YY : 현 시점과 가까운 년도(2059)
--RR : 현 시점의 년도 끝 두 자리 수가 ~49, 50~ 입력된 수치 ~49, 50~을 계산 가까운 년도를 표시 (1959)


--NULL 처리 함수

SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM,
       NVL(COMM, 0),
       SAL+NVL(COMM, 0)
    FROM EMP;

--NVL(NULL확인 변수, 바꿀 값)

SELECT EMPNO, ENAME, COMM,
       NVL2(COMM, '0', 'X'),
       NVL2(COMM, SAL*12+COMM, SAL*12) AS ANNSAL
    FROM EMP;

--NVL2(NULL확인 변수, NULL이 아닐 때 반환 값, NULL일 때 반환 값)

--상황에 따라 다른 데이터를 반환하는 DECODE함수와 CASE문


SELECT EMPNO, ENAME, JOB, SAL,
       DECODE(JOB,
              'MANAGER', SAL*1.1,
              'SALSESMAN', SAL*1.05,
              'ANALYST', SAL,
              SAL*1.03) AS UPSAL
    FROM EMP;
    

SELECT EMPNO, ENAME, JOB, SAL,
    CASE JOB
         WHEN 'MANAGER' THEN SAL*1.1
         WHEN 'SALESMAN' THEN SAL*1.05
         WHEN 'ANALYST' THEN SAL
         ELSE SAL*1.03
    END AS UPSAL
    FROM EMP;
    
--기준 값이 없을 때, CASE 사용하기

SELECT EMPNO, ENAME, COMM,
    CASE
     WHEN COMM IS NULL THEN '해당사항없음'
     WHEN COMM = 0 THEN '수당없음'
     WHEN COMM >0 THEN '수당 : ' || COMM
    END AS COMM_TEXT
   FROM EMP;
   
-- Q1 P174

SELECT EMPNO,
       SUBSTR(EMPNO, -LENGTH(EMPNO), 2) || '**' AS MASKING_EMPNO,
       ENAME,
       SUBSTR(ENAME, -LENGTH(ENAME), 1) || '****' AS MASKING_ENAME
    FROM EMP 
    WHERE LENGTH(ENAME) >= 5 AND LENGTH(ENAME) < 6;
    
-- 6-1
SELECT EMPNO,
       RPAD(SUBSTR(EMPNO, 1, 2), 4, '*') AS MASKING_EMPNO,
       ENAME,
       RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') AS MASKING_ENAME
 FROM  EMP
 WHERE LENGTH(ENAME) >= 5
   AND LENGTH(ENAME) < 6;
   
-- 6-2

SELECT EMPNO, ENAME, SAL,
       TRUNC(SAL / 21.5, 2) AS DAY_PAY,
       ROUND(SAL / 21.5 / 8, 1) AS TIME_PAY
    FROM EMP;
    
-- 6-3

SELECT EMPNO, ENAME, HIREDATE,
       TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '월요일'), 'YYYY-MM-DD') AS R_JOB,
       NVL(TO_CHAR(COMM), 'N/A') AS COMM
    FROM EMP;
    
-- 6-4

SELECT EMPNO, ENAME, MGR,
     CASE
      WHEN MGR IS NULL THEN '0000'
      WHEN MGR LIKE '75%' THEN '5555'
      WHEN MGR LIKE '76%' THEN '6666'
      WHEN MGR LIKE '77%' THEN '7777'
      WHEN MGR LIKE '78%' THEN '8888'
      ELSE 'MGR'
      END AS CHG_MGR
    FROM EMP;
    
SELECT EMPNO, ENAME, MGR,
       CASE
          WHEN MGR IS NULL THEN '0000'
          WHEN SUBSTR(MGR, 1, 2) = '78' THEN '8888'
          WHEN SUBSTR(MGR, 1, 2) = '77' THEN '7777'
          WHEN SUBSTR(MGR, 1, 2) = '76' THEN '6666'
          WHEN SUBSTR(MGR, 1, 2) = '75' THEN '5555'
          ELSE TO_CHAR(MGR)
       END AS CHG_MGR
  FROM EMP;


-- 다중행 함수

SELECT SUM(SAL)
    FROM EMP;
    
-- SUM : 합계
-- COUNT : 개수
-- MAX : 최대
-- MIN : 최소
-- AVG : 평균

SELECT SUM(DISTINCT SAL),
       SUM(ALL SAL),
       SUM(SAL)
    FROM EMP;
    
SELECT SUM(SAL), SUM(COMM)
    FROM EMP;
    

SELECT COUNT(*)
    FROM EMP;
    
-- 부서 번호가 30인 직원 수 구하기

SELECT COUNT(*)
    FROM EMP
   WHERE DEPTNO = 30;
   
SELECT COUNT(COMM)
    FROM EMP;
    
SELECT COUNT(COMM)
    FROM EMP
   WHERE COMM IS NOT NULL;
-- 결과값이 같음 기본적으로 NULL값은 COUNT에서 제외됨


SELECT MAX(SAL)
    FROM EMP
   WHERE DEPTNO = 10;
   
SELECT MIN(SAL)
    FROM EMP
   WHERE DEPTNO = 10;
   
-- 날짜 데이터에 MIN, MAX 이용하기

SELECT MAX(HIREDATE)
    FROM EMP
   WHERE DEPTNO = 20;
-- MAX값이 제일 최근, MIN값이 제일 예전

SELECT AVG(SAL)
    FROM EMP
   WHERE DEPTNO = 30;

-- 1분 복습 P185
SELECT AVG(COMM)
    FROM EMP
   WHERE DEPTNO = 30;
   

-- GROUP BY절

SELECT AVG(SAL), DEPTNO
    FROM EMP
   GROUP BY DEPTNO;
-- GROUP BY 절에는 별칭을 지정할 수 없음

SELECT AVG(SAL), '10부서' AS DEPTNO FROM EMP WHERE DEPTNO = 10
UNION ALL
SELECT AVG(SAL), '20부서' AS DEPTNO FROM EMP WHERE DEPTNO = 20
UNION ALL
SELECT AVG(SAL), '30부서' AS DEPTNO FROM EMP WHERE DEPTNO = 30;


--부서번호 및 직책별 평균 급여로 정렬하기

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
   GROUP BY DEPTNO, JOB
   ORDER BY DEPTNO, JOB;
   
-- 1분복습 P188

SELECT AVG(COMM), DEPTNO
    FROM EMP
   GROUP BY DEPTNO;
   
-- GROUP BY 절 사용시 주의점

SELECT ENAME, DEPTNO, AVG(SAL)
    FROM EMP
   GROUP BY DEPTNO;
-- 오류코드 발생! ENAME이 다중행이어서(DEPTNO, AVG(SAL)은 단행)

-- GROUP BY절에 조건 주기 (HAVING 절)
-- 평균급여가 2000이상인 그룹의 직책별 평균 급여 구하기
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
   GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000
   ORDER BY DEPTNO, JOB;
   
-- WHERE절 : 출력 대상 행을 제한
-- HAVING절 : 그룹화된 대상을 출력에서 제한

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
   WHERE AVG(SAL) >= 2000 -- 그냥 SAL로 하면 출력 가능
  GROUP BY DEPTNO, JOB
  ORDER BY DEPTNO, JOB;
-- 오류코드!!

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
   GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000
   ORDER BY DEPTNO, JOB;
   
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
   WHERE SAL <= 3000
  GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000
  ORDER BY DEPTNO, JOB;
  
-- 1분 복습 P194

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
   GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 500
   ORDER BY DEPTNO, JOB
   
-- GROUP BY와 관련된 심화 함수