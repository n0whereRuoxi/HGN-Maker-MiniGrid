( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b403 - block
    b597 - block
    b78 - block
    b364 - block
    b210 - block
    b436 - block
    b252 - block
    b353 - block
    b491 - block
    b570 - block
    b227 - block
    b22 - block
    b708 - block
    b643 - block
    b578 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b403 )
    ( on b597 b403 )
    ( on b78 b597 )
    ( on b364 b78 )
    ( on b210 b364 )
    ( on b436 b210 )
    ( on b252 b436 )
    ( on b353 b252 )
    ( on b491 b353 )
    ( on b570 b491 )
    ( on b227 b570 )
    ( on b22 b227 )
    ( on b708 b22 )
    ( on b643 b708 )
    ( on b578 b643 )
    ( clear b578 )
  )
  ( :goal
    ( and
      ( clear b403 )
    )
  )
)
