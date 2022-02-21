( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b569 - block
    b457 - block
    b959 - block
    b597 - block
    b75 - block
    b794 - block
    b186 - block
    b705 - block
    b11 - block
    b773 - block
    b331 - block
    b238 - block
    b95 - block
    b449 - block
    b892 - block
    b519 - block
    b79 - block
    b796 - block
    b318 - block
    b325 - block
    b709 - block
    b202 - block
    b588 - block
    b143 - block
    b170 - block
    b711 - block
    b502 - block
    b625 - block
    b548 - block
    b348 - block
    b397 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b569 )
    ( on b457 b569 )
    ( on b959 b457 )
    ( on b597 b959 )
    ( on b75 b597 )
    ( on b794 b75 )
    ( on b186 b794 )
    ( on b705 b186 )
    ( on b11 b705 )
    ( on b773 b11 )
    ( on b331 b773 )
    ( on b238 b331 )
    ( on b95 b238 )
    ( on b449 b95 )
    ( on b892 b449 )
    ( on b519 b892 )
    ( on b79 b519 )
    ( on b796 b79 )
    ( on b318 b796 )
    ( on b325 b318 )
    ( on b709 b325 )
    ( on b202 b709 )
    ( on b588 b202 )
    ( on b143 b588 )
    ( on b170 b143 )
    ( on b711 b170 )
    ( on b502 b711 )
    ( on b625 b502 )
    ( on b548 b625 )
    ( on b348 b548 )
    ( on b397 b348 )
    ( clear b397 )
  )
  ( :goal
    ( and
      ( clear b569 )
    )
  )
)
