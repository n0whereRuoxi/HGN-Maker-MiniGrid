( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b672 - block
    b446 - block
    b889 - block
    b483 - block
    b713 - block
    b153 - block
    b371 - block
    b586 - block
    b140 - block
    b150 - block
    b907 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b672 )
    ( on b446 b672 )
    ( on b889 b446 )
    ( on b483 b889 )
    ( on b713 b483 )
    ( on b153 b713 )
    ( on b371 b153 )
    ( on b586 b371 )
    ( on b140 b586 )
    ( on b150 b140 )
    ( on b907 b150 )
    ( clear b907 )
  )
  ( :goal
    ( and
      ( clear b672 )
    )
  )
)
