( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b820 - block
    b566 - block
    b863 - block
    b138 - block
    b536 - block
    b80 - block
    b519 - block
    b762 - block
    b445 - block
    b393 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b820 )
    ( on b566 b820 )
    ( on b863 b566 )
    ( on b138 b863 )
    ( on b536 b138 )
    ( on b80 b536 )
    ( on b519 b80 )
    ( on b762 b519 )
    ( on b445 b762 )
    ( on b393 b445 )
    ( clear b393 )
  )
  ( :goal
    ( and
      ( clear b820 )
    )
  )
)
