( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b852 - block
    b456 - block
    b950 - block
    b332 - block
    b139 - block
    b722 - block
    b551 - block
    b669 - block
    b549 - block
    b890 - block
    b851 - block
    b700 - block
    b242 - block
    b88 - block
    b821 - block
    b649 - block
    b372 - block
    b544 - block
    b283 - block
    b250 - block
    b893 - block
    b805 - block
    b264 - block
    b83 - block
    b808 - block
    b220 - block
    b962 - block
    b467 - block
    b973 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b852 )
    ( on b456 b852 )
    ( on b950 b456 )
    ( on b332 b950 )
    ( on b139 b332 )
    ( on b722 b139 )
    ( on b551 b722 )
    ( on b669 b551 )
    ( on b549 b669 )
    ( on b890 b549 )
    ( on b851 b890 )
    ( on b700 b851 )
    ( on b242 b700 )
    ( on b88 b242 )
    ( on b821 b88 )
    ( on b649 b821 )
    ( on b372 b649 )
    ( on b544 b372 )
    ( on b283 b544 )
    ( on b250 b283 )
    ( on b893 b250 )
    ( on b805 b893 )
    ( on b264 b805 )
    ( on b83 b264 )
    ( on b808 b83 )
    ( on b220 b808 )
    ( on b962 b220 )
    ( on b467 b962 )
    ( on b973 b467 )
    ( clear b973 )
  )
  ( :tasks
    ( Make-28Pile b456 b950 b332 b139 b722 b551 b669 b549 b890 b851 b700 b242 b88 b821 b649 b372 b544 b283 b250 b893 b805 b264 b83 b808 b220 b962 b467 b973 )
  )
)
