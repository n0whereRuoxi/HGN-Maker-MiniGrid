( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b354 - block
    b534 - block
    b769 - block
    b726 - block
    b674 - block
    b676 - block
    b332 - block
    b620 - block
    b813 - block
    b971 - block
    b218 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b354 )
    ( on b534 b354 )
    ( on b769 b534 )
    ( on b726 b769 )
    ( on b674 b726 )
    ( on b676 b674 )
    ( on b332 b676 )
    ( on b620 b332 )
    ( on b813 b620 )
    ( on b971 b813 )
    ( on b218 b971 )
    ( clear b218 )
  )
  ( :goal
    ( and
      ( clear b354 )
    )
  )
)
