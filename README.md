# Analyzing-the-Data-Analyst-Job-Market-Database-Design
> 2024_2nd_Semester_Database_Final_project_데이터베이스 기말 프로젝트
---
#### 📖 개요
**목적**  
- 데이터 애널리스트 직무 중 연봉이 높은 상위 10개 직무를 분석
- 필요한 스킬, 수요, 평균 연봉 등을 파악하여 최적의 학습 방향 제시

**배경**
- 데이터 분석 직무는 기술 시장에서 수요가 높음
  
**필요성**  
- 기업별 직무 요구사항, 연봉, 위치 데이터를 관리하고 분석하는 시스템 필요

**데이터베이스 선정이유**
- 관련성: 데이터 애널리스트 직무는 현재 IT 및 데이터 산업에서 높은 수요와 중요성을 지님
- 데이터 가용성: 다양한 직무, 회사, 스킬 관련 데이터를 쉽게 수집 및 관리 가능
- 교육적 가치: SQL을 활용한 데이터 분석 및 관계형 데이터베이스 설계 연습에 적합 

**데이터베이스 설명**  
*출처*  
> GitHub (lukebarousse/SQL_Project_Data_Job_Analysis)

*주요 데이터 필드*
- Jobs
- Companies
- JopPastings
- Skills
- JobSills
- Applicants
- Applications
- Departments
- JobLocations
- Benefits

**ERD**  
<img src="https://github.com/user-attachments/assets/775556e0-d676-4b2a-852b-b13554b6b57f"  width="400" height="300"/>  

**ERD 설명**   
- Jobs ↔ JobPostings: 1:N 관계 (하나의 직무에 여러 채용 공고가 있을 수 있음)
- Companies ↔ JobPostings: 1:N 관계 (하나의 회사가 여러 채용 공고를 낼 수 있음)
- Jobs ↔ JobSkills ↔ Skills: M:N 관계 (하나의 직무에 여러 스킬이 필요하고, 하나의 스킬이 여러 직무에 필요할 수 있음)
- JobPostings ↔ Applications ↔ Applicants: 1:N 관계 (하나의 채용 공고에 여러 지원자가 있을 수 있음)
- Companies ↔ Departments: 1:N 관계 (하나의 회사에 여러 부서가 있을 수 있음)
- JobPostings ↔ JobLocations: 1:N 관계 (하나의 채용 공고에 여러 위치가 있을 수 있음)
- Jobs ↔ Benefits: 1:N 관계 (하나의 직무에 여러 혜택이 있을 수 있음) 

##### 📋 결론 및 향후 연구  
*결론*
- 데이터 애널리스트 직무 중 상위 10개 연봉 직무의 주요 스킬과 요구 사항 파악
- 의의: 취업 준비 및 스킬 개발 방향 설정에 유용한 정보 제공
  
*향후연구*
- 직무 비교 분석: 다른 데이터 관련 직무와의 연봉 및 스킬 비교
- 시계열 분석: 연봉 및 스킬 수요의 시간적 변화 추이 분석
- 지역별 분석: 특정 지역에서의 데이터 애널리스트 직무 특성 분석



