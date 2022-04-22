( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b56 - block
    b461 - block
    b835 - block
    b806 - block
    b366 - block
    b777 - block
    b203 - block
    b689 - block
    b287 - block
    b292 - block
    b302 - block
    b121 - block
    b760 - block
    b82 - block
    b61 - block
    b378 - block
    b798 - block
    b391 - block
    b358 - block
    b783 - block
    b711 - block
    b972 - block
    b917 - block
    b343 - block
    b161 - block
    b272 - block
    b945 - block
    b465 - block
    b183 - block
    b89 - block
    b938 - block
    b599 - block
    b544 - block
    b444 - block
    b269 - block
    b47 - block
    b174 - block
    b736 - block
    b898 - block
    b957 - block
    b200 - block
    b715 - block
    b571 - block
    b381 - block
    b936 - block
    b155 - block
    b737 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b56 )
    ( on b461 b56 )
    ( on b835 b461 )
    ( on b806 b835 )
    ( on b366 b806 )
    ( on b777 b366 )
    ( on b203 b777 )
    ( on b689 b203 )
    ( on b287 b689 )
    ( on b292 b287 )
    ( on b302 b292 )
    ( on b121 b302 )
    ( on b760 b121 )
    ( on b82 b760 )
    ( on b61 b82 )
    ( on b378 b61 )
    ( on b798 b378 )
    ( on b391 b798 )
    ( on b358 b391 )
    ( on b783 b358 )
    ( on b711 b783 )
    ( on b972 b711 )
    ( on b917 b972 )
    ( on b343 b917 )
    ( on b161 b343 )
    ( on b272 b161 )
    ( on b945 b272 )
    ( on b465 b945 )
    ( on b183 b465 )
    ( on b89 b183 )
    ( on b938 b89 )
    ( on b599 b938 )
    ( on b544 b599 )
    ( on b444 b544 )
    ( on b269 b444 )
    ( on b47 b269 )
    ( on b174 b47 )
    ( on b736 b174 )
    ( on b898 b736 )
    ( on b957 b898 )
    ( on b200 b957 )
    ( on b715 b200 )
    ( on b571 b715 )
    ( on b381 b571 )
    ( on b936 b381 )
    ( on b155 b936 )
    ( on b737 b155 )
    ( clear b737 )
  )
  ( :goal
    ( and
      ( clear b56 )
    )
  )
)
