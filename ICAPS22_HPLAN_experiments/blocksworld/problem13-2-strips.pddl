( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b586 - block
    b847 - block
    b956 - block
    b891 - block
    b252 - block
    b793 - block
    b640 - block
    b346 - block
    b713 - block
    b680 - block
    b168 - block
    b760 - block
    b130 - block
    b903 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b586 )
    ( on b847 b586 )
    ( on b956 b847 )
    ( on b891 b956 )
    ( on b252 b891 )
    ( on b793 b252 )
    ( on b640 b793 )
    ( on b346 b640 )
    ( on b713 b346 )
    ( on b680 b713 )
    ( on b168 b680 )
    ( on b760 b168 )
    ( on b130 b760 )
    ( on b903 b130 )
    ( clear b903 )
  )
  ( :goal
    ( and
      ( clear b586 )
    )
  )
)
