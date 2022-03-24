( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b928 - block
    b936 - block
    b318 - block
    b693 - block
    b280 - block
    b653 - block
    b806 - block
    b262 - block
    b823 - block
    b89 - block
    b333 - block
    b77 - block
    b494 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b928 )
    ( on b936 b928 )
    ( on b318 b936 )
    ( on b693 b318 )
    ( on b280 b693 )
    ( on b653 b280 )
    ( on b806 b653 )
    ( on b262 b806 )
    ( on b823 b262 )
    ( on b89 b823 )
    ( on b333 b89 )
    ( on b77 b333 )
    ( on b494 b77 )
    ( clear b494 )
  )
  ( :goal
    ( and
      ( clear b928 )
    )
  )
)
