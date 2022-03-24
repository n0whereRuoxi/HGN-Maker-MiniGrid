( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b253 - block
    b518 - block
    b438 - block
    b107 - block
    b320 - block
    b912 - block
    b775 - block
    b281 - block
    b732 - block
    b783 - block
    b725 - block
    b465 - block
    b817 - block
    b971 - block
    b625 - block
    b5 - block
    b94 - block
    b255 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b253 )
    ( on b518 b253 )
    ( on b438 b518 )
    ( on b107 b438 )
    ( on b320 b107 )
    ( on b912 b320 )
    ( on b775 b912 )
    ( on b281 b775 )
    ( on b732 b281 )
    ( on b783 b732 )
    ( on b725 b783 )
    ( on b465 b725 )
    ( on b817 b465 )
    ( on b971 b817 )
    ( on b625 b971 )
    ( on b5 b625 )
    ( on b94 b5 )
    ( on b255 b94 )
    ( clear b255 )
  )
  ( :goal
    ( and
      ( clear b253 )
    )
  )
)
