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