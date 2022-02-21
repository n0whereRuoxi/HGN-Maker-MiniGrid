( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b391 - block
    b522 - block
    b863 - block
    b124 - block
    b786 - block
    b201 - block
    b665 - block
    b881 - block
    b569 - block
    b621 - block
    b490 - block
    b403 - block
    b372 - block
    b963 - block
    b304 - block
    b197 - block
    b980 - block
    b539 - block
    b821 - block
    b59 - block
    b654 - block
    b724 - block
    b368 - block
    b559 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b391 )
    ( on b522 b391 )
    ( on b863 b522 )
    ( on b124 b863 )
    ( on b786 b124 )
    ( on b201 b786 )
    ( on b665 b201 )
    ( on b881 b665 )
    ( on b569 b881 )
    ( on b621 b569 )
    ( on b490 b621 )
    ( on b403 b490 )
    ( on b372 b403 )
    ( on b963 b372 )
    ( on b304 b963 )
    ( on b197 b304 )
    ( on b980 b197 )
    ( on b539 b980 )
    ( on b821 b539 )
    ( on b59 b821 )
    ( on b654 b59 )
    ( on b724 b654 )
    ( on b368 b724 )
    ( on b559 b368 )
    ( clear b559 )
  )
  ( :goal
    ( and
      ( clear b391 )
    )
  )
)
