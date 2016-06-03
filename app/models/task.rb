class Task < ActiveRecord::Base

	validates_presence_of :title, :message => "A title must be entered"
end
