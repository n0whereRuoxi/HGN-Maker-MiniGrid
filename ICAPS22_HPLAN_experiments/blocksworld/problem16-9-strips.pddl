( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b290 - block
    b306 - block
    b935 - block
    b695 - block
    b215 - block
    b88 - block
    b362 - block
    b11 - block
    b815 - block
    b295 - block
    b881 - block
    b382 - block
    b437 - block
    b515 - block
    b804 - block
    b592 - block
    b926 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b290 )
    ( on b306 b290 )
    ( on b935 b306 )
    ( on b695 b935 )
    ( on b215 b695 )
    ( on b88 b215 )
    ( on b362 b88 )
    ( on b11 b362 )
    ( on b815 b11 )
    ( on b295 b815 )
    ( on b881 b295 )
    ( on b382 b881 )
    ( on b437 b382 )
    ( on b515 b437 )
    ( on b804 b515 )
    ( on b592 b804 )
    ( on b926 b592 )
    ( clear b926 )
  )
  ( :goal
    ( and
      ( clear b290 )
    )
  )
)
