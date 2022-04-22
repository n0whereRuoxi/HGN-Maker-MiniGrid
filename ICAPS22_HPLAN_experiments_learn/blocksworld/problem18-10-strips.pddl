( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b723 - block
    b346 - block
    b101 - block
    b254 - block
    b695 - block
    b99 - block
    b522 - block
    b60 - block
    b164 - block
    b421 - block
    b41 - block
    b485 - block
    b435 - block
    b240 - block
    b627 - block
    b57 - block
    b736 - block
    b239 - block
    b882 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b723 )
    ( on b346 b723 )
    ( on b101 b346 )
    ( on b254 b101 )
    ( on b695 b254 )
    ( on b99 b695 )
    ( on b522 b99 )
    ( on b60 b522 )
    ( on b164 b60 )
    ( on b421 b164 )
    ( on b41 b421 )
    ( on b485 b41 )
    ( on b435 b485 )
    ( on b240 b435 )
    ( on b627 b240 )
    ( on b57 b627 )
    ( on b736 b57 )
    ( on b239 b736 )
    ( on b882 b239 )
    ( clear b882 )
  )
  ( :goal
    ( and
      ( clear b723 )
    )
  )
)
