( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b877 - block
    b223 - block
    b618 - block
    b251 - block
    b630 - block
    b790 - block
    b401 - block
    b761 - block
    b144 - block
    b1 - block
    b364 - block
    b826 - block
    b55 - block
    b417 - block
    b301 - block
    b821 - block
    b259 - block
    b45 - block
    b42 - block
    b500 - block
    b421 - block
    b31 - block
    b221 - block
    b235 - block
    b467 - block
    b295 - block
    b915 - block
    b74 - block
    b442 - block
    b960 - block
    b180 - block
    b958 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b877 )
    ( on b223 b877 )
    ( on b618 b223 )
    ( on b251 b618 )
    ( on b630 b251 )
    ( on b790 b630 )
    ( on b401 b790 )
    ( on b761 b401 )
    ( on b144 b761 )
    ( on b1 b144 )
    ( on b364 b1 )
    ( on b826 b364 )
    ( on b55 b826 )
    ( on b417 b55 )
    ( on b301 b417 )
    ( on b821 b301 )
    ( on b259 b821 )
    ( on b45 b259 )
    ( on b42 b45 )
    ( on b500 b42 )
    ( on b421 b500 )
    ( on b31 b421 )
    ( on b221 b31 )
    ( on b235 b221 )
    ( on b467 b235 )
    ( on b295 b467 )
    ( on b915 b295 )
    ( on b74 b915 )
    ( on b442 b74 )
    ( on b960 b442 )
    ( on b180 b960 )
    ( on b958 b180 )
    ( clear b958 )
  )
  ( :goal
    ( and
      ( clear b877 )
    )
  )
)
