( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b943 - block
    b275 - block
    b711 - block
    b387 - block
    b530 - block
    b637 - block
    b375 - block
    b383 - block
    b507 - block
    b191 - block
    b862 - block
    b923 - block
    b286 - block
    b203 - block
    b464 - block
    b957 - block
    b709 - block
    b981 - block
    b976 - block
    b956 - block
    b195 - block
    b361 - block
    b15 - block
    b458 - block
    b233 - block
    b911 - block
    b147 - block
    b368 - block
    b5 - block
    b915 - block
    b340 - block
    b17 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b943 )
    ( on b275 b943 )
    ( on b711 b275 )
    ( on b387 b711 )
    ( on b530 b387 )
    ( on b637 b530 )
    ( on b375 b637 )
    ( on b383 b375 )
    ( on b507 b383 )
    ( on b191 b507 )
    ( on b862 b191 )
    ( on b923 b862 )
    ( on b286 b923 )
    ( on b203 b286 )
    ( on b464 b203 )
    ( on b957 b464 )
    ( on b709 b957 )
    ( on b981 b709 )
    ( on b976 b981 )
    ( on b956 b976 )
    ( on b195 b956 )
    ( on b361 b195 )
    ( on b15 b361 )
    ( on b458 b15 )
    ( on b233 b458 )
    ( on b911 b233 )
    ( on b147 b911 )
    ( on b368 b147 )
    ( on b5 b368 )
    ( on b915 b5 )
    ( on b340 b915 )
    ( on b17 b340 )
    ( clear b17 )
  )
  ( :goal
    ( and
      ( clear b943 )
    )
  )
)
