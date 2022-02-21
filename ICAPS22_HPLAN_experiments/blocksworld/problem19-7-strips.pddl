( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b197 - block
    b537 - block
    b485 - block
    b971 - block
    b921 - block
    b128 - block
    b811 - block
    b295 - block
    b907 - block
    b12 - block
    b953 - block
    b204 - block
    b707 - block
    b213 - block
    b151 - block
    b53 - block
    b729 - block
    b113 - block
    b143 - block
    b417 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b197 )
    ( on b537 b197 )
    ( on b485 b537 )
    ( on b971 b485 )
    ( on b921 b971 )
    ( on b128 b921 )
    ( on b811 b128 )
    ( on b295 b811 )
    ( on b907 b295 )
    ( on b12 b907 )
    ( on b953 b12 )
    ( on b204 b953 )
    ( on b707 b204 )
    ( on b213 b707 )
    ( on b151 b213 )
    ( on b53 b151 )
    ( on b729 b53 )
    ( on b113 b729 )
    ( on b143 b113 )
    ( on b417 b143 )
    ( clear b417 )
  )
  ( :goal
    ( and
      ( clear b197 )
    )
  )
)
