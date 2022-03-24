( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b692 - block
    b177 - block
    b756 - block
    b665 - block
    b163 - block
    b560 - block
    b91 - block
    b365 - block
    b737 - block
    b280 - block
    b878 - block
    b958 - block
    b582 - block
    b368 - block
    b645 - block
    b544 - block
    b979 - block
    b321 - block
    b535 - block
    b553 - block
    b359 - block
    b666 - block
    b442 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b692 )
    ( on b177 b692 )
    ( on b756 b177 )
    ( on b665 b756 )
    ( on b163 b665 )
    ( on b560 b163 )
    ( on b91 b560 )
    ( on b365 b91 )
    ( on b737 b365 )
    ( on b280 b737 )
    ( on b878 b280 )
    ( on b958 b878 )
    ( on b582 b958 )
    ( on b368 b582 )
    ( on b645 b368 )
    ( on b544 b645 )
    ( on b979 b544 )
    ( on b321 b979 )
    ( on b535 b321 )
    ( on b553 b535 )
    ( on b359 b553 )
    ( on b666 b359 )
    ( on b442 b666 )
    ( clear b442 )
  )
  ( :goal
    ( and
      ( clear b692 )
    )
  )
)
