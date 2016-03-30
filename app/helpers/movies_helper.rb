module MoviesHelper

  def formatted_date(date)
    date.strftime("%b %d, %Y")
    #code to display the above:
    #<%= formatted_date(@movie.release_date) %>
  end

end
