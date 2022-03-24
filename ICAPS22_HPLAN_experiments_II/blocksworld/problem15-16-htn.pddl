( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b76 - block
    b261 - block
    b285 - block
    b58 - block
    b430 - block
    b796 - block
    b798 - block
    b887 - block
    b233 - block
    b2 - block
    b264 - block
    b124 - block
    b527 - block
    b817 - block
    b320 - block
    b417 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b76 )
    ( on b261 b76 )
    ( on b285 b261 )
    ( on b58 b285 )
    ( on b430 b58 )
    ( on b796 b430 )
    ( on b798 b796 )
    ( on b887 b798 )
    ( on b233 b887 )
    ( on b2 b233 )
    ( on b264 b2 )
    ( on b124 b264 )
    ( on b527 b124 )
    ( on b817 b527 )
    ( on b320 b817 )
    ( on b417 b320 )
    ( clear b417 )
  )
  ( :tasks
    ( Make-15Pile b261 b285 b58 b430 b796 b798 b887 b233 b2 b264 b124 b527 b817 b320 b417 )
  )
)
