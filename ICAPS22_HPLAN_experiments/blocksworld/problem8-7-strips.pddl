( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b521 - block
    b219 - block
    b243 - block
    b415 - block
    b770 - block
    b242 - block
    b680 - block
    b143 - block
    b397 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b521 )
    ( on b219 b521 )
    ( on b243 b219 )
    ( on b415 b243 )
    ( on b770 b415 )
    ( on b242 b770 )
    ( on b680 b242 )
    ( on b143 b680 )
    ( on b397 b143 )
    ( clear b397 )
  )
  ( :goal
    ( and
      ( clear b521 )
    )
  )
)
