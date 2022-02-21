( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b812 - block
    b307 - block
    b941 - block
    b762 - block
    b913 - block
    b639 - block
    b746 - block
    b8 - block
    b263 - block
    b153 - block
    b619 - block
    b557 - block
    b55 - block
    b993 - block
    b500 - block
    b657 - block
    b393 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b812 )
    ( on b307 b812 )
    ( on b941 b307 )
    ( on b762 b941 )
    ( on b913 b762 )
    ( on b639 b913 )
    ( on b746 b639 )
    ( on b8 b746 )
    ( on b263 b8 )
    ( on b153 b263 )
    ( on b619 b153 )
    ( on b557 b619 )
    ( on b55 b557 )
    ( on b993 b55 )
    ( on b500 b993 )
    ( on b657 b500 )
    ( on b393 b657 )
    ( clear b393 )
  )
  ( :goal
    ( and
      ( clear b812 )
    )
  )
)
