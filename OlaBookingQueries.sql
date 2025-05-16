create database Ola;
use Ola;
select * from bookings;
# 1. Retrieve all successful bookings:
Create View Successful_Bookings As
select * from bookings
where Booking_Status = 'Success';
select * from Successful_Bookings;


# 2. Find the average ride distance for each vehicle type:
select Vehicle_Type, avg(Ride_Distance) as Avg_Ride_Dist
from bookings
group by Vehicle_Type
order by Avg_Ride_Dist desc;

# 3. Get the total number of cancelled rides by customers:
Select count(Canceled_Rides_by_Customer) as Total_Cancelled_Ride
from bookings;
# OR 
SELECT COUNT(*) FROM bookings WHERE Booking_Status = 'canceled by Customer';

# 4. List the top 5 customers who booked the highest number of rides:
select Customer_ID , count(Booking_ID) total_rides
from bookings
group by Customer_ID
order by total_rides desc
limit 5;

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select count(Canceled_Rides_by_Driver) as Total_Cancelled_Rides_By_Deiver
from bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select max(Driver_Ratings) as Max_Driver_Rating, min(Driver_Ratings)
from bookings
where Vehicle_Type = 'Prime Sedan';				
																				
# 7. Retrieve all rides where payment was made using UPI:
select * 
from bookings
where Payment_Method = 'UPI';

# 8. Find the average customer rating per vehicle type:
select Vehicle_Type, round(avg(Customer_Rating), 2) as Avg_Cust_Rating
from bookings
group by Vehicle_Type;

# 9. Calculate the total booking value of rides completed successfully:
select Sum(Booking_Value) Total_Booking_Value
from bookings
where Booking_Status = 'Success';

# 10. List all incomplete rides along with the reason:
select Incomplete_Rides, Incomplete_Rides_Reason
from bookings 
where Incomplete_Rides = 'Yes';

