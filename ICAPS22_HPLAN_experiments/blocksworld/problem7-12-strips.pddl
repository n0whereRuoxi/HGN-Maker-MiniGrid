( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b282 - block
    b817 - block
    b182 - block
    b467 - block
    b747 - block
    b352 - block
    b801 - block
    b698 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b282 )
    ( on b817 b282 )
    ( on b182 b817 )
    ( on b467 b182 )
    ( on b747 b467 )
    ( on b352 b747 )
    ( on b801 b352 )
    ( on b698 b801 )
    ( clear b698 )
  )
  ( :goal
    ( and
      ( clear b282 )
    )
  )
)
