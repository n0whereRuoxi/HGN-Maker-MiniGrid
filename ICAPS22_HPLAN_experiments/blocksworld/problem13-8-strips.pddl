( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b765 - block
    b394 - block
    b957 - block
    b542 - block
    b981 - block
    b674 - block
    b778 - block
    b543 - block
    b571 - block
    b328 - block
    b828 - block
    b409 - block
    b204 - block
    b377 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b765 )
    ( on b394 b765 )
    ( on b957 b394 )
    ( on b542 b957 )
    ( on b981 b542 )
    ( on b674 b981 )
    ( on b778 b674 )
    ( on b543 b778 )
    ( on b571 b543 )
    ( on b328 b571 )
    ( on b828 b328 )
    ( on b409 b828 )
    ( on b204 b409 )
    ( on b377 b204 )
    ( clear b377 )
  )
  ( :goal
    ( and
      ( clear b765 )
    )
  )
)
