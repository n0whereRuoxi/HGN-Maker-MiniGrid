( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b723 - block
    b355 - block
    b558 - block
    b886 - block
    b511 - block
    b517 - block
    b532 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b723 )
    ( on b355 b723 )
    ( on b558 b355 )
    ( on b886 b558 )
    ( on b511 b886 )
    ( on b517 b511 )
    ( on b532 b517 )
    ( clear b532 )
  )
  ( :goal
    ( and
      ( clear b723 )
    )
  )
)
