( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b828 - block
    b128 - block
    b425 - block
    b500 - block
    b283 - block
    b849 - block
    b507 - block
    b202 - block
    b115 - block
    b711 - block
    b22 - block
    b307 - block
    b817 - block
    b958 - block
    b140 - block
    b448 - block
    b420 - block
    b214 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b828 )
    ( on b128 b828 )
    ( on b425 b128 )
    ( on b500 b425 )
    ( on b283 b500 )
    ( on b849 b283 )
    ( on b507 b849 )
    ( on b202 b507 )
    ( on b115 b202 )
    ( on b711 b115 )
    ( on b22 b711 )
    ( on b307 b22 )
    ( on b817 b307 )
    ( on b958 b817 )
    ( on b140 b958 )
    ( on b448 b140 )
    ( on b420 b448 )
    ( on b214 b420 )
    ( clear b214 )
  )
  ( :goal
    ( and
      ( clear b828 )
    )
  )
)
