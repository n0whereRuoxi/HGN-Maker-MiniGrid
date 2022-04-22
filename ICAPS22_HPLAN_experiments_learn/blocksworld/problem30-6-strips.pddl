( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b446 - block
    b212 - block
    b573 - block
    b468 - block
    b913 - block
    b371 - block
    b908 - block
    b947 - block
    b605 - block
    b491 - block
    b12 - block
    b2 - block
    b203 - block
    b656 - block
    b374 - block
    b745 - block
    b929 - block
    b467 - block
    b788 - block
    b244 - block
    b790 - block
    b190 - block
    b270 - block
    b11 - block
    b309 - block
    b607 - block
    b366 - block
    b211 - block
    b466 - block
    b505 - block
    b164 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b446 )
    ( on b212 b446 )
    ( on b573 b212 )
    ( on b468 b573 )
    ( on b913 b468 )
    ( on b371 b913 )
    ( on b908 b371 )
    ( on b947 b908 )
    ( on b605 b947 )
    ( on b491 b605 )
    ( on b12 b491 )
    ( on b2 b12 )
    ( on b203 b2 )
    ( on b656 b203 )
    ( on b374 b656 )
    ( on b745 b374 )
    ( on b929 b745 )
    ( on b467 b929 )
    ( on b788 b467 )
    ( on b244 b788 )
    ( on b790 b244 )
    ( on b190 b790 )
    ( on b270 b190 )
    ( on b11 b270 )
    ( on b309 b11 )
    ( on b607 b309 )
    ( on b366 b607 )
    ( on b211 b366 )
    ( on b466 b211 )
    ( on b505 b466 )
    ( on b164 b505 )
    ( clear b164 )
  )
  ( :goal
    ( and
      ( clear b446 )
    )
  )
)
