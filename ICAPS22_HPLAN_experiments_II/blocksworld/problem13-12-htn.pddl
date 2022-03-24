( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b748 - block
    b95 - block
    b535 - block
    b749 - block
    b282 - block
    b997 - block
    b582 - block
    b153 - block
    b439 - block
    b567 - block
    b509 - block
    b913 - block
    b254 - block
    b736 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b748 )
    ( on b95 b748 )
    ( on b535 b95 )
    ( on b749 b535 )
    ( on b282 b749 )
    ( on b997 b282 )
    ( on b582 b997 )
    ( on b153 b582 )
    ( on b439 b153 )
    ( on b567 b439 )
    ( on b509 b567 )
    ( on b913 b509 )
    ( on b254 b913 )
    ( on b736 b254 )
    ( clear b736 )
  )
  ( :tasks
    ( Make-13Pile b95 b535 b749 b282 b997 b582 b153 b439 b567 b509 b913 b254 b736 )
  )
)
