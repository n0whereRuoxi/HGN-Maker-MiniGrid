( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b772 - block
    b534 - block
    b811 - block
    b549 - block
    b347 - block
    b345 - block
    b430 - block
    b587 - block
    b604 - block
    b183 - block
    b295 - block
    b835 - block
    b35 - block
    b228 - block
    b226 - block
    b114 - block
    b978 - block
    b240 - block
    b825 - block
    b939 - block
    b404 - block
    b717 - block
    b334 - block
    b672 - block
    b497 - block
    b463 - block
    b498 - block
    b350 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b772 )
    ( on b534 b772 )
    ( on b811 b534 )
    ( on b549 b811 )
    ( on b347 b549 )
    ( on b345 b347 )
    ( on b430 b345 )
    ( on b587 b430 )
    ( on b604 b587 )
    ( on b183 b604 )
    ( on b295 b183 )
    ( on b835 b295 )
    ( on b35 b835 )
    ( on b228 b35 )
    ( on b226 b228 )
    ( on b114 b226 )
    ( on b978 b114 )
    ( on b240 b978 )
    ( on b825 b240 )
    ( on b939 b825 )
    ( on b404 b939 )
    ( on b717 b404 )
    ( on b334 b717 )
    ( on b672 b334 )
    ( on b497 b672 )
    ( on b463 b497 )
    ( on b498 b463 )
    ( on b350 b498 )
    ( clear b350 )
  )
  ( :goal
    ( and
      ( clear b772 )
    )
  )
)
