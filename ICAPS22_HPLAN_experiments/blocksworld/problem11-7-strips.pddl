( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b570 - block
    b398 - block
    b644 - block
    b65 - block
    b485 - block
    b344 - block
    b9 - block
    b829 - block
    b306 - block
    b704 - block
    b969 - block
    b194 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b570 )
    ( on b398 b570 )
    ( on b644 b398 )
    ( on b65 b644 )
    ( on b485 b65 )
    ( on b344 b485 )
    ( on b9 b344 )
    ( on b829 b9 )
    ( on b306 b829 )
    ( on b704 b306 )
    ( on b969 b704 )
    ( on b194 b969 )
    ( clear b194 )
  )
  ( :goal
    ( and
      ( clear b570 )
    )
  )
)
