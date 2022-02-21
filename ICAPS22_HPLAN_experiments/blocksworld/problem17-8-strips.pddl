( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b654 - block
    b17 - block
    b537 - block
    b245 - block
    b678 - block
    b520 - block
    b611 - block
    b305 - block
    b303 - block
    b136 - block
    b381 - block
    b46 - block
    b185 - block
    b954 - block
    b851 - block
    b510 - block
    b123 - block
    b638 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b654 )
    ( on b17 b654 )
    ( on b537 b17 )
    ( on b245 b537 )
    ( on b678 b245 )
    ( on b520 b678 )
    ( on b611 b520 )
    ( on b305 b611 )
    ( on b303 b305 )
    ( on b136 b303 )
    ( on b381 b136 )
    ( on b46 b381 )
    ( on b185 b46 )
    ( on b954 b185 )
    ( on b851 b954 )
    ( on b510 b851 )
    ( on b123 b510 )
    ( on b638 b123 )
    ( clear b638 )
  )
  ( :goal
    ( and
      ( clear b654 )
    )
  )
)
