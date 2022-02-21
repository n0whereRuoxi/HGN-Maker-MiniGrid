( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b199 - block
    b751 - block
    b270 - block
    b157 - block
    b97 - block
    b591 - block
    b626 - block
    b269 - block
    b512 - block
    b54 - block
    b587 - block
    b540 - block
    b90 - block
    b577 - block
    b762 - block
    b17 - block
    b251 - block
    b970 - block
    b468 - block
    b482 - block
    b340 - block
    b301 - block
    b463 - block
    b51 - block
    b492 - block
    b241 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b199 )
    ( on b751 b199 )
    ( on b270 b751 )
    ( on b157 b270 )
    ( on b97 b157 )
    ( on b591 b97 )
    ( on b626 b591 )
    ( on b269 b626 )
    ( on b512 b269 )
    ( on b54 b512 )
    ( on b587 b54 )
    ( on b540 b587 )
    ( on b90 b540 )
    ( on b577 b90 )
    ( on b762 b577 )
    ( on b17 b762 )
    ( on b251 b17 )
    ( on b970 b251 )
    ( on b468 b970 )
    ( on b482 b468 )
    ( on b340 b482 )
    ( on b301 b340 )
    ( on b463 b301 )
    ( on b51 b463 )
    ( on b492 b51 )
    ( on b241 b492 )
    ( clear b241 )
  )
  ( :goal
    ( and
      ( clear b199 )
    )
  )
)
