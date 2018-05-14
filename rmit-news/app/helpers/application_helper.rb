module ApplicationHelper

  def prettyDate(dateCreated)
       minutes_since_post = (DateTime.now.utc - dateCreated).round(0) / 60
       if minutes_since_post > 59
         hours = minutes_since_post / 60
         if hours > 24
           days = (hours / 24).round(0)
           if days = 1
             days = "a day ago"
           else
           days = "#{days} days ago"
         end
         else
           if hours = 1
             hours =  "about an hour ago"
           else
             hours =  "about #{hours} hours ago"
           end
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


     def localizedDate(dateCreate)
       localDate = dateCreate.localtime
       bigString = localDate.strftime("%I:%M%p") + localDate.strftime(" on %d/%m/%Y")

     end
end
