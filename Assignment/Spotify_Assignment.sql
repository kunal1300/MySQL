CREATE DATABASE SPOTIFY_PROJECT;

use SPOTIFY_PROJECT;

select * from spotify_songs_2024;

--1.Songs with more than 500 million Spotify streams
UPDATE spotify_songs_2024
SET Spotify_Streams = 0
WHERE Spotify_Streams IS NULL;

ALTER TABLE spotify_songs_2024
ALTER COLUMN Spotify_Streams float;



select Spotify_Streams  from spotify_songs_2024 where Spotify_Streams >=500000000 ;
--output 1404

--2.Tracks that are not explicit

select Track from spotify_songs_2024;

select Track, Explicit_Track from spotify_songs_2024 where Explicit_Track=0;


--3.Tracks with Track Score between 400 and 700


ALTER TABLE spotify_songs_2024
ALTER COLUMN Track_Score int;

select * from spotify_songs_2024 where Track_Score between 400 and 700;


--4.Tracks containing the word “Love” in their name



select Track from spotify_songs_2024 where Track like 'love%' or Track like '%love%' or Track like '%love';



--5.Songs by 'Drake', 'Adele', or 'Beyoncé'


select Track,Artist from spotify_songs_2024 where Artist like 'Drake' or Artist like 'Adele' or Artist like 'Beyonc%';


--6.Find all tracks that have more than 10 million TikTok posts but less than 300 million Spotify streams.


select  TikTok_Posts,Spotify_Streams   from spotify_songs_2024 where TikTok_Posts > 10000000  and Spotify_Streams < 300000000 ;

--7.Tracks with available YouTube Likes

select Track,Artist,YouTube_Likes from spotify_songs_2024 where YouTube_Likes is not null;

--8.Tracks released in the year 2023

select Track,Release_Date as "released in the year 2023" from spotify_songs_2024 where Release_Date like '%2023%';

--9.Tracks with more than 300M Spotify streams AND explicit


select Track,Spotify_streams,Explicit_Track from spotify_songs_2024 where Spotify_streams> 300000000
and Explicit_Track=1;



--10.Tracks not by 'Taylor Swift' or 'Ed Sheeran', containing the word “night”




select *  from spotify_songs_2024 where Artist not in ('Taylor Swift','Ed Sheeran') and Track like '%night%';


