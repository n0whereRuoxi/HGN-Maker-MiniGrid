( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b321 - block
    b654 - block
    b446 - block
    b523 - block
    b434 - block
    b249 - block
    b611 - block
    b625 - block
    b690 - block
    b678 - block
    b190 - block
    b665 - block
    b578 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b321 )
    ( on b654 b321 )
    ( on b446 b654 )
    ( on b523 b446 )
    ( on b434 b523 )
    ( on b249 b434 )
    ( on b611 b249 )
    ( on b625 b611 )
    ( on b690 b625 )
    ( on b678 b690 )
    ( on b190 b678 )
    ( on b665 b190 )
    ( on b578 b665 )
    ( clear b578 )
  )
  ( :goal
    ( and
      ( clear b321 )
    )
  )
)
