create database Ola;
use Ola;
#1. Retrieve all successful bookings:
create view successful_Bookings as
select * from bookings where Booking_status="success";
select *from successful_bookings;

#2. Find the average ride distance for each vehicle type:
create view Ride_dist_vehicle as
select vehicle_type,avg(ride_distance) from bookings group by vehicle_type;

select * from ride_dist_vehicle;

#3. Get the total number of cancelled rides by customers:
create view canceled_by_cust as
select count(*) from bookings where booking_status="canceled by customer";

select * from canceled_by_cust;


#4. List the top 5 customers who booked the highest number of rides:
create view top_5_cust as
select customer_id, count(booking_id) as cnt from bookings group by customer_id order by cnt desc limit 5;

select * from top_5_cust;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view rides_canceled_by_drivers as
select count(*) from bookings where canceled_rides_by_driver="personal & car related issue";

select * from rides_canceled_by_drivers;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view sedan_max_min_rating as
select max(driver_ratings) as max,min(driver_ratings) as min from bookings where vehicle_type="prime sedan";

select * from sedan_max_min_rating;

#7. Retrieve all rides where payment was made using UPI:
create view UPI_payment as
select * from bookings where payment_method="UPI";

select * from upi_payment;

#8. Find the average customer rating per vehicle type:
create view rating_vehicle_type as
select vehicle_type,avg(customer_rating) from bookings group by vehicle_type;

select * from rating_vehicle_type;

#9. Calculate the total booking value of rides completed successfully:
create view bookig_val_success as
select sum(booking_value) from bookings where booking_status="success";

select * from bookig_val_success;

#10. List all incomplete rides along with the reason:
create view Incomple_ride_reason as
select booking_id ,incomplete_rides_reason from bookings where incomplete_rides="yes";

select * from incomple_ride_reason;
