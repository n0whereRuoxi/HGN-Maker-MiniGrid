( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b772 - block
    b347 - block
    b197 - block
    b27 - block
    b327 - block
    b5 - block
    b886 - block
    b340 - block
    b933 - block
    b662 - block
    b141 - block
    b880 - block
    b450 - block
    b417 - block
    b424 - block
    b410 - block
    b491 - block
    b132 - block
    b458 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b772 )
    ( on b347 b772 )
    ( on b197 b347 )
    ( on b27 b197 )
    ( on b327 b27 )
    ( on b5 b327 )
    ( on b886 b5 )
    ( on b340 b886 )
    ( on b933 b340 )
    ( on b662 b933 )
    ( on b141 b662 )
    ( on b880 b141 )
    ( on b450 b880 )
    ( on b417 b450 )
    ( on b424 b417 )
    ( on b410 b424 )
    ( on b491 b410 )
    ( on b132 b491 )
    ( on b458 b132 )
    ( clear b458 )
  )
  ( :tasks
    ( Make-18Pile b347 b197 b27 b327 b5 b886 b340 b933 b662 b141 b880 b450 b417 b424 b410 b491 b132 b458 )
  )
)
