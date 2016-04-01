class Movie < ActiveRecord::Base

  has_many :reviews

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :release_date,
    presence: true

  validate :release_date_is_in_the_past

  mount_uploader :image, ImageUploader

  def review_average
    if defined? reviews.sum(:rating_out_of_ten)/reviews.size
      reviews.sum(:rating_out_of_ten)/reviews.size
    else
      "Add the first review to this movie."
    end
  end

  def self.filter(movie_type, movie_length, search_term)
    movies = Movie.all
    if movie_type == "title"
      movies = movies.where("title like ?", "%#{search_term}%")
    elsif movie_type == "director"
      movies = movies.where("director like ?", "%#{search_term}%")
    elsif movie_type == "all"
      movies = movies.where("title like ? OR director like ?", "%#{search_term}%", "%#{search_term}%")
    end

    if movie_length == "under_90_mins"
      movies = movies.where("runtime_in_minutes < 90")
    elsif movie_length == "between_90_and_120_mins"
      movies = movies.where("runtime_in_minutes >= 90 AND runtime_in_minutes <= 120") 
    elsif movie_length == "over_120_mins"
      movies = movies.where("runtime_in_minutes > 120")
    # elsif movie_length == "any_length" -> not included since this does not filter anything.
    end
    movies
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end

  # helper_method, :filter

end
