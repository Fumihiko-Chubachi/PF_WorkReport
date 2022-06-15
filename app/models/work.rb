class Work < ApplicationRecord

  enum progress_status: { unanswered: 0, checking: 1, examination: 2, possible: 3, impossible: 4, in_progress: 5, completion:6 }

  belongs_to :user

end