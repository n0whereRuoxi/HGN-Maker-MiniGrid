( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b747 - block
    b934 - block
    b127 - block
    b756 - block
    b644 - block
    b751 - block
    b155 - block
    b547 - block
    b69 - block
    b548 - block
    b328 - block
    b667 - block
    b544 - block
    b439 - block
    b92 - block
    b726 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b747 )
    ( on b934 b747 )
    ( on b127 b934 )
    ( on b756 b127 )
    ( on b644 b756 )
    ( on b751 b644 )
    ( on b155 b751 )
    ( on b547 b155 )
    ( on b69 b547 )
    ( on b548 b69 )
    ( on b328 b548 )
    ( on b667 b328 )
    ( on b544 b667 )
    ( on b439 b544 )
    ( on b92 b439 )
    ( on b726 b92 )
    ( clear b726 )
  )
  ( :goal
    ( and
      ( clear b747 )
    )
  )
)
