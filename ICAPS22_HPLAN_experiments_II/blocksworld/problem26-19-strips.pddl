( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b664 - block
    b704 - block
    b482 - block
    b423 - block
    b223 - block
    b75 - block
    b89 - block
    b24 - block
    b592 - block
    b540 - block
    b292 - block
    b952 - block
    b610 - block
    b430 - block
    b46 - block
    b122 - block
    b672 - block
    b545 - block
    b256 - block
    b85 - block
    b869 - block
    b10 - block
    b327 - block
    b353 - block
    b123 - block
    b711 - block
    b378 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b664 )
    ( on b704 b664 )
    ( on b482 b704 )
    ( on b423 b482 )
    ( on b223 b423 )
    ( on b75 b223 )
    ( on b89 b75 )
    ( on b24 b89 )
    ( on b592 b24 )
    ( on b540 b592 )
    ( on b292 b540 )
    ( on b952 b292 )
    ( on b610 b952 )
    ( on b430 b610 )
    ( on b46 b430 )
    ( on b122 b46 )
    ( on b672 b122 )
    ( on b545 b672 )
    ( on b256 b545 )
    ( on b85 b256 )
    ( on b869 b85 )
    ( on b10 b869 )
    ( on b327 b10 )
    ( on b353 b327 )
    ( on b123 b353 )
    ( on b711 b123 )
    ( on b378 b711 )
    ( clear b378 )
  )
  ( :goal
    ( and
      ( clear b664 )
    )
  )
)
