( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b63 - block
    b211 - block
    b232 - block
    b62 - block
    b761 - block
    b14 - block
    b349 - block
    b423 - block
    b425 - block
    b743 - block
    b508 - block
    b12 - block
    b968 - block
    b92 - block
    b686 - block
    b813 - block
    b569 - block
    b481 - block
    b982 - block
    b406 - block
    b769 - block
    b283 - block
    b341 - block
    b720 - block
    b89 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b63 )
    ( on b211 b63 )
    ( on b232 b211 )
    ( on b62 b232 )
    ( on b761 b62 )
    ( on b14 b761 )
    ( on b349 b14 )
    ( on b423 b349 )
    ( on b425 b423 )
    ( on b743 b425 )
    ( on b508 b743 )
    ( on b12 b508 )
    ( on b968 b12 )
    ( on b92 b968 )
    ( on b686 b92 )
    ( on b813 b686 )
    ( on b569 b813 )
    ( on b481 b569 )
    ( on b982 b481 )
    ( on b406 b982 )
    ( on b769 b406 )
    ( on b283 b769 )
    ( on b341 b283 )
    ( on b720 b341 )
    ( on b89 b720 )
    ( clear b89 )
  )
  ( :goal
    ( and
      ( clear b63 )
    )
  )
)
