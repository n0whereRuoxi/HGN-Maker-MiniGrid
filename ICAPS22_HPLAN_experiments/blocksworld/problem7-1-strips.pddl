( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b779 - block
    b15 - block
    b197 - block
    b445 - block
    b322 - block
    b362 - block
    b73 - block
    b317 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b779 )
    ( on b15 b779 )
    ( on b197 b15 )
    ( on b445 b197 )
    ( on b322 b445 )
    ( on b362 b322 )
    ( on b73 b362 )
    ( on b317 b73 )
    ( clear b317 )
  )
  ( :goal
    ( and
      ( clear b779 )
    )
  )
)
