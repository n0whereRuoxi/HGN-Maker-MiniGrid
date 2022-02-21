( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b955 - block
    b567 - block
    b962 - block
    b632 - block
    b702 - block
    b60 - block
    b921 - block
    b556 - block
    b898 - block
    b945 - block
    b455 - block
    b762 - block
    b606 - block
    b992 - block
    b953 - block
    b112 - block
    b159 - block
    b395 - block
    b140 - block
    b555 - block
    b74 - block
    b397 - block
    b71 - block
    b787 - block
    b538 - block
    b991 - block
    b649 - block
    b43 - block
    b522 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b955 )
    ( on b567 b955 )
    ( on b962 b567 )
    ( on b632 b962 )
    ( on b702 b632 )
    ( on b60 b702 )
    ( on b921 b60 )
    ( on b556 b921 )
    ( on b898 b556 )
    ( on b945 b898 )
    ( on b455 b945 )
    ( on b762 b455 )
    ( on b606 b762 )
    ( on b992 b606 )
    ( on b953 b992 )
    ( on b112 b953 )
    ( on b159 b112 )
    ( on b395 b159 )
    ( on b140 b395 )
    ( on b555 b140 )
    ( on b74 b555 )
    ( on b397 b74 )
    ( on b71 b397 )
    ( on b787 b71 )
    ( on b538 b787 )
    ( on b991 b538 )
    ( on b649 b991 )
    ( on b43 b649 )
    ( on b522 b43 )
    ( clear b522 )
  )
  ( :goal
    ( and
      ( clear b955 )
    )
  )
)
