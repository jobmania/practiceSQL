-- ����(JOIN)
SELECT employee_id, first_name, job_id, job_title
FROM employees
NATURAL JOIN jobs;

-- ON �� ��� ,�⺻ ����   // Ư������ ���� "(){}" ǥ��
SELECT e.employee_id ������ȣ, e.last_name �̸�, d.department_name �μ��̸�,
        d.department_id "�μ���ȣ(����)"
FROM employees e JOIN departments d
    ON e.department_id = d.department_id;

-- 3���� ���̺� JOIN
SELECT employee_id, city, department_name
FROM employees e
JOIN departments d 
    ON e.department_id = d.department_id
JOIN locations l
    ON d.location_id = l.location_id;
    
-- WHERE ���..
SELECT e.employee_id ������ȣ, e.last_name �̸�, d.department_name �μ��̸�,
        d.department_id "�μ���ȣ(����)"
FROM employees e JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_id=50 AND e.salary > 5000;    


--����)�μ���(department_name) , ��Ƽ��(city), ������(country_name)�� ��Ÿ���� ���̺��� ����մϴ�.
--���̺���� countries �� departments�� locations�� ���� �մϴ�. 
--������, ��Ƽ�� 'Seattle' Ȥ�� 'London' �̾�� �ϰ� �������� ���ʿ� 'United' �� ���� �մϴ�.
SELECT department_name �μ���, city ��Ƽ��, country_name ������
FROM locations l 
JOIN departments d ON l.location_id = d.location_id
JOIN countries c ON l.country_id = c.country_id
WHERE (l.city='Seattle' OR l.city='London') AND c.country_name LIKE 'United%';


--- ��ü����
SELECT e.last_name �����̸�, m.last_name �Ŵ���
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id;
    
--�ܺ�����
--- �⺻���� (�μ���ȣ�� null�� ������ ��������)
SELECT e.employee_id ������ȣ, e.last_name �̸�, d.department_name �μ��̸�,
        d.department_id "�μ���ȣ(����)"
FROM employees e JOIN departments d
    ON e.department_id = d.department_id;
--    ����Ʈ �ܺ� ����, ������ ������ department_id�� ��� ���ε�.
SELECT e.employee_id ������ȣ, e.last_name �̸�, d.department_name �μ��̸�,
        d.department_id "�μ���ȣ(����)"
FROM employees e LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id
    ORDER BY d.department_id DESC;
--    ����Ʈ �ܺ� ����, �μ����̺� ������ ������ ���� �μ��� ���� ���
SELECT e.employee_id ������ȣ, e.last_name �̸�, d.department_name �μ��̸�,
        d.department_id "�μ���ȣ(����)"
FROM employees e RIGHT OUTER JOIN departments d
    ON e.department_id = d.department_id
    ORDER BY d.department_id DESC;
    
--    FULL �ܺ� ����, �μ����̺� ������ ������ ���� �μ��� ���� ���
SELECT e.employee_id ������ȣ, e.last_name �̸�, d.department_name �μ��̸�,
        d.department_id "�μ���ȣ(����)"
FROM employees e FULL OUTER JOIN departments d
    ON e.department_id = d.department_id;    

-- ����) countries , locations ���̺��� �����Ͽ� �Ʒ��� ���� ����Ͻÿ�.
--(������ȣ�� DESC ����)
--country_name ����, country_id ������ȣ,
--location_id ������ȣ, city ����
SELECT c.country_name ����, c.country_id ������ȣ,
l.location_id ������ȣ, l.city ���� 
FROM countries c LEFT OUTER JOIN locations l
    ON c.country_id = l.country_id
    ORDER BY l.location_id DESC;
    
    
--   ũ�ν� ���� ���̺�1�� ���̺�2�� ���� �����ϸ� �� ���̺��� ���� ���� ���� �Ͱ� ���� ������ ��� ���� �����.
-- ���� ) countries , regions ���̺��� ũ�ν� �����Ͽ� �Ʒ��� ����  ������ ���̺���     25�� X 4�� => 100���� ����� �������� �ϼ���.
SELECT c.country_name �����̸�, r.region_name �����̸� 
FROM countries c 
CROSS JOIN regions r;