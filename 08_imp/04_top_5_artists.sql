/*
Question: Top 5 Artists Appearing in Global Top 10 (Spotify)

Assume there are three Spotify tables: artists, songs, and global_song_rank,
which contain information about the artists, songs, and music charts.

Write a query to find the top 5 artists whose songs appear most frequently
in the Top 10 of the global_song_rank table.

Display the top 5 artist names in ascending order, along with their
song appearance ranking.

Rules:
- Only consider rows where rank <= 10.
- Count how many times each artist's songs appear in the Top 10.
- Rank artists based on the number of appearances.
- If two or more artists have the same number of appearances,
  they should receive the same rank.
- Ranking numbers should be continuous (Dense Ranking):
  Example: 1, 2, 2, 3, 4, 5.

Tables:

artists
-------
artist_id    integer
artist_name  varchar
label_owner  varchar

Example Input:
artist_id | artist_name | label_owner
-------------------------------------
101       | Ed Sheeran  | Warner Music Group
120       | Drake       | Warner Music Group
125       | Bad Bunny   | Rimas Entertainment


songs
-----
song_id    integer
artist_id  integer
name       varchar

Example Input:
song_id | artist_id | name
--------------------------
55511   | 101       | Perfect
45202   | 101       | Shape of You
22222   | 120       | One Dance
19960   | 120       | Hotline Bling


global_song_rank
----------------
day      integer (1-52)
song_id  integer
rank     integer (1-1,000,000)

Example Input:
day | song_id | rank
--------------------
1   | 45202   | 5
3   | 45202   | 2
1   | 19960   | 3
9   | 19960   | 15


Expected Output:
artist_name | artist_rank
-------------------------
Ed Sheeran  | 1
Drake       | 2

Explanation:
Ed Sheeran's song appears twice in the Top 10 of the global_song_rank table,
while Drake's song appears once. Therefore, Ed Sheeran is ranked #1 and
Drake is ranked #2.

Note:
The dataset you are querying against may have different input & output.
This is only an example.
*/
With a AS (
SELECT a.artist_name AS artist_name,
       count(*) total_song
FROM artists a
join songs s
on a.artist_id = s.artist_id
join global_song_rank r
on s.song_id = r.song_id
where r.rank <= 10
group by a.artist_name
),b as(
select artist_name,
        dense_rank() over (order by total_song desc) artist_rank
from a
)
select *
from b where artist_rank <=5
