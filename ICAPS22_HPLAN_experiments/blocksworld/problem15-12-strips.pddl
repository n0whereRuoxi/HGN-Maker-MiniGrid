( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b557 - block
    b167 - block
    b152 - block
    b586 - block
    b798 - block
    b92 - block
    b198 - block
    b765 - block
    b238 - block
    b947 - block
    b227 - block
    b724 - block
    b806 - block
    b425 - block
    b188 - block
    b181 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b557 )
    ( on b167 b557 )
    ( on b152 b167 )
    ( on b586 b152 )
    ( on b798 b586 )
    ( on b92 b798 )
    ( on b198 b92 )
    ( on b765 b198 )
    ( on b238 b765 )
    ( on b947 b238 )
    ( on b227 b947 )
    ( on b724 b227 )
    ( on b806 b724 )
    ( on b425 b806 )
    ( on b188 b425 )
    ( on b181 b188 )
    ( clear b181 )
  )
  ( :goal
    ( and
      ( clear b557 )
    )
  )
)
