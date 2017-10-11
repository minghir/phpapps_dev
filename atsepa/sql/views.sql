/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  victor.minghir
 * Created: Oct 10, 2017
 */

drop view view_forum_categories;
create view view_forum_categories as select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME,
(SELECT COUNT(*) FROM atsepa.topics WHERE atsepa.topics.CAT_ID = a.ID ) AS NO_TOPICS,
	(SELECT COUNT(*) FROM atsepa.posts LEFT JOIN atsepa.topics ON (atsepa.posts.TOPIC_ID = atsepa.topics.ID)  
 WHERE atsepa.topics.CAT_ID = a.ID ) AS NO_POSTS
from atsepa.forum_categories a WHERE PID <> 0 ORDER BY  CONCAT(PARENT_NAME,NAME)


drop view view_forum_topics;
create view view_forum_topics as SELECT t.ID, t.SUBJECT,t.DESCRIPTION, t.TOPIC_DATE,t.CAT_ID,c.NAME,u.USERNAME,
( SELECT COUNT(*) AS NO_POSTS FROM atsepa.posts p WHERE p.TOPIC_ID = t.ID ) AS NO_POSTS
 FROM atsepa.topics t left join 
atsepa.forum_categories c ON (t.CAT_ID = c.ID) left join atsepa.app_users u on (t.USER_ID = u.ID)

drop view view_forum_posts;
create view view_forum_posts as 
SELECT p.ID,p.POST_DATE,p.TOPIC_ID,p.USER_ID,p.CONTENT,t.SUBJECT, u.USERNAME , c.NAME,
c.ID AS CAT_ID FROM 
atsepa.posts p left join atsepa.topics t on (p.TOPIC_ID = t.ID) 
left join atsepa.app_users u on (p.USER_ID = u.ID)
left join atsepa.forum_categories c on (t.CAT_ID = c.ID)
