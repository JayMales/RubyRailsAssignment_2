module ApplicationHelper

  def prettyDate(dateNow, dateCreated)
       minutes_since_post = (dateNow - dateCreated).round(0) / 60
       if minutes_since_post > 59
         hours = minutes_since_post / 60
         if hours > 24
           days = (hours / 24).round(0)
           if days > 2
             days = "a day ago"
           else
           days = "#{days} days ago"
         end
         else
           hours =  "about #{hours} hours ago"
         end
       else
         if minutes_since_post == 0
           minutes_since_post = "just now"
         elsif minutes_since_post == 1
           minutes_since_post = "about a minute ago"
         else
           minutes_since_post = "about #{minutes_since_post} minutes ago"
         end
       end
     end
     
end
