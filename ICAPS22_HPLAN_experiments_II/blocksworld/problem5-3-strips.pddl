( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b676 - block
    b607 - block
    b653 - block
    b307 - block
    b336 - block
    b221 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b676 )
    ( on b607 b676 )
    ( on b653 b607 )
    ( on b307 b653 )
    ( on b336 b307 )
    ( on b221 b336 )
    ( clear b221 )
  )
  ( :goal
    ( and
      ( clear b676 )
    )
  )
)
