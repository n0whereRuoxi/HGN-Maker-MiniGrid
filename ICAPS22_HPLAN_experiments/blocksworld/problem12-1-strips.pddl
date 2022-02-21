( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b432 - block
    b875 - block
    b988 - block
    b721 - block
    b599 - block
    b679 - block
    b468 - block
    b752 - block
    b351 - block
    b556 - block
    b202 - block
    b685 - block
    b72 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b432 )
    ( on b875 b432 )
    ( on b988 b875 )
    ( on b721 b988 )
    ( on b599 b721 )
    ( on b679 b599 )
    ( on b468 b679 )
    ( on b752 b468 )
    ( on b351 b752 )
    ( on b556 b351 )
    ( on b202 b556 )
    ( on b685 b202 )
    ( on b72 b685 )
    ( clear b72 )
  )
  ( :goal
    ( and
      ( clear b432 )
    )
  )
)
