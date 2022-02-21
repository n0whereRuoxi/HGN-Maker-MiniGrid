( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b813 - block
    b352 - block
    b636 - block
    b634 - block
    b783 - block
    b327 - block
    b895 - block
    b915 - block
    b242 - block
    b82 - block
    b491 - block
    b450 - block
    b484 - block
    b421 - block
    b919 - block
    b333 - block
    b377 - block
    b188 - block
    b279 - block
    b586 - block
    b80 - block
    b374 - block
    b98 - block
    b270 - block
    b264 - block
    b131 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b813 )
    ( on b352 b813 )
    ( on b636 b352 )
    ( on b634 b636 )
    ( on b783 b634 )
    ( on b327 b783 )
    ( on b895 b327 )
    ( on b915 b895 )
    ( on b242 b915 )
    ( on b82 b242 )
    ( on b491 b82 )
    ( on b450 b491 )
    ( on b484 b450 )
    ( on b421 b484 )
    ( on b919 b421 )
    ( on b333 b919 )
    ( on b377 b333 )
    ( on b188 b377 )
    ( on b279 b188 )
    ( on b586 b279 )
    ( on b80 b586 )
    ( on b374 b80 )
    ( on b98 b374 )
    ( on b270 b98 )
    ( on b264 b270 )
    ( on b131 b264 )
    ( clear b131 )
  )
  ( :goal
    ( and
      ( clear b813 )
    )
  )
)
