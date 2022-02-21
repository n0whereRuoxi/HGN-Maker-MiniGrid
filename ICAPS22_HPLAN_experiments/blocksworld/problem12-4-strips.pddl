( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b579 - block
    b248 - block
    b563 - block
    b664 - block
    b396 - block
    b628 - block
    b177 - block
    b458 - block
    b274 - block
    b793 - block
    b226 - block
    b452 - block
    b362 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b579 )
    ( on b248 b579 )
    ( on b563 b248 )
    ( on b664 b563 )
    ( on b396 b664 )
    ( on b628 b396 )
    ( on b177 b628 )
    ( on b458 b177 )
    ( on b274 b458 )
    ( on b793 b274 )
    ( on b226 b793 )
    ( on b452 b226 )
    ( on b362 b452 )
    ( clear b362 )
  )
  ( :goal
    ( and
      ( clear b579 )
    )
  )
)
