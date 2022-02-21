( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b520 - block
    b682 - block
    b698 - block
    b191 - block
    b353 - block
    b469 - block
    b804 - block
    b161 - block
    b399 - block
    b531 - block
    b701 - block
    b341 - block
    b228 - block
    b283 - block
    b334 - block
    b622 - block
    b160 - block
    b976 - block
    b628 - block
    b659 - block
    b323 - block
    b412 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b520 )
    ( on b682 b520 )
    ( on b698 b682 )
    ( on b191 b698 )
    ( on b353 b191 )
    ( on b469 b353 )
    ( on b804 b469 )
    ( on b161 b804 )
    ( on b399 b161 )
    ( on b531 b399 )
    ( on b701 b531 )
    ( on b341 b701 )
    ( on b228 b341 )
    ( on b283 b228 )
    ( on b334 b283 )
    ( on b622 b334 )
    ( on b160 b622 )
    ( on b976 b160 )
    ( on b628 b976 )
    ( on b659 b628 )
    ( on b323 b659 )
    ( on b412 b323 )
    ( clear b412 )
  )
  ( :goal
    ( and
      ( clear b520 )
    )
  )
)
