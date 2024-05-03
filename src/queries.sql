# 1. Запрос извлекает все данные о самолетах, которые запланированы для рейса
SELECT * 
FROM Airplane 
JOIN Flight ON AIRPLANE.AIRPLANE_ID=Flight.AIRPLANE_ID 
WHERE FLIGHT_STATUS='Scheduled';

# 2. Запрос вычисляет среднюю цену билетов на рейсы, выполненные на "2" самолете
SELECT AVG(TICKET_PRICE) 
FROM Ticket 
WHERE FLIGHT_ID IN (SELECT FLIGHT_ID FROM Flight WHERE AIRPLANE_ID_=2);

# 3. Рассчитывает среднюю цену билета
SELECT AVG(TICKET_PRICE) 
FROM Ticket;

# 4. Извлекает все рейсы, которые выполняются на Самолетах типа Boeing 737
SELECT * 
FROM Flight 
WHERE AIRPLANE_ID IN (SELECT AIRPLANE_ID FROM Airplane WHERE AIRPLANE_TYPE = 'Boeing 737');

# 5. Извлекает ID рейса, время отправления и время прибытия для рейсов, прибывающих в аэропорт Sheremetyevo International Airport
SELECT FLIGHT_ID, DEPARTURE_DTTM, ARRIVAL_DTTM 
FROM Flight 
WHERE ARRIVAL_AIRPORT = 'Sheremetyevo International Airport';

# 6. Этот запрос извлекает имена и фамилии пассажиров, у которых забронированы билеты
SELECT p.PASSENGER_FIRSTN, p.PASSENGER_LASTN 
FROM PASSENGER p 
JOIN TICKET t ON p.PASSENGER_ID = t.PASSENGER_ID 
WHERE t.TICKET_STATUS = 'Booked';

# 7. Получает имена и фамилии сотрудников, которые являются старшими бортпроводниками
SELECT e.CREW_FIRSTN, e.CREW_LASTN 
FROM Employee e 
JOIN Crew c ON e.EMPLOYEE_ID = c.SENIOR_FLIGHT_ATTENDANT

# 8. Этот запрос извлекает аэропорты отправления, из которых отправляется более 10 рейсов
SELECT DEPARTURE_AIRPORT, COUNT(*) 
FROM Flight 
GROUP BY DEPARTURE_AIRPORT 
HAVING COUNT(*) > 10;

# 9. Извлекает ID пассажиров, которые потратили более 10000 на билеты
SELECT PASSENGER_ID, SUM(TICKET_PRICE) 
FROM Ticket 
GROUP BY PASSENGER_ID 
HAVING SUM(TICKET_PRICE) > 10000;

# 10. Извлекает всех пассажиров, которые купили билеты по цене выше средней цены билета
SELECT * FROM Passenger 
WHERE PASSENGER_ID IN (SELECT PASSENGER_ID FROM TICKET WHERE TICKET_PRICE > (SELECT AVG(TICKET_PRICE) FROM TICKET));