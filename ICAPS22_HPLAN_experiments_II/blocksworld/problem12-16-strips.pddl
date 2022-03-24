( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b403 - block
    b849 - block
    b633 - block
    b966 - block
    b462 - block
    b9 - block
    b710 - block
    b416 - block
    b834 - block
    b528 - block
    b297 - block
    b598 - block
    b263 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b403 )
    ( on b849 b403 )
    ( on b633 b849 )
    ( on b966 b633 )
    ( on b462 b966 )
    ( on b9 b462 )
    ( on b710 b9 )
    ( on b416 b710 )
    ( on b834 b416 )
    ( on b528 b834 )
    ( on b297 b528 )
    ( on b598 b297 )
    ( on b263 b598 )
    ( clear b263 )
  )
  ( :goal
    ( and
      ( clear b403 )
    )
  )
)
