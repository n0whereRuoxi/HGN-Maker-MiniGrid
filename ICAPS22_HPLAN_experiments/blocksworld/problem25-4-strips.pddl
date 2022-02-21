( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b933 - block
    b704 - block
    b327 - block
    b928 - block
    b896 - block
    b219 - block
    b553 - block
    b409 - block
    b524 - block
    b538 - block
    b971 - block
    b756 - block
    b199 - block
    b348 - block
    b803 - block
    b924 - block
    b254 - block
    b126 - block
    b332 - block
    b850 - block
    b253 - block
    b341 - block
    b750 - block
    b188 - block
    b449 - block
    b325 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b933 )
    ( on b704 b933 )
    ( on b327 b704 )
    ( on b928 b327 )
    ( on b896 b928 )
    ( on b219 b896 )
    ( on b553 b219 )
    ( on b409 b553 )
    ( on b524 b409 )
    ( on b538 b524 )
    ( on b971 b538 )
    ( on b756 b971 )
    ( on b199 b756 )
    ( on b348 b199 )
    ( on b803 b348 )
    ( on b924 b803 )
    ( on b254 b924 )
    ( on b126 b254 )
    ( on b332 b126 )
    ( on b850 b332 )
    ( on b253 b850 )
    ( on b341 b253 )
    ( on b750 b341 )
    ( on b188 b750 )
    ( on b449 b188 )
    ( on b325 b449 )
    ( clear b325 )
  )
  ( :goal
    ( and
      ( clear b933 )
    )
  )
)
